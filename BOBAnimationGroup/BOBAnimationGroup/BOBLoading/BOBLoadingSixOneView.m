//
//  BOBLoadingSixOneView.m
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/14.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBLoadingSixOneView.h"

@interface BOBLoadingSixOneView()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer *circleLayer;
@property (nonatomic, strong) CAShapeLayer *arcLayer;
@property (nonatomic, strong) CATextLayer *textLayer;

@property (nonatomic, assign) CGFloat nieDiamondViewWidth;
@property (nonatomic, assign) CGFloat nieDiamondViewHeight;
/**上下移动动画*/
@property (nonatomic, strong) CAKeyframeAnimation *upDownMoveAnimation;

@end

@implementation BOBLoadingSixOneView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nieDiamondViewWidth = self.frame.size.width;
        self.nieDiamondViewHeight = self.frame.size.height;
        [self createSixOneUI];
    }
    return self;
}

- (void)createSixOneUI
{
    UIBezierPath *arcPath = [UIBezierPath bezierPath];
    arcPath.lineWidth = 2.0f;
    [arcPath moveToPoint:CGPointMake(5, 35)];
//    [arcPath addCurveToPoint:CGPointMake(20, 40) controlPoint1:CGPointMake(40, 40) controlPoint2:CGPointMake(55, 30)];
//    [arcPath addQuadCurveToPoint:CGPointMake(30, 40) controlPoint:CGPointMake(55, 30)];
    [arcPath addQuadCurveToPoint:CGPointMake(55, 35) controlPoint:CGPointMake(30, 55)];
    
    self.arcLayer = [[CAShapeLayer alloc] init];
    self.arcLayer.backgroundColor = [UIColor clearColor].CGColor;
    self.arcLayer.frame = CGRectMake(0, 0, 60, 60);
    self.arcLayer.path = arcPath.CGPath;
    self.arcLayer.fillColor = [UIColor clearColor].CGColor;
    self.arcLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.arcLayer.lineWidth = 2;
    self.arcLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.arcLayer];
    
    self.upDownMoveAnimation = [CAKeyframeAnimation animation];
    self.upDownMoveAnimation.delegate = self;
    self.upDownMoveAnimation.path = arcPath.CGPath;
    self.upDownMoveAnimation.keyPath = @"position";
    self.upDownMoveAnimation.duration = 2;
    self.upDownMoveAnimation.repeatCount = INT32_MAX;
    self.upDownMoveAnimation.removedOnCompletion = NO;
    self.upDownMoveAnimation.fillMode = kCAFillModeForwards;
    
    CALayer *littleBall1 = [CALayer layer];
    littleBall1.backgroundColor = [UIColor redColor].CGColor;
    littleBall1.frame = CGRectMake(5, 35, 5, 5);
    littleBall1.cornerRadius = 2.5;
    [littleBall1 addAnimation:self.upDownMoveAnimation forKey:@"up-down_move-animation-key"];
    [self.arcLayer addSublayer:littleBall1];
    
    
    self.circleLayer = [CALayer layer];
    self.circleLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.circleLayer.frame = CGRectMake((self.nieDiamondViewWidth - 60)/2, (self.nieDiamondViewHeight - 60)/2, 60, 60);
    self.circleLayer.cornerRadius = 30;
    [self.layer addSublayer:self.circleLayer];
    [self.circleLayer addSublayer:self.arcLayer];
    
    self.textLayer = [CATextLayer layer];
    self.textLayer.frame = CGRectMake(0, 18, 60, 20);
    self.textLayer.string = @"全景";
//    self.textLayer.foregroundColor = [UIColor blackColor].CGColor;
    self.textLayer.alignmentMode = kCAAlignmentCenter;
//    self.textLayer.wrapped = YES;
    UIFont *font = [UIFont systemFontOfSize:18];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    self.textLayer.font = fontRef;
    self.textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    [self.circleLayer addSublayer:self.textLayer];
    
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
