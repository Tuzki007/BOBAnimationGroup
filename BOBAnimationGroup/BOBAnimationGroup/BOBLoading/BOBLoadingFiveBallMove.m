//
//  BOBLoadingFiveBallMove.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/13.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLoadingFiveBallMove.h"

#define kBallWidthHeight 15
#define kLeftMoveAnimationDurtion 1.15f
#define kUpMoveAnimationDurtion 1.2f
//#define kLeftMoveAnimationDurtion 0.25f
//#define kUpMoveAnimationDurtion 0.3f

//5个球移动洗脑动画
@interface BOBLoadingFiveBallMove()<CAAnimationDelegate>

/**五个球layer数组*/
@property (nonatomic, strong) NSMutableArray <CALayer *>*fiveBallLayerMutArray;
/**五个球layer数组*/
@property (nonatomic, strong) NSMutableArray <UIBezierPath *>*fiveBallPathMutArray;
/**上下移动动画*/
@property (nonatomic, strong) CAKeyframeAnimation *upDownMoveAnimation;
/**五个球layer数组*/
@property (nonatomic, strong) NSMutableArray <CAKeyframeAnimation *>*leftMoveAnimationMutArray;

@property (nonatomic, assign) CGFloat nieDiamondViewWidth;
@property (nonatomic, assign) CGFloat nieDiamondViewHeight;

@end

@implementation BOBLoadingFiveBallMove

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nieDiamondViewWidth = self.frame.size.width;
        self.nieDiamondViewHeight = self.frame.size.height;
        self.fiveBallLayerMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.fiveBallPathMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.leftMoveAnimationMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        [self createFiveBallMoveUI];
    }
    return self;
}

- (void)createFiveBallMoveUI
{
    for (int i = 0; i < 5; i++) {
        CALayer *littleBall = [CAShapeLayer layer];
        littleBall.cornerRadius = kBallWidthHeight/2;
        littleBall.backgroundColor = [UIColor lightGrayColor].CGColor;
        littleBall.frame = CGRectMake((self.nieDiamondViewWidth - kBallWidthHeight)/2 - (kBallWidthHeight + 2) * 2 + (kBallWidthHeight + 2) * i, self.nieDiamondViewHeight/2 - kBallWidthHeight/2, kBallWidthHeight, kBallWidthHeight);
        [self.layer addSublayer:littleBall];
        [self.fiveBallLayerMutArray addObject:littleBall];
        
        if (i != 0) {
            UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
//            [bezierPath moveToPoint:CGPointMake(littleBall.frame.origin.x + kBallWidthHeight/2, littleBall.frame.origin.x + kBallWidthHeight/2)];
//            [bezierPath addLineToPoint:CGPointMake(littleBall.frame.origin.x + kBallWidthHeight/2 - kBallWidthHeight, littleBall.frame.origin.x + kBallWidthHeight/2)];
            [bezierPath moveToPoint:CGPointMake(self.nieDiamondViewWidth/2 - (kBallWidthHeight + 2) * 2 + (kBallWidthHeight + 2) * i, self.nieDiamondViewHeight/2)];
            [bezierPath addLineToPoint:CGPointMake(self.nieDiamondViewWidth/2 - (kBallWidthHeight + 2) * 2 + (kBallWidthHeight + 2) * i - kBallWidthHeight, self.nieDiamondViewHeight/2)];
            [self.fiveBallPathMutArray addObject:bezierPath];
            
            CAKeyframeAnimation *leftMoveAnimation = [CAKeyframeAnimation animation];
            leftMoveAnimation.delegate = self;
            leftMoveAnimation.keyPath = @"position";
            leftMoveAnimation.duration = kLeftMoveAnimationDurtion;
            leftMoveAnimation.repeatCount = 1;
            leftMoveAnimation.removedOnCompletion = NO;
            leftMoveAnimation.fillMode = kCAFillModeForwards;
            [self.leftMoveAnimationMutArray addObject:leftMoveAnimation];
            leftMoveAnimation.path = bezierPath.CGPath;
            [littleBall addAnimation:leftMoveAnimation forKey:@"left-move-animation-key"];
        }
    }
    
    UIBezierPath *bezierPath1 = [[UIBezierPath alloc] init];
    [bezierPath1 moveToPoint:CGPointMake((self.nieDiamondViewWidth)/2 - (kBallWidthHeight + 2) * 2 + (kBallWidthHeight + 2) * 0, self.nieDiamondViewHeight/2)];
    [bezierPath1 addLineToPoint:CGPointMake((self.nieDiamondViewWidth)/2 - (kBallWidthHeight + 2) * 2 + (kBallWidthHeight + 2) * 0, self.nieDiamondViewHeight/2 - 2 - kBallWidthHeight)];
    [bezierPath1 addLineToPoint:CGPointMake((self.nieDiamondViewWidth)/2 - (kBallWidthHeight + 2) * 2 + (kBallWidthHeight + 2) * 4 + 2, self.nieDiamondViewHeight/2 - 2 - kBallWidthHeight)];
    [bezierPath1 addLineToPoint:CGPointMake((self.nieDiamondViewWidth)/2 - (kBallWidthHeight + 2) * 2 + (kBallWidthHeight + 2) * 4 + 2, self.nieDiamondViewHeight/2)];
    
    self.upDownMoveAnimation = [CAKeyframeAnimation animation];
    self.upDownMoveAnimation.delegate = self;
    self.upDownMoveAnimation.path = bezierPath1.CGPath;
    self.upDownMoveAnimation.keyPath = @"position";
    self.upDownMoveAnimation.duration = kUpMoveAnimationDurtion;
    self.upDownMoveAnimation.repeatCount = 1;
    self.upDownMoveAnimation.removedOnCompletion = NO;
    self.upDownMoveAnimation.fillMode = kCAFillModeForwards;
    
    CALayer *littleBall1 = self.fiveBallLayerMutArray.firstObject;
    [littleBall1 addAnimation:self.upDownMoveAnimation forKey:@"up-down_move-animation-key"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CALayer *littleBall1 = self.fiveBallLayerMutArray.firstObject;
    if ([littleBall1 animationForKey:@"up-down_move-animation-key"] == anim) {
        [self.fiveBallLayerMutArray insertObject:littleBall1 atIndex:self.fiveBallLayerMutArray.count - 1];
        [self.fiveBallLayerMutArray removeObjectAtIndex:0];
        CALayer *littleBall1 = self.fiveBallLayerMutArray.firstObject;
        [littleBall1 addAnimation:self.upDownMoveAnimation forKey:@"up-down_move-animation-key"];
        
        for (int i = 0; i < 5; i++) {
            if (i != 0) {
                CALayer *littleBall = [self.fiveBallLayerMutArray objectAtIndex:i];
                UIBezierPath *bezierPath = [self.fiveBallPathMutArray objectAtIndex:i - 1];
                CAKeyframeAnimation *leftMoveAnimation = [self.leftMoveAnimationMutArray objectAtIndex:i - 1];
                leftMoveAnimation.path = bezierPath.CGPath;
                [littleBall addAnimation:leftMoveAnimation forKey:@"left-move-animation-key"];
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
