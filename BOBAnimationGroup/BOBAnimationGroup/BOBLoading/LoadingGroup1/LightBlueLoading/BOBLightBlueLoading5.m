//
//  BOBLightBlueLoading5.m
//  BOBAnimationGroup
//
//  Created by Orange on 2019/11/23.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLightBlueLoading5.h"

#define kPacManWidth 50.0f

#define kBeanWidth 15.0f

#define kBeanSpacingWidth 20.0f

@interface BOBLightBlueLoading5()<CAAnimationDelegate>

/**定时操作用于RunLoop定时*/
@property (nonatomic, strong) NSTimer *beanTimer;

@property (nonatomic, assign) int beanNumber;

@property (nonatomic, strong) NSMutableArray <CALayer*>*planetStarLayerMutArray;

@end

@implementation BOBLightBlueLoading5

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kBOBLightBlueColor;
        self.beanNumber = 0;
        self.planetStarLayerMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.beanTimer = [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(beanTimeDifference) userInfo:nil repeats: YES];
        [[NSRunLoop mainRunLoop] addTimer:self.beanTimer forMode:NSRunLoopCommonModes];
        [self createBOBLightBlueLoading5UI];
    }
    return self;
}

- (void)createBOBLightBlueLoading5UI
{
    //1、吃豆人
    //吃豆人上面的嘴
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPath];
    [bezierPath1 addArcWithCenter:CGPointMake(kScreenWidth/2,kScreenHeight/2) radius:kPacManWidth/2 startAngle:0.5 * M_PI endAngle:2 * M_PI clockwise:YES];
    layer1.path = bezierPath1.CGPath;
    layer1.lineWidth = kPacManWidth;
    layer1.strokeColor = [UIColor whiteColor].CGColor;
    layer1.fillColor = [UIColor clearColor].CGColor;
    //默认
    layer1.lineCap = kCALineCapButt;
    [self.layer addSublayer:layer1];

    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = 0.4;
    strokeEndAnimation.repeatCount = INT32_MAX;
    strokeEndAnimation.autoreverses = YES;
    strokeEndAnimation.fromValue = @(0.85f);
    strokeEndAnimation.toValue = @(1.0f);
    [layer1 addAnimation:strokeEndAnimation forKey:@"basic"];
    
    //吃豆人下面的嘴
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPath];
    [bezierPath2 addArcWithCenter:CGPointMake(kScreenWidth/2,kScreenHeight/2) radius:kPacManWidth/2 startAngle:0.5 * M_PI endAngle:2 * M_PI clockwise:NO];
    layer2.path = bezierPath2.CGPath;
    layer2.lineWidth = kPacManWidth;
    layer2.strokeColor = [UIColor whiteColor].CGColor;
    layer2.fillColor = [UIColor clearColor].CGColor;
    //默认
    layer2.lineCap = kCALineCapButt;
    [self.layer addSublayer:layer2];
    
    CABasicAnimation *strokeEndAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation2.duration = 0.4;
    strokeEndAnimation2.repeatCount = INT32_MAX;
    strokeEndAnimation2.autoreverses = YES;
    strokeEndAnimation2.fromValue = @(0.5f);
    strokeEndAnimation2.toValue = @(1.0f);
    [layer2 addAnimation:strokeEndAnimation2 forKey:@"basic"];
    
    //2、被吃的豆
    
    for (int i = 0; i < 3; i ++) {
        CALayer *planetStarLayer = [CALayer layer];
        planetStarLayer.cornerRadius = kBeanWidth/2;
        planetStarLayer.backgroundColor = [UIColor whiteColor].CGColor;
        planetStarLayer.frame = CGRectMake((kScreenWidth - kBeanWidth)/2 + (kPacManWidth - kBeanWidth) + i * (kBeanWidth + kBeanSpacingWidth), (kScreenHeight - kBeanWidth)/2, kBeanWidth, kBeanWidth);
        [self.layer addSublayer:planetStarLayer];
        [self.planetStarLayerMutArray addObject:planetStarLayer];
        
//        UIBezierPath *beanBezierPath = [UIBezierPath bezierPath];
//        [beanBezierPath moveToPoint:CGPointMake(kScreenWidth/2 + (kPacManWidth - kBeanWidth) + i * (kBeanWidth + kBeanSpacingWidth), kScreenHeight/2)];
//        [beanBezierPath addLineToPoint:CGPointMake(kScreenWidth/2 + (kPacManWidth - kBeanWidth), kScreenHeight/2)];
//
//        CAKeyframeAnimation *beanMoveAnimation = [CAKeyframeAnimation animation];
//        beanMoveAnimation.delegate = self;
//        beanMoveAnimation.path = beanBezierPath.CGPath;
//        beanMoveAnimation.keyPath = @"position";
//        beanMoveAnimation.duration = 0.8;
//        beanMoveAnimation.repeatCount = INT32_MAX;
//        beanMoveAnimation.removedOnCompletion = NO;
//        beanMoveAnimation.fillMode = kCAFillModeForwards;
//        [planetStarLayer addAnimation:beanMoveAnimation forKey:@"up-down_move-animation-key"];
    }
    
}

- (void)beanTimeDifference
{
//    if (self.beanNumber > 0 && self.beanNumber < 4) {
//        CALayer *planetStarLayer = [self.planetStarLayerMutArray objectAtIndex:self.beanNumber - 1];
//        UIBezierPath *beanBezierPath = [UIBezierPath bezierPath];
//        [beanBezierPath moveToPoint:CGPointMake(kScreenWidth/2 + (kPacManWidth - kBeanWidth) + self.beanNumber - 1 * (kBeanWidth + kBeanSpacingWidth), kScreenHeight/2)];
//        [beanBezierPath addLineToPoint:CGPointMake(kScreenWidth/2 + (kPacManWidth - kBeanWidth), kScreenHeight/2)];
//        
//        CAKeyframeAnimation *beanMoveAnimation = [CAKeyframeAnimation animation];
//        beanMoveAnimation.delegate = self;
//        beanMoveAnimation.path = beanBezierPath.CGPath;
//        beanMoveAnimation.keyPath = @"position";
//        beanMoveAnimation.duration = 0.8;
//        beanMoveAnimation.repeatCount = INT32_MAX;
//        beanMoveAnimation.removedOnCompletion = NO;
//        beanMoveAnimation.fillMode = kCAFillModeForwards;
//        [planetStarLayer addAnimation:beanMoveAnimation forKey:@"up-down_move-animation-key"];
//    }
    self.beanNumber ++;
}

@end
