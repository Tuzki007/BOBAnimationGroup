//
//  BOBLoadingEightArcView.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/13.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLoadingEightArcView.h"

//圆弧Layer的宽
#define kBigArcWidth 80
//间距
#define kBigArcSpacing 2
//间距
#define kBigArcLindWidth 5

@interface BOBLoadingEightArcView()<CAAnimationDelegate>

/**上下移动动画*/
@property (nonatomic, strong) CAKeyframeAnimation *rotateAnimation;

@property (nonatomic, assign) CGFloat nieDiamondViewWidth;
@property (nonatomic, assign) CGFloat nieDiamondViewHeight;

@end

@implementation BOBLoadingEightArcView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nieDiamondViewWidth = self.frame.size.width;
        self.nieDiamondViewHeight = self.frame.size.height;
        [self createLoadingEightArcViewUI];
    }
    return self;
}

- (void)createLoadingEightArcViewUI
{
//    UIBezierPath *apath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:40 startAngle:0.75 * M_PI endAngle:1.25 * M_PI clockwise:YES];
//    CAShapeLayer *arcLayer = [[CAShapeLayer alloc] init];
//    arcLayer.frame = CGRectMake((self.nieDiamondViewWidth - 80)/2, (self.nieDiamondViewHeight - 80)/2, 80, 80);
//    arcLayer.path = apath.CGPath;
//    arcLayer.fillColor = [UIColor clearColor].CGColor;
//    arcLayer.strokeColor = [UIColor greenColor].CGColor;
//    arcLayer.lineWidth = 5;
//    arcLayer.lineCap = kCALineCapRound;
//    [self.layer addSublayer:arcLayer];
    
    self.rotateAnimation = [CAKeyframeAnimation animation];
    self.rotateAnimation.delegate = self;
    self.rotateAnimation.keyPath = @"transform.rotation.z";
    self.rotateAnimation.duration = 3;
    self.rotateAnimation.repeatCount = INT32_MAX;
//    self.rotateAnimation.removedOnCompletion = NO;
//    self.rotateAnimation.fillMode = kCAFillModeForwards;

    //创建UIBezierPath
    for (int i = 0; i < 4; i++) {
        UIBezierPath *apath = [UIBezierPath bezierPathWithArcCenter:CGPointMake((kBigArcWidth - (kBigArcSpacing * 2 + kBigArcLindWidth * 2) * i)/2, (kBigArcWidth - (kBigArcSpacing * 2 + kBigArcLindWidth * 2) * i)/2) radius:kBigArcWidth/2 - (kBigArcSpacing + kBigArcLindWidth) * i startAngle:0.75 * M_PI endAngle:1.25 * M_PI clockwise:YES];
        
        CAShapeLayer *arcLayer = [[CAShapeLayer alloc] init];
        arcLayer.frame = CGRectMake((self.nieDiamondViewWidth - (kBigArcWidth - (kBigArcSpacing * 2 + kBigArcLindWidth * 2) * i))/2, (self.nieDiamondViewHeight - (kBigArcWidth - (kBigArcSpacing * 2 + kBigArcLindWidth * 2) * i))/2, kBigArcWidth - (kBigArcSpacing * 2 + kBigArcLindWidth * 2) * i, kBigArcWidth - (kBigArcSpacing * 2 + kBigArcLindWidth * 2) * i);
        arcLayer.path = apath.CGPath;
        arcLayer.fillColor = [UIColor clearColor].CGColor;
//        arcLayer.strokeColor = [UIColor greenColor].CGColor;
        if (i == 0) {
           arcLayer.strokeColor = [UIColor greenColor].CGColor;
        }else if (i == 1){
            arcLayer.strokeColor = [UIColor purpleColor].CGColor;
        }else if (i == 2){
            arcLayer.strokeColor = [UIColor redColor].CGColor;
        }else if (i == 3){
            arcLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        }
        arcLayer.lineWidth = 5;
        arcLayer.lineCap = kCALineCapRound;
        self.rotateAnimation.path = apath.CGPath;
        [arcLayer addAnimation:self.rotateAnimation forKey:[NSString stringWithFormat:@"rotate-animation-%d",i]];
        [self.layer addSublayer:arcLayer];
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
