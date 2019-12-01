//
//  BOBLightBlueLoading1.m
//  BOBAnimationGroup
//
//  Created by Orange on 2019/11/23.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLightBlueLoading1.h"

#define kBallWidth 10.0f

#define kSpacingWidth 15.0f


@interface BOBLightBlueLoading1 ()<CAAnimationDelegate>

@end

@implementation BOBLightBlueLoading1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor colorWithRed:135.0/255.0 green:176.0/255.0 blue:245.0/255.0 alpha:1.0f];
        self.backgroundColor = kBOBLightBlueColor;
        [self createBOBLightBlueLoading1UI];
    }
    return self;
}

- (void)createBOBLightBlueLoading1UI
{
    UIView *backgroudnColorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kBallWidth, kBallWidth)];
    backgroudnColorView.backgroundColor = [UIColor whiteColor];
    backgroudnColorView.clipsToBounds = YES;
    backgroudnColorView.layer.masksToBounds = YES;
    backgroudnColorView.layer.cornerRadius = kBallWidth/2;
    UIImage *backgroudnImage = [self convertViewToImage:backgroudnColorView];
    UIGraphicsBeginImageContextWithOptions(backgroudnImage.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, backgroudnImage.size.width, backgroudnImage.size.height)];
    [path addClip];
    [backgroudnImage drawAtPoint:CGPointZero];
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    foregroundLayer.contents = (id)clipImage.CGImage;
    
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 3; i++) {
            //白球
            if (i == 1 && j == 1) {
                
            }else{
                CALayer *planetStarLayer = [CALayer layer];
                planetStarLayer.frame = CGRectMake((kScreenWidth - kBallWidth)/2 - kSpacingWidth - kBallWidth + i * (kBallWidth + kSpacingWidth), (kScreenHeight - kBallWidth)/2 - kSpacingWidth - kBallWidth + j * (kBallWidth + kSpacingWidth), kBallWidth, kBallWidth);
//                planetStarLayer.backgroundColor = [UIColor whiteColor].CGColor;
                planetStarLayer.contents = (id)clipImage.CGImage;
//                planetStarLayer.cornerRadius = kBallWidth/2;
                planetStarLayer.masksToBounds = YES;
                [self.layer addSublayer:planetStarLayer];
                
                CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
                animation.delegate = self;
                animation.keyPath = @"bounds";
                animation.duration = 1.2;
                animation.repeatCount = INT32_MAX;
                NSValue *boundsBeatValue1 = [NSValue valueWithCGRect:CGRectMake(0, 0, kBallWidth, kBallWidth)];
                NSValue *boundsBeatValue2 = [NSValue valueWithCGRect:CGRectMake(0, 0, kBallWidth * 1.5, kBallWidth * 1.5)];
                animation.values = @[boundsBeatValue1,boundsBeatValue2,boundsBeatValue1];
                animation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.2 + (i + j) * 0.1],[NSNumber numberWithFloat:1.0]];
                animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                                    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
                
                [planetStarLayer addAnimation:animation forKey:@"zxc-animation1"];
            }
        }
    }
}

//使用该方法不会模糊，根据屏幕密度计算
- (UIImage *)convertViewToImage:(UIView *)view {
    UIImage *imageRet = [[UIImage alloc]init];
    //UIGraphicsBeginImageContextWithOptions(区域大小, 是否是非透明的, 屏幕密度);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageRet;
}

@end
