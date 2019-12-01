//
//  BOBLoadingGroupSub3.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/21.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLoadingGroupSub3.h"
#include <math.h>

#define kTimeDifference 0.2f
//10
#define kLittleBallWidth 14.0f

#define kBigBallWidth 24.0f
//40
#define kBallR 60.0f

@interface BOBLoadingGroupSub3 ()<CAAnimationDelegate>

/**向上飞*/
@property (nonatomic, strong) NSMutableArray *upBallMutArray;
/**向右飞*/
@property (nonatomic, strong) NSMutableArray *rightBallMutArray;
/**向下飞*/
@property (nonatomic, strong) NSMutableArray *downBallMutArray;
/**向左飞*/
@property (nonatomic, strong) NSMutableArray *leftBallMutArray;
/**定时操作用于RunLoop定时*/
@property (nonatomic, strong) NSTimer *ballTimer;

@property (nonatomic, assign) int ballTimerI;
@property (nonatomic, assign) int ballTimerJ;

@end

@implementation BOBLoadingGroupSub3

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ballTimerI = 0;
        self.ballTimerJ = 5;
        self.upBallMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.rightBallMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.downBallMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        self.leftBallMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        [self createLoadingGroupSub3UI];
    }
    return self;
}

- (void)createLoadingGroupSub3UI
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 6; j++) {
            CALayer *foregroundLayer = [CALayer layer];
            foregroundLayer.backgroundColor = [UIColor redColor].CGColor;
            foregroundLayer.cornerRadius = (kLittleBallWidth + j * 2)/2;
            foregroundLayer.masksToBounds = YES;
//            foregroundLayer.frame = CGRectMake((self.frame.size.width - (kBigBallWidth + j * 2))/2, (self.frame.size.height - (kLittleBallWidth + j * 2))/2, kLittleBallWidth + j * 2, kLittleBallWidth + j * 2);
            foregroundLayer.frame = CGRectMake((self.frame.size.width - (kBigBallWidth + j * 2))/2, (self.frame.size.height - (kLittleBallWidth + j * 2))/2, kLittleBallWidth + j * 2, kLittleBallWidth + j * 2);
            [self.layer addSublayer:foregroundLayer];
            if (j == 0) {
                foregroundLayer.backgroundColor = [UIColor colorWithRed:208.0/255.0 green:25.0/255.0 blue:5.0/255.0 alpha:1.0f].CGColor;
            }else if (j == 1){
                foregroundLayer.backgroundColor = [UIColor colorWithRed:252.0/255.0 green:86.0/255.0 blue:43.0/255.0 alpha:1.0f].CGColor;
            }else if (j == 2){
                foregroundLayer.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:145.0/255.0 blue:118.0/255.0 alpha:1.0f].CGColor;
            }else if (j == 3){
                foregroundLayer.backgroundColor = [UIColor colorWithRed:137.0/255.0 green:202.0/255.0 blue:202.0/255.0 alpha:1.0f].CGColor;
            }else if (j == 4){
                foregroundLayer.backgroundColor = [UIColor colorWithRed:72.0/255.0 green:178.0/255.0 blue:178.0/255.0 alpha:1.0f].CGColor;
            }else if (j == 5){
                foregroundLayer.backgroundColor = [UIColor colorWithRed:25.0/255.0 green:148.0/255.0 blue:148.0/255.0 alpha:1.0f].CGColor;
            }
            
            if (i == 0) {
                [self.upBallMutArray addObject:foregroundLayer];
            }else if (i == 1){
                [self.rightBallMutArray addObject:foregroundLayer];
            }else if (i == 2){
                [self.downBallMutArray addObject:foregroundLayer];
            }else if (i == 3){
                [self.leftBallMutArray addObject:foregroundLayer];
            }
        }
    }
    
    self.ballTimer = [NSTimer timerWithTimeInterval:kTimeDifference target:self selector:@selector(timeDifference) userInfo:nil repeats: YES];
    [[NSRunLoop mainRunLoop] addTimer:self.ballTimer forMode:NSRunLoopCommonModes];
}

- (void)timeDifference
{
    if (self.ballTimerJ < 6 && self.ballTimerJ >= 0) {
        CALayer *upBallLayer = [self.upBallMutArray objectAtIndex:self.ballTimerJ];
        UIBezierPath *upBallPath = [[UIBezierPath alloc] init];
        [upBallPath addArcWithCenter:CGPointMake(self.frame.size.width/2 + kBallR, self.frame.size.height/2 - kBallR) radius:kBallR * 1.414 startAngle:0.75 * M_PI endAngle:2.75 * M_PI clockwise:YES];
        CAKeyframeAnimation *upCircleAnimation = [CAKeyframeAnimation animation];
        upCircleAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0]];
        upCircleAnimation.delegate = self;
        upCircleAnimation.keyPath = @"position";
        upCircleAnimation.duration = 3;
        upCircleAnimation.repeatCount = INT32_MAX;
        upCircleAnimation.path = upBallPath.CGPath;
        [upBallLayer addAnimation:upCircleAnimation forKey:[NSString stringWithFormat:@"circle-animation-up-key%d",self.ballTimerJ]];
        
        
        CALayer *rightBallLayer = [self.rightBallMutArray objectAtIndex:self.ballTimerJ];
        UIBezierPath *rightBallPath = [[UIBezierPath alloc] init];
        [rightBallPath addArcWithCenter:CGPointMake(self.frame.size.width/2 + kBallR, self.frame.size.height/2 + kBallR) radius:kBallR * 1.414 startAngle:1.25 * M_PI endAngle:3.25 * M_PI clockwise:YES];
        CAKeyframeAnimation *rightCircleAnimation = [CAKeyframeAnimation animation];
        rightCircleAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0]];
        rightCircleAnimation.delegate = self;
        rightCircleAnimation.keyPath = @"position";
        rightCircleAnimation.duration = 3;
        rightCircleAnimation.repeatCount = INT32_MAX;
        rightCircleAnimation.path = rightBallPath.CGPath;
        [rightBallLayer addAnimation:rightCircleAnimation forKey:[NSString stringWithFormat:@"circle-animation-right-key%d",self.ballTimerJ]];
        
        
        CALayer *downBallLayer = [self.downBallMutArray objectAtIndex:self.ballTimerJ];
        UIBezierPath *downBallPath = [[UIBezierPath alloc] init];
        [downBallPath addArcWithCenter:CGPointMake(self.frame.size.width/2 - kBallR, self.frame.size.height/2 + kBallR) radius:kBallR * 1.414 startAngle:1.75 * M_PI endAngle:3.75 * M_PI clockwise:YES];
        CAKeyframeAnimation *downCircleAnimation = [CAKeyframeAnimation animation];
        downCircleAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0]];
        downCircleAnimation.delegate = self;
        downCircleAnimation.keyPath = @"position";
        downCircleAnimation.duration = 3;
        downCircleAnimation.repeatCount = INT32_MAX;
        downCircleAnimation.path = downBallPath.CGPath;
        [downBallLayer addAnimation:downCircleAnimation forKey:[NSString stringWithFormat:@"circle-animation-down-key%d",self.ballTimerJ]];
        
        
        CALayer *leftBallLayer = [self.leftBallMutArray objectAtIndex:self.ballTimerJ];
        UIBezierPath *leftBallPath = [[UIBezierPath alloc] init];
        [leftBallPath addArcWithCenter:CGPointMake(self.frame.size.width/2 - kBallR, self.frame.size.height/2 - kBallR) radius:kBallR * 1.414 startAngle:2.25 * M_PI endAngle:4.25 * M_PI clockwise:YES];
        CAKeyframeAnimation *leftCircleAnimation = [CAKeyframeAnimation animation];
        leftCircleAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.7],[NSNumber numberWithFloat:0.8],[NSNumber numberWithFloat:0.9],[NSNumber numberWithFloat:1.0]];
        leftCircleAnimation.delegate = self;
        leftCircleAnimation.keyPath = @"position";
        leftCircleAnimation.duration = 3;
        leftCircleAnimation.repeatCount = INT32_MAX;
        leftCircleAnimation.path = leftBallPath.CGPath;
        [leftBallLayer addAnimation:leftCircleAnimation forKey:[NSString stringWithFormat:@"circle-animation-left-key%d",self.ballTimerJ]];
    }
    self.ballTimerJ --;
    NSLog(@"%d",self.ballTimerJ);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
