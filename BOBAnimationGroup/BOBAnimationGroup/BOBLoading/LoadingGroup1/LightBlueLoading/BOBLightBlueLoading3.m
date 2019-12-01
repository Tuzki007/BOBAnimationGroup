//
//  BOBLightBlueLoading3.m
//  BOBAnimationGroup
//
//  Created by Orange on 2019/11/23.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLightBlueLoading3.h"

#define kBallWidth 10.0f

#define kBigBallR 50.0f

#define kBigBallRRadicalSign2 50.0f / 1.414

@interface BOBLightBlueLoading3 ()<CAAnimationDelegate>

@end

@implementation BOBLightBlueLoading3

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:176.0/255.0 blue:245.0/255.0 alpha:1.0f];
        self.backgroundColor = kBOBLightBlueColor;
        [self createBOBLightBlueLoading3UI];
    }
    return self;
}

- (void)createBOBLightBlueLoading3UI
{
    UIView *backgroudnColorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kBallWidth, kBallWidth)];
    backgroudnColorView.backgroundColor = [UIColor whiteColor];
    backgroudnColorView.clipsToBounds = YES;
    backgroudnColorView.layer.masksToBounds = YES;
    backgroudnColorView.layer.cornerRadius = kBallWidth/2;
    UIImage *backgroudnImage = [BOBLoadingTool convertViewToImage:backgroudnColorView];
    UIGraphicsBeginImageContextWithOptions(backgroudnImage.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, backgroudnImage.size.width, backgroudnImage.size.height)];
    [path addClip];
    [backgroudnImage drawAtPoint:CGPointZero];
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    for (int i = 0; i < 8; i ++) {
        CALayer *planetStarLayer = [CALayer layer];
        if (i == 0) {
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2 - kBigBallR, (kScreenHeight - kBallWidth)/2, kBallWidth, kBallWidth);
        }else if (i == 1){
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2 - kBigBallRRadicalSign2, (kScreenHeight - kBallWidth)/2 - kBigBallRRadicalSign2, kBallWidth, kBallWidth);
        }else if (i == 2){
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2, (kScreenHeight - kBallWidth)/2 - kBigBallR, kBallWidth, kBallWidth);
        }else if (i == 3){
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2 + kBigBallRRadicalSign2 + kBallWidth/2, (kScreenHeight - kBallWidth)/2 - kBigBallRRadicalSign2, kBallWidth, kBallWidth);
        }else if (i == 4){
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2 + kBigBallR + kBallWidth/2, (kScreenHeight - kBallWidth)/2, kBallWidth, kBallWidth);
        }else if (i == 5){
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2 + kBigBallRRadicalSign2 + kBallWidth/2, (kScreenHeight - kBallWidth)/2 + kBigBallRRadicalSign2, kBallWidth, kBallWidth);
        }else if (i == 6){
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2, (kScreenHeight - kBallWidth)/2 + kBigBallR, kBallWidth, kBallWidth);
        }else if (i == 7){
            planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2 - kBigBallRRadicalSign2, (kScreenHeight - kBallWidth)/2 + kBigBallRRadicalSign2, kBallWidth, kBallWidth);
        }
        
        planetStarLayer.contents = (id)clipImage.CGImage;
        planetStarLayer.masksToBounds = YES;
        [self.layer addSublayer:planetStarLayer];
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.delegate = self;
        animation.keyPath = @"bounds";
        NSValue *boundsBeatValue1 = [NSValue valueWithCGRect:CGRectMake(0, 0, kBallWidth, kBallWidth)];
        NSValue *boundsBeatValue2 = [NSValue valueWithCGRect:CGRectMake(0, 0, kBallWidth * 2, kBallWidth * 2)];
        animation.values = @[boundsBeatValue1,boundsBeatValue2,boundsBeatValue1];
        animation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.1 + i * 0.1],[NSNumber numberWithFloat:1.0]];
        animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        
        CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        NSNumber *opacityNumber1 = [NSNumber numberWithFloat:0.3];
        NSNumber *opacityNumber2 = [NSNumber numberWithFloat:1];
        opacityAnimation.values = @[opacityNumber1,opacityNumber2,opacityNumber1];
        opacityAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.1 + i * 0.1],[NSNumber numberWithFloat:1.0]];
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.duration = 1.2;
        animationGroup.autoreverses = NO;//是否重播，原动画的倒播
        animationGroup.repeatCount = INT32_MAX;
        [animationGroup setAnimations:[NSArray arrayWithObjects:opacityAnimation, animation, nil]];
        
        [planetStarLayer addAnimation:animationGroup forKey:[NSString stringWithFormat:@"zxc-group-key-%d",i]];
    }
    
}

@end
