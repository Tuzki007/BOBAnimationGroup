//
//  BOBLoadingNieDiamondView.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/5.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLoadingNieDiamondView.h"

/**菱形飞出*/
#define kAnimationGoKey @"zxcAniGo"
/**菱形飞回*/
#define kAnimationBackKey @"zxcAniBack"
/**时间*/
#define kDiamondTime 0.25

//9个菱形飞行动画
@interface BOBLoadingNieDiamondView()<CAAnimationDelegate>

@property (nonatomic, strong) NSMutableArray *pointMutArray;
/**小菱形向外飞*/
@property (nonatomic, strong) NSMutableArray <CAKeyframeAnimation *>*animationGoMutArray;
/**小菱形回来*/
@property (nonatomic, strong) NSMutableArray <CAKeyframeAnimation *>*animationBackMutArray;
/**小菱形layer*/
@property (nonatomic, strong) NSMutableArray <CALayer *>*layerMutArray;
/**Animation-GoKey*/
@property (nonatomic, strong) NSMutableArray <NSString *>*keyGoMutArray;
/**Animation-BackKey*/
@property (nonatomic, strong) NSMutableArray <NSString *>*keyBackMutArray;

@property (nonatomic, strong) BOBLittleDiamondView *diamondBigView;
@property (nonatomic, assign) CGFloat nieDiamondViewWidth;
@property (nonatomic, assign) CGFloat nieDiamondViewHeight;

@end

@implementation BOBLoadingNieDiamondView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.animationGoMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.animationBackMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.layerMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.keyGoMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.keyBackMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.nieDiamondViewWidth = self.frame.size.width;
        self.nieDiamondViewHeight = self.frame.size.height;
        NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2, self.nieDiamondViewHeight/2 - 50)];
        NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2 + 50, self.nieDiamondViewHeight/2 - 50)];
        NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2 + 50, self.nieDiamondViewHeight/2)];
        NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2 + 50, self.nieDiamondViewHeight/2 + 50)];
        NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2, self.nieDiamondViewHeight/2 + 50)];
        NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2 - 50, self.nieDiamondViewHeight/2 + 50)];
        NSValue *value7 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2 - 50, self.nieDiamondViewHeight/2)];
        NSValue *value8 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2 - 50, self.nieDiamondViewHeight/2 - 50)];
        self.pointMutArray = [[NSMutableArray alloc]initWithObjects:value1,value2,value3,value4,value5,value6,value7,value8, nil];
        [self createNieDiamondViewUI];
    }
    return self;
}

- (void)createNieDiamondViewUI
{
    //小菱形飞出
    for (int i = 0; i < 8; i++) {
        NSValue *pointValue = [self.pointMutArray objectAtIndex:i];
        CAKeyframeAnimation *positionKeyAni = [CAKeyframeAnimation animation];
        positionKeyAni.delegate = self;
        positionKeyAni.keyPath = @"position";
        positionKeyAni.duration = kDiamondTime;
        positionKeyAni.repeatCount = 1;
        NSValue *pathValue1 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2, self.nieDiamondViewHeight/2)];
        NSValue *pathValue2 = pointValue;
        positionKeyAni.removedOnCompletion = NO;
        positionKeyAni.fillMode = kCAFillModeForwards;
        
        positionKeyAni.values = @[pathValue1,pathValue2,pathValue2];
        positionKeyAni.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0]];
        positionKeyAni.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [self.animationGoMutArray addObject:positionKeyAni];
    }
    
    //小菱形飞回
    for (int i = 0; i < 8; i++) {
        NSValue *pointValue = [self.pointMutArray objectAtIndex:i];
        CAKeyframeAnimation *positionKeyAni = [CAKeyframeAnimation animation];
        positionKeyAni.delegate = self;
        positionKeyAni.keyPath = @"position";
        positionKeyAni.duration = kDiamondTime;
        positionKeyAni.repeatCount = 1;
        NSValue *pathValue1 = pointValue;
        NSValue *pathValue2 = [NSValue valueWithCGPoint:CGPointMake(self.nieDiamondViewWidth/2, self.nieDiamondViewHeight/2)];
        positionKeyAni.removedOnCompletion = NO;
        positionKeyAni.fillMode = kCAFillModeForwards;
        
        positionKeyAni.values = @[pathValue1,pathValue2,pathValue2];
        positionKeyAni.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0]];
        positionKeyAni.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [self.animationBackMutArray addObject:positionKeyAni];
    }
    
    //1、小菱形动画及UI
    for (int i = 0; i < 8; i++) {
        CALayer *smallDiamond = [CAShapeLayer layer];
        smallDiamond.frame = CGRectMake(self.nieDiamondViewWidth/2 - 12.5, self.nieDiamondViewHeight/2 - 12.5, 25, 25);
        smallDiamond.contents = (id)[UIImage imageNamed:@"lingxing"].CGImage;
        [self.layer addSublayer:smallDiamond];
        [self.layerMutArray addObject:smallDiamond];
        NSString *animationKey = [kAnimationGoKey stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        [self.keyGoMutArray addObject:animationKey];
        
        NSString *animationBackKey = [kAnimationBackKey stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        [self.keyBackMutArray addObject:animationBackKey];
        
        if (i == 0) {
            CAKeyframeAnimation *positionKeyAni = [self.animationGoMutArray objectAtIndex:i];
            [smallDiamond addAnimation:positionKeyAni forKey:animationKey];
        }
    }
    
//    CALayer *smallDiamond1 = self.layerMutArray.firstObject;
//    NSString *animationKey = [kAnimationKey stringByAppendingString:@"0"];
//    [smallDiamond1 addAnimation:positionKeyAni forKey:animationKey];

    //2、大菱形UI
    self.diamondBigView = [[BOBLittleDiamondView alloc]initWithFrame:CGRectMake(self.nieDiamondViewWidth/2 - 25, self.nieDiamondViewHeight/2 - 25, 50, 50)];
    [self addSubview:self.diamondBigView];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    for (int i = 0; i < self.layerMutArray.count; i++) {
        CALayer *layer = self.layerMutArray[i];
        NSString *animationGoKey = self.keyGoMutArray[i];
        NSString *animationBackKey = self.keyBackMutArray[i];

        if ([layer animationForKey:animationGoKey] == anim) {
            if (i != self.layerMutArray.count - 1) {
                CALayer *layer = self.layerMutArray[i + 1];
                NSString *animationKey = self.keyGoMutArray[i + 1];
                CAKeyframeAnimation *positionKeyAni = [self.animationGoMutArray objectAtIndex:i + 1];
                [layer addAnimation:positionKeyAni forKey:animationKey];
                break;
            }else{
                CALayer *layer = self.layerMutArray[0];
                NSString *animationKey = self.keyBackMutArray[0];
                CAKeyframeAnimation *positionKeyAni = [self.animationBackMutArray objectAtIndex:0];
                [layer addAnimation:positionKeyAni forKey:animationKey];
                break;
            }
        }
        if ([layer animationForKey:animationBackKey] == anim) {
            if (i != self.layerMutArray.count - 1) {
                CALayer *layer = self.layerMutArray[i + 1];
                NSString *animationKey = self.keyBackMutArray[i + 1];
                CAKeyframeAnimation *positionKeyAni = [self.animationBackMutArray objectAtIndex:i + 1];
                [layer addAnimation:positionKeyAni forKey:animationKey];
                break;
            }else{
                CALayer *layer = self.layerMutArray[0];
                NSString *animationKey = self.keyGoMutArray[0];
                CAKeyframeAnimation *positionKeyAni = [self.animationGoMutArray objectAtIndex:0];
                [layer addAnimation:positionKeyAni forKey:animationKey];
            }
        }
    }
}

@end


/**小菱形*/
@interface BOBLittleDiamondView()

@property (nonatomic, assign) CGFloat diamondViewWidth;
@property (nonatomic, assign) CGFloat diamondViewHeight;

/**1、大菱形Bounds*/
@property (strong, nonatomic) CAKeyframeAnimation *bigDiamondAnimation;
/**1、大菱形Bounds*/
//@property (strong, nonatomic) CABasicAnimation *bigDiamondAnimation;

@end

@implementation BOBLittleDiamondView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.diamondViewWidth = self.frame.size.width;
        self.diamondViewHeight = self.frame.size.height;
        [self createLittleDiamondViewUI];
    }
    return self;
}

- (void)createLittleDiamondViewUI
{
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(self.diamondViewWidth/2, 0)];
//    [path addLineToPoint:CGPointMake(self.diamondViewWidth, self.diamondViewHeight/2)];
//    [path addLineToPoint:CGPointMake(self.diamondViewWidth/2, self.diamondViewHeight)];
//    [path addLineToPoint:CGPointMake(0, self.diamondViewHeight/2)];
//    [path closePath];
    
    self.diamondLayer = [CAShapeLayer layer];
    self.diamondLayer.frame = CGRectMake(0, 0, self.diamondViewWidth, self.diamondViewHeight);
    self.diamondLayer.contents = (id)[UIImage imageNamed:@"lingxing"].CGImage;
    [self.diamondLayer setAnchorPoint:CGPointMake(0.5, 0.5)];
    //    self.diamondLayer.path = path.CGPath;
//    self.diamondLayer.fillColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:self.diamondLayer];
    
    //2、大菱形动画
    self.bigDiamondAnimation = [CAKeyframeAnimation animation];
    self.bigDiamondAnimation.keyPath = @"bounds";
    self.bigDiamondAnimation.duration = 4;
    self.bigDiamondAnimation.repeatCount = INT32_MAX;
    NSValue *boundsBeatValue1 = [NSValue valueWithCGRect:CGRectMake(0, 0, self.diamondViewWidth, self.diamondViewHeight)];
    NSValue *boundsBeatValue2 = [NSValue valueWithCGRect:CGRectMake(20, 20, self.diamondViewWidth - 20, self.diamondViewHeight - 20)];
    NSValue *boundsBeatValue3 = [NSValue valueWithCGRect:CGRectMake(0, 0, self.diamondViewWidth, self.diamondViewHeight)];
    self.bigDiamondAnimation.values = @[boundsBeatValue1,boundsBeatValue2,boundsBeatValue3];
    self.bigDiamondAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0]];
    [self.diamondLayer addAnimation:self.bigDiamondAnimation forKey:@"zxc-diamond-boudns"];
    
//    self.diamondLayer = [CAShapeLayer layer];
//    self.diamondLayer.frame = CGRectMake(0, 0, self.diamondViewWidth, self.diamondViewHeight);
//    self.diamondLayer.contents = (id)[UIImage imageNamed:@"lingxing"].CGImage;
//    [self.diamondLayer setAnchorPoint:CGPointMake(0.5, 0.5)];
////    self.diamondLayer.path = path.CGPath;
//    self.diamondLayer.fillColor = [UIColor lightGrayColor].CGColor;
//    [self.layer addSublayer:self.diamondLayer];
//
//    //2、大菱形动画
//    self.bigDiamondAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    self.bigDiamondAnimation.duration = 1.5;
//    self.bigDiamondAnimation.repeatCount = INT32_MAX;
//    self.bigDiamondAnimation.autoreverses = YES;
//    self.bigDiamondAnimation.removedOnCompletion = NO;
//    self.bigDiamondAnimation.fromValue = @(1.0);
//    self.bigDiamondAnimation.toValue = @(0.5);
//    [self.diamondLayer addAnimation:self.bigDiamondAnimation forKey:@"zxc-diamond-boudns"];
}

@end
