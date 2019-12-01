//
//  BOBBallChangeTrangle.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/9/26.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBBallChangeTrangle.h"

//#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//
//#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface BOBBallChangeTrangle ()

@property (strong, nonatomic) CALayer *ballLayer;

/**旋转*/
@property (strong, nonatomic) CABasicAnimation *transformRotationAnimation;
/**形变*/
@property (strong, nonatomic) CAKeyframeAnimation *deformationAnimation;
/**动画组*/
@property (nonatomic, strong) CAAnimationGroup *strokeAnimationGroup;

@end

@implementation BOBBallChangeTrangle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    CGFloat ballx = (kScreenWidth - 60)/2;
    CGFloat bally = (kScreenHeight - 60)/2;
    
    self.ballLayer = [[CALayer alloc]init];
    self.ballLayer.frame = CGRectMake(ballx, bally, 60, 60);
    self.ballLayer.backgroundColor = [UIColor colorWithRed:117.0/255.0 green:250.0/255.0 blue:162.0/255.0 alpha:1.0f].CGColor;
    [self.ballLayer setCornerRadius:30];
    [self.layer addSublayer:self.ballLayer];
    
    self.transformRotationAnimation = [CABasicAnimation animation];
    self.transformRotationAnimation.keyPath = @"transform.rotation.z";
    self.transformRotationAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    self.transformRotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 2];
    
    self.deformationAnimation = [CAKeyframeAnimation animation];
    self.deformationAnimation.keyPath = @"bounds";
    self.deformationAnimation.duration = 1.4f;
//    self.deformationAnimation.beginTime = 1;
    NSValue *value1 = [NSValue valueWithCGRect:CGRectMake(ballx, bally, 60, 60)];
    NSValue *value2 = [NSValue valueWithCGRect:CGRectMake(ballx, bally, 60, 58)];
    NSValue *value3 = [NSValue valueWithCGRect:CGRectMake(ballx, bally , 60, 62)];
    NSValue *value4 = [NSValue valueWithCGRect:CGRectMake(ballx, bally, 60, 60)];
    self.deformationAnimation.values = @[value1,value2,value3,value4];
    self.deformationAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:1.0]];
    
    self.strokeAnimationGroup = [CAAnimationGroup animation];
    self.strokeAnimationGroup.duration = 1.4;
    self.strokeAnimationGroup.repeatCount = INFINITY;
    [self.strokeAnimationGroup setAnimations:@[self.deformationAnimation,self.transformRotationAnimation]];
    self.strokeAnimationGroup.removedOnCompletion = NO;
    [self.ballLayer addAnimation:_strokeAnimationGroup forKey:@"zxc"];
    
}

@end
