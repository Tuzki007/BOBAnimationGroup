//
//  BOBLoadingThreeBallView.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/13.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLoadingThreeBallView.h"

#define kBallWidthHeight 15
#define kTimeDifference 0.4f

//3个球放大缩小动画动画
@interface BOBLoadingThreeBallView()<CAAnimationDelegate>

/**定时操作用于RunLoop定时*/
@property (nonatomic, strong) NSTimer *textTimer;
/**球1*/
@property (nonatomic, strong) CALayer *ball1;
/**球2*/
@property (nonatomic, strong) CALayer *ball2;
/**球3*/
@property (nonatomic, strong) CALayer *ball3;
/**动画1*/
@property (nonatomic, strong) CAKeyframeAnimation *animation1;
/**动画2*/
@property (nonatomic, strong) CAKeyframeAnimation *animation2;
/**动画3*/
@property (nonatomic, strong) CAKeyframeAnimation *animation3;

@property (nonatomic, assign) NSInteger ballTime;
@property (nonatomic, assign) CGFloat nieDiamondViewWidth;
@property (nonatomic, assign) CGFloat nieDiamondViewHeight;

@end

@implementation BOBLoadingThreeBallView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ballTime = 1;
        self.nieDiamondViewWidth = self.frame.size.width;
        self.nieDiamondViewHeight = self.frame.size.height;
        [self createThreeBallViewUI];
    }
    return self;
}

- (void)createThreeBallViewUI
{
    self.ball1 = [CALayer layer];
    self.ball1.cornerRadius = kBallWidthHeight/2;
    self.ball1.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.ball1.frame = CGRectMake(self.nieDiamondViewWidth/2 - 40, self.nieDiamondViewHeight/2 - kBallWidthHeight/2, kBallWidthHeight, kBallWidthHeight);
    [self.layer addSublayer:self.ball1];
    
    self.ball2 = [CALayer layer];
    self.ball2.cornerRadius = kBallWidthHeight/2;
    self.ball2.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.ball2.frame = CGRectMake(self.nieDiamondViewWidth/2 - 10, self.nieDiamondViewHeight/2 - kBallWidthHeight/2, kBallWidthHeight, kBallWidthHeight);
    [self.layer addSublayer:self.ball2];
    
    self.ball3 = [CALayer layer];
    self.ball3.cornerRadius = kBallWidthHeight/2;
    self.ball3.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.ball3.frame = CGRectMake(self.nieDiamondViewWidth/2 + 20, self.nieDiamondViewHeight/2 - kBallWidthHeight/2, kBallWidthHeight, kBallWidthHeight);
    [self.layer addSublayer:self.ball3];

    
    self.animation1 = [CAKeyframeAnimation animation];
    self.animation1.delegate = self;
    self.animation1.keyPath = @"bounds";
    self.animation1.duration = 1.2;
    self.animation1.repeatCount = INT32_MAX;
    NSValue *boundsBeatValue1 = [NSValue valueWithCGRect:CGRectMake(0, 0, kBallWidthHeight, kBallWidthHeight)];
    NSValue *boundsBeatValue2 = [NSValue valueWithCGRect:CGRectMake((kBallWidthHeight - 2)/2, (kBallWidthHeight - 2)/2, 2, 2)];
    self.animation1.values = @[boundsBeatValue1,boundsBeatValue2,boundsBeatValue1];
    self.animation1.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.0]];
    self.animation1.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [self.ball1 addAnimation:self.animation1 forKey:@"zxc-animation1"];
    
    self.textTimer = [NSTimer timerWithTimeInterval:kTimeDifference target:self selector:@selector(timeDifference) userInfo:nil repeats: YES];
    [[NSRunLoop mainRunLoop] addTimer:self.textTimer forMode:NSRunLoopCommonModes];
}

- (void)timeDifference
{
    if (self.ballTime == 1) {
        self.ballTime++;
        [self.ball2 addAnimation:self.animation1 forKey:@"zxc-animation2"];
    }else if(self.ballTime == 2){
        self.ballTime++;
        [self.ball3 addAnimation:self.animation1 forKey:@"zxc-animation3"];
    }else{
    
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
