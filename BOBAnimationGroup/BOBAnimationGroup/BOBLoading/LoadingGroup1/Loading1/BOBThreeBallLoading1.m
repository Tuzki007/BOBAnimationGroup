//
//  BOBThreeBallLoading1.m
//  BOBAnimationGroup
//
//  Created by Orange on 2019/11/17.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBThreeBallLoading1.h"

@interface BOBThreeBallLoading1()

///透明度
@property (strong, nonatomic) CABasicAnimation *opacityAnimation;

@end

@implementation BOBThreeBallLoading1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self createThreeBallLoading1UI];
    }
    return self;
}

- (void)createThreeBallLoading1UI
{
    self.opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    self.opacityAnimation.duration = 2;
    self.opacityAnimation.repeatCount = INT32_MAX;
    self.opacityAnimation.removedOnCompletion = NO;
    self.opacityAnimation.fillMode = kCAFillModeForwards;
    self.opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    self.opacityAnimation.toValue = [NSNumber numberWithFloat:0.7];
    self.opacityAnimation.autoreverses = NO;
    
    //2、球2
    self.littleBall2 = [[BOBLittleBallGroupView alloc]initWithFrame:CGRectMake((kScreenWidth - 100)/2, (kScreenHeight - 100)/2, 100, 100)];
    self.littleBall2.bigCircularLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.littleBall2.bigCircularLayer addAnimation:self.opacityAnimation forKey:@"zxc-opacity"];
    
    //字体颜色
    NSString *titleString2 = @"D";
    NSMutableParagraphStyle *paragraph2 = [[NSMutableParagraphStyle alloc] init];
    paragraph2.lineSpacing = 1;
    NSMutableAttributedString *attributedStr2 = [[NSMutableAttributedString alloc] initWithString:titleString2 attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSParagraphStyleAttributeName:paragraph2}];
    //字体大小
//    [attributedStr2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:self.littleBall2.titleLayer.frame.size.height] range:NSMakeRange(0, titleString2.length)];
    [attributedStr2 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier" size:self.littleBall2.titleLayer.frame.size.height] range:NSMakeRange(0, titleString2.length)];

    [attributedStr2 addAttribute:NSBaselineOffsetAttributeName value:@(9) range:NSMakeRange(0, titleString2.length)];
    self.littleBall2.titleLayer.string = attributedStr2;
    [self addSubview:self.littleBall2];
    
    //1、球1
    self.littleBall1 = [[BOBLittleBallGroupView alloc]initWithFrame:CGRectMake((kScreenWidth - 100)/2 - 80 * 2 / 3, (kScreenHeight - 80)/2, 80, 80)];
    self.littleBall1.bigCircularLayer.backgroundColor = [UIColor redColor].CGColor;
    
    //字体颜色
    NSString *titleString1 = @"LOA";
    NSMutableParagraphStyle *paragraph1 = [[NSMutableParagraphStyle alloc] init];
    paragraph1.lineSpacing = 1;
    NSMutableAttributedString *attributedStr1 = [[NSMutableAttributedString alloc] initWithString:titleString1 attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSParagraphStyleAttributeName:paragraph1}];
    //字体大小
//    [attributedStr1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, titleString1.length)];
    [attributedStr1 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier" size:20] range:NSMakeRange(0, titleString1.length)];
    [attributedStr1 addAttribute:NSBaselineOffsetAttributeName value:@(-8) range:NSMakeRange(0, titleString1.length)];
    self.littleBall1.titleLayer.string = attributedStr1;
    [self addSubview:self.littleBall1];
    
    //3、球3
    self.littleBall3 = [[BOBLittleBallGroupView alloc]initWithFrame:CGRectMake((kScreenWidth - 100)/2 + 50 + 80 / 3, (kScreenHeight - 80)/2, 80, 80)];
    self.littleBall3.bigCircularLayer.backgroundColor = [UIColor colorWithRed:25.0/255.0 green:148.0/255.0 blue:148.0/255.0 alpha:1.0f].CGColor;
    
    //字体颜色
    NSString *titleString3 = @"ING";
    NSMutableParagraphStyle *paragraph3 = [[NSMutableParagraphStyle alloc] init];
    paragraph3.lineSpacing = 1;
    NSMutableAttributedString *attributedStr3 = [[NSMutableAttributedString alloc] initWithString:titleString3 attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSParagraphStyleAttributeName:paragraph3}];
    //字体大小
//    [attributedStr3 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, titleString3.length)];
    [attributedStr3 addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Courier" size:20] range:NSMakeRange(0, titleString1.length)];
    [attributedStr3 addAttribute:NSBaselineOffsetAttributeName value:@(-8) range:NSMakeRange(0, titleString3.length)];
    self.littleBall3.titleLayer.string = attributedStr3;
    [self addSubview:self.littleBall3];
    
}

@end


@interface BOBLittleBallGroupView()<CAAnimationDelegate>

//@property (nonatomic, assign) CGPoint ballPoint;
//@property (nonatomic, strong) NSMutableArray *ballPointMutArray;
@property (nonatomic, assign) CGFloat littleBallWidthOrHeight;

@property (nonatomic, assign) CGFloat ballGroupViewWidth;
@property (nonatomic, assign) CGFloat ballGroupViewHeight;

@property (nonatomic, strong) CALayer *littleBall1;
@property (nonatomic, strong) CALayer *littleBall2;
@property (nonatomic, strong) CALayer *littleBall3;
@property (nonatomic, strong) CALayer *littleBall4;

//@property (nonatomic, assign) CGPoint point1;
//@property (nonatomic, assign) CGPoint point2;
//@property (nonatomic, assign) CGPoint point3;
//@property (nonatomic, assign) CGPoint point4;

@end

@implementation BOBLittleBallGroupView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.ballGroupViewWidth = self.frame.size.width;
        self.ballGroupViewHeight = self.frame.size.height;
        self.littleBallWidthOrHeight = self.ballGroupViewWidth / 15;
        
//        self.ballPointMutArray = [[NSMutableArray alloc]initWithCapacity:10];
//        self.point1 = CGPointMake(self.ballGroupViewWidth / 2, 5);
//        self.point2 = CGPointMake(self.ballGroupViewWidth - (10 - self.littleBallWidthOrHeight)/2, self.ballGroupViewHeight / 2);
//        self.point3 = CGPointMake(self.ballGroupViewWidth / 2, self.ballGroupViewHeight - (10 - self.littleBallWidthOrHeight)/2);
//        self.point4 = CGPointMake((10 - self.littleBallWidthOrHeight)/2, self.ballGroupViewHeight / 2);

//        self.backgroundColor = [UIColor purpleColor];
        [self createLittleBallGroupViewUI];
    }
    return self;
}

- (void)createLittleBallGroupViewUI
{
    //1、大圆
    self.bigCircularLayer = [CALayer layer];
    self.bigCircularLayer.frame = CGRectMake(10, 10, self.ballGroupViewWidth - 20, self.ballGroupViewHeight - 20);
    self.bigCircularLayer.cornerRadius = (self.ballGroupViewWidth - 20)/2;
    self.bigCircularLayer.shadowColor = [UIColor grayColor].CGColor;
    self.bigCircularLayer.shadowOffset = CGSizeMake(0, 0.1);//shadowOffset阴影偏移,x向右偏移，y向下偏移
    self.bigCircularLayer.shadowOpacity = 0.8f;//阴影透明度
//    self.bigCircularLayer.shadowRadius = (self.ballGroupViewWidth - 10)/2;//阴影半径，默认3
//    self.bigCircularLayer.shadowPath = [UIBezierPath bezierPathWithRect:self.bigCircularLayer.bounds].CGPath;
//    self.bigCircularLayer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bigCircularLayer.bounds cornerRadius:(self.ballGroupViewWidth - 20)/2].CGPath;
    self.bigCircularLayer.shadowPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.ballGroupViewWidth/2, self.ballGroupViewHeight/2) radius:(self.ballGroupViewWidth - 20)/2 startAngle:0 * M_PI endAngle:2 * M_PI clockwise:YES].CGPath;

    [self.layer addSublayer:self.bigCircularLayer];
    
    //2、小球
    for (int i = 0; i < 4; i++) {
        CALayer *littleBall = [CALayer layer];
        littleBall.backgroundColor = [UIColor whiteColor].CGColor;
        littleBall.frame = CGRectMake((self.ballGroupViewWidth - self.littleBallWidthOrHeight) / 2, (10 - self.littleBallWidthOrHeight) / 2, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
        littleBall.cornerRadius = self.littleBallWidthOrHeight/2;
        [self.layer addSublayer:littleBall];
        
        UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
        CAKeyframeAnimation *circleAnimation = [CAKeyframeAnimation animation];
        circleAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.1],[NSNumber numberWithFloat:0.2],[NSNumber numberWithFloat:1.0]];
        circleAnimation.delegate = self;
        circleAnimation.keyPath = @"position";
        circleAnimation.duration = 2;
        circleAnimation.repeatCount = INT32_MAX;
        circleAnimation.removedOnCompletion = NO;
        circleAnimation.fillMode = kCAFillModeForwards;
        
        if (i == 0) {
            littleBall.frame = CGRectMake((self.ballGroupViewWidth - self.littleBallWidthOrHeight) / 2, (10 - self.littleBallWidthOrHeight) / 2, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
            [bezierPath addArcWithCenter:CGPointMake(self.ballGroupViewWidth/2, self.ballGroupViewHeight/2) radius:(self.ballGroupViewWidth - 20)/2 + 5 startAngle:1.5 * M_PI endAngle:3.5 * M_PI clockwise:YES];
            circleAnimation.path = bezierPath.CGPath;
            [littleBall addAnimation:circleAnimation forKey:@"circle-animation-key1"];
        }else if (i == 1){
            littleBall.frame = CGRectMake(self.ballGroupViewWidth - (10 - self.littleBallWidthOrHeight) / 2 - self.littleBallWidthOrHeight, (self.ballGroupViewHeight - self.littleBallWidthOrHeight) / 2, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
            [bezierPath addArcWithCenter:CGPointMake(self.ballGroupViewWidth/2, self.ballGroupViewHeight/2) radius:(self.ballGroupViewWidth - 20)/2 + 5 startAngle:0 * M_PI endAngle:2 * M_PI clockwise:YES];
            circleAnimation.path = bezierPath.CGPath;
            [littleBall addAnimation:circleAnimation forKey:@"circle-animation-key2"];
        }else if (i == 2){
            littleBall.frame = CGRectMake((self.ballGroupViewWidth - self.littleBallWidthOrHeight) / 2, self.ballGroupViewHeight - (10 - self.littleBallWidthOrHeight) / 2 - self.littleBallWidthOrHeight, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
            [bezierPath addArcWithCenter:CGPointMake(self.ballGroupViewWidth/2, self.ballGroupViewHeight/2) radius:(self.ballGroupViewWidth - 20)/2 + 5 startAngle:0.5 * M_PI endAngle:2.5 * M_PI clockwise:YES];
            circleAnimation.path = bezierPath.CGPath;
            [littleBall addAnimation:circleAnimation forKey:@"circle-animation-key3"];
        }else if (i == 3){
            littleBall.frame = CGRectMake((10 - self.littleBallWidthOrHeight) / 2, (self.ballGroupViewHeight - self.littleBallWidthOrHeight) / 2, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
            [bezierPath addArcWithCenter:CGPointMake(self.ballGroupViewWidth/2, self.ballGroupViewHeight/2) radius:(self.ballGroupViewWidth - 20)/2 + 5 startAngle:1.0 * M_PI endAngle:3.0 * M_PI clockwise:YES];
            circleAnimation.path = bezierPath.CGPath;
            [littleBall addAnimation:circleAnimation forKey:@"circle-animation-key4"];
        }
    }
    
//    self.littleBall1 = [CALayer layer];
//    self.littleBall1.backgroundColor = [UIColor whiteColor].CGColor;
//    self.littleBall1.frame = CGRectMake((self.ballGroupViewWidth - self.littleBallWidthOrHeight) / 2, (10 - self.littleBallWidthOrHeight) / 2, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
//    self.littleBall1.cornerRadius = self.littleBallWidthOrHeight/2;
//    [self.layer addSublayer:self.littleBall1];
//
//    self.littleBall2 = [CALayer layer];
//    self.littleBall2.backgroundColor = [UIColor whiteColor].CGColor;
//    self.littleBall2.frame = CGRectMake(self.ballGroupViewWidth - (10 - self.littleBallWidthOrHeight) / 2 - self.littleBallWidthOrHeight, (self.ballGroupViewHeight - self.littleBallWidthOrHeight) / 2, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
//    self.littleBall2.cornerRadius = self.littleBallWidthOrHeight/2;
//    [self.layer addSublayer:self.littleBall2];
//
//    self.littleBall3 = [CALayer layer];
//    self.littleBall3.backgroundColor = [UIColor whiteColor].CGColor;
//    self.littleBall3.frame = CGRectMake((self.ballGroupViewWidth - self.littleBallWidthOrHeight) / 2, self.ballGroupViewHeight - (10 - self.littleBallWidthOrHeight) / 2 - self.littleBallWidthOrHeight, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
//    self.littleBall3.cornerRadius = self.littleBallWidthOrHeight/2;
//    [self.layer addSublayer:self.littleBall3];
//
//    self.littleBall4 = [CALayer layer];
//    self.littleBall4.backgroundColor = [UIColor whiteColor].CGColor;
//    self.littleBall4.frame = CGRectMake((10 - self.littleBallWidthOrHeight) / 2, (self.ballGroupViewHeight - self.littleBallWidthOrHeight) / 2, self.littleBallWidthOrHeight, self.littleBallWidthOrHeight);
//    self.littleBall4.cornerRadius = self.littleBallWidthOrHeight/2;
//    [self.layer addSublayer:self.littleBall4];
    
    //2、标题
    self.titleLayer = [CATextLayer layer];
    self.titleLayer.contentsScale = 2;
    self.titleLayer.frame = CGRectMake(10, 10, self.bigCircularLayer.frame.size.width - 20, self.bigCircularLayer.frame.size.height - 20);
    self.titleLayer.alignmentMode = kCAAlignmentCenter;
    self.titleLayer.truncationMode = kCATruncationEnd;
    [self.bigCircularLayer addSublayer:self.titleLayer];
    
}

@end
