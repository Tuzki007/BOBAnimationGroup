//
//  BOBLoadingGroupStarSub4.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/22.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLoadingGroupStarSub4.h"

#define kBigBallWidth 30.0f

#define kLittleBallWidth 14.0f

#define kSpacingWidth1 50.0f

#define kSpacingWidth2 75.0f

#define kSpacingWidth3 120.0f

//行星到恒星的距离分别是60 80 120
@interface BOBLoadingGroupStarSub4()<CAAnimationDelegate>

/**恒星*/
@property (nonatomic, strong) CALayer *fixedStarLayer;
///**行星1*/
//@property (nonatomic, strong) CALayer *planetStarLayer1;
///**行星1*/
//@property (nonatomic, strong) CALayer *planetStarLayer2;
///**行星1*/
//@property (nonatomic, strong) CALayer *planetStarLayer3;
///**轨道1*/
//@property (nonatomic, strong) CAShapeLayer *trackLayer1;
///**轨道2*/
//@property (nonatomic, strong) CAShapeLayer *trackLayer2;
///**轨道3*/
//@property (nonatomic, strong) CAShapeLayer *trackLayer3;

@end

@implementation BOBLoadingGroupStarSub4

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kBOBArmyGreenColor;
        [self createLoadingGroupStarSub4UI];
    }
    return self;
}

- (void)createLoadingGroupStarSub4UI
{
    self.fixedStarLayer = [CALayer layer];
    self.fixedStarLayer.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:174.0/255.0 blue:150.0/255.0 alpha:1.0].CGColor;
    self.fixedStarLayer.cornerRadius = kBigBallWidth/2;
    self.fixedStarLayer.masksToBounds = YES;
    self.fixedStarLayer.frame = CGRectMake((self.frame.size.width - kBigBallWidth)/2, (self.frame.size.height - kBigBallWidth)/2, kBigBallWidth, kBigBallWidth);
    [self.layer addSublayer:self.fixedStarLayer];
    
//    //1 - 1 轨道1
//    UIBezierPath *trackLayer1Path = [[UIBezierPath alloc] init];
//    [trackLayer1Path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:kSpacingWidth1 - kLittleBallWidth/2  startAngle:1 * M_PI endAngle:3 * M_PI clockwise:YES];
//    trackLayer1Path.lineWidth = 5;
//    self.trackLayer1 = [CAShapeLayer layer];
//    self.trackLayer1.fillColor = [UIColor clearColor].CGColor;
//    self.trackLayer1.strokeColor = [UIColor whiteColor].CGColor;
//    self.trackLayer1.path = trackLayer1Path.CGPath;
//    [self.layer addSublayer:self.trackLayer1];
//    //1 - 1 行星1
//    self.planetStarLayer1 = [CALayer layer];
//    self.planetStarLayer1.backgroundColor = [UIColor colorWithRed:125.0/255.0 green:245.0/255.0 blue:221.0/255.0 alpha:1.0].CGColor;
//    self.planetStarLayer1.cornerRadius = kLittleBallWidth/2;
//    self.planetStarLayer1.masksToBounds = YES;
//    self.planetStarLayer1.frame = CGRectMake((self.frame.size.width)/2 - kSpacingWidth1, (self.frame.size.height - kLittleBallWidth)/2, kLittleBallWidth, kLittleBallWidth);
//    [self.layer addSublayer:self.planetStarLayer1];
//
//    //2 - 1 轨道2
//    UIBezierPath *trackLayer2Path = [[UIBezierPath alloc] init];
//    [trackLayer2Path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:kSpacingWidth2 - kLittleBallWidth/2  startAngle:1 * M_PI endAngle:3 * M_PI clockwise:YES];
//    trackLayer2Path.lineWidth = 5;
//    self.trackLayer2 = [CAShapeLayer layer];
//    self.trackLayer2.fillColor = [UIColor clearColor].CGColor;
//    self.trackLayer2.strokeColor = [UIColor whiteColor].CGColor;
//    self.trackLayer2.path = trackLayer2Path.CGPath;
//    [self.layer addSublayer:self.trackLayer2];
//    //2 - 1 行星2
//    self.planetStarLayer2 = [CALayer layer];
//    self.planetStarLayer2.backgroundColor = [UIColor colorWithRed:125.0/255.0 green:245.0/255.0 blue:221.0/255.0 alpha:1.0].CGColor;
//    self.planetStarLayer2.cornerRadius = kLittleBallWidth/2;
//    self.planetStarLayer2.masksToBounds = YES;
//    self.planetStarLayer2.frame = CGRectMake((self.frame.size.width)/2 - kSpacingWidth2, (self.frame.size.height - kLittleBallWidth)/2, kLittleBallWidth, kLittleBallWidth);
//    [self.layer addSublayer:self.planetStarLayer2];
//
//    //3 - 1 轨道3
//    UIBezierPath *trackLayer3Path = [[UIBezierPath alloc] init];
//    [trackLayer3Path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:kSpacingWidth3 - kLittleBallWidth/2  startAngle:1 * M_PI endAngle:3 * M_PI clockwise:YES];
//    trackLayer3Path.lineWidth = 5;
//    self.trackLayer3 = [CAShapeLayer layer];
//    self.trackLayer3.fillColor = [UIColor clearColor].CGColor;
//    self.trackLayer3.strokeColor = [UIColor whiteColor].CGColor;
//    self.trackLayer3.path = trackLayer3Path.CGPath;
//    [self.layer addSublayer:self.trackLayer3];
//    //3 - 1 行星3
//    self.planetStarLayer3 = [CALayer layer];
//    self.planetStarLayer3.backgroundColor = [UIColor colorWithRed:125.0/255.0 green:245.0/255.0 blue:221.0/255.0 alpha:1.0].CGColor;
//    self.planetStarLayer3.cornerRadius = kLittleBallWidth/2;
//    self.planetStarLayer3.masksToBounds = YES;
//    self.planetStarLayer3.frame = CGRectMake((self.frame.size.width)/2 - kSpacingWidth3, (self.frame.size.height - kLittleBallWidth)/2, kLittleBallWidth, kLittleBallWidth);
//    [self.layer addSublayer:self.planetStarLayer3];
    
    for (int i = 0; i < 3; i++) {
        //轨道
        UIBezierPath *trackLayerPath = [[UIBezierPath alloc] init];
        if (i == 0) {
            [trackLayerPath addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:kSpacingWidth1 - kLittleBallWidth/2  startAngle:1 * M_PI endAngle:3 * M_PI clockwise:YES];
        }else if(i == 1){
            [trackLayerPath addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:kSpacingWidth2 - kLittleBallWidth/2  startAngle:1 * M_PI endAngle:3 * M_PI clockwise:YES];
        }else if(i == 2){
            [trackLayerPath addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:kSpacingWidth3 - kLittleBallWidth/2  startAngle:1 * M_PI endAngle:3 * M_PI clockwise:YES];
        }
        trackLayerPath.lineWidth = 5;
        CAShapeLayer *trackLayer = [CAShapeLayer layer];
        trackLayer.fillColor = [UIColor clearColor].CGColor;
        trackLayer.strokeColor = [UIColor whiteColor].CGColor;
        trackLayer.path = trackLayerPath.CGPath;
        [self.layer addSublayer:trackLayer];
        //行星
        CALayer *planetStarLayer = [CALayer layer];
        planetStarLayer.backgroundColor = [UIColor colorWithRed:125.0/255.0 green:245.0/255.0 blue:221.0/255.0 alpha:1.0].CGColor;
        planetStarLayer.cornerRadius = kLittleBallWidth/2;
        planetStarLayer.masksToBounds = YES;
        [self.layer addSublayer:planetStarLayer];
        
        if (i == 0) {
            planetStarLayer.frame = CGRectMake((self.frame.size.width)/2 - kSpacingWidth1, (self.frame.size.height - kLittleBallWidth)/2, kLittleBallWidth, kLittleBallWidth);
        }else if(i == 1){
            planetStarLayer.frame = CGRectMake((self.frame.size.width)/2 - kSpacingWidth2, (self.frame.size.height - kLittleBallWidth)/2, kLittleBallWidth, kLittleBallWidth);
        }else if(i == 2){
            planetStarLayer.frame = CGRectMake((self.frame.size.width)/2 - kSpacingWidth3, (self.frame.size.height - kLittleBallWidth)/2, kLittleBallWidth, kLittleBallWidth);
        }
        
        CAKeyframeAnimation *leftCircleAnimation = [CAKeyframeAnimation animation];
        leftCircleAnimation.delegate = self;
        leftCircleAnimation.keyPath = @"position";
        if (i == 0) {
            leftCircleAnimation.duration = 3;
        }else if(i == 1){
            leftCircleAnimation.duration = 1.8;
        }else{
            leftCircleAnimation.duration = 5;
        }
        leftCircleAnimation.repeatCount = INT32_MAX;
        leftCircleAnimation.path = trackLayerPath.CGPath;
        [planetStarLayer addAnimation:leftCircleAnimation forKey:[NSString stringWithFormat:@"circle-animation-left-key%d",i]];
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
