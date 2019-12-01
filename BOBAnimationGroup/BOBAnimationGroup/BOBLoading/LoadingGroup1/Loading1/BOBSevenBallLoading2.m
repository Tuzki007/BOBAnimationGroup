//
//  BOBSevenBallLoading2.m
//  BOBAnimationGroup
//
//  Created by Orange on 2019/11/17.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import "BOBSevenBallLoading2.h"

#define kTimeDifference 0.5f
#define kTextLayerWidth 240.0f
#define kBallWidth 300.0f

@interface BOBSevenBallLoading2()

@property (nonatomic, strong) UILabel *titleLabel;
/**定时操作用于RunLoop定时*/
@property (nonatomic, strong) NSTimer *textTimer;

@property (nonatomic, strong) NSMutableArray *layerMutArray;

@property (nonatomic, assign) int timeI;

//@property (nonatomic, strong) CALayer *foregroundLayer;

@end

@implementation BOBSevenBallLoading2

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.timeI = 0;
        self.layerMutArray = [[NSMutableArray alloc]initWithCapacity:10];
        [self createSevenBallLoading2UI];
    }
    return self;
}

- (void)createSevenBallLoading2UI
{
//    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, (self.frame.size.height - 50)/2, self.frame.size.width - 60, 50)];
//    self.titleLabel.text = @"L o a d i n g";
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.titleLabel.font = [UIFont fontWithName:@"Courier" size:30];
//    [self addSubview:self.titleLabel];
    
    //7x + (80 - x) = self.frame.size.width - 60
    //x = (self.frame.size.width - 140)/6
    
    for (int i = 0; i < 7; i++) {
        CALayer *foregroundLayer = [CALayer layer];
        foregroundLayer.hidden = YES;
        foregroundLayer.anchorPoint = CGPointMake(1, 1);
//        foregroundLayer.backgroundColor = [UIColor whiteColor].CGColor;
//        foregroundLayer.cornerRadius = 40;
//        foregroundLayer.masksToBounds = YES;kBallWidth
//        (kBallWidth - 10)/8
//        foregroundLayer.frame = CGRectMake(30 + i * ((self.frame.size.width - 140)/6), (self.frame.size.height - 80)/2, 80, 80);
//        foregroundLayer.frame = CGRectMake(30 + i * (kBallWidth - 10)/8, (self.frame.size.height - 80)/2, 80, 80);
        foregroundLayer.frame = CGRectMake((self.frame.size.width - kBallWidth)/2 + i * (kBallWidth - 10)/8, (self.frame.size.height - 80)/2, 80, 80);

        [self.layer addSublayer:foregroundLayer];
        
        UIView *backgroudnColorView = [[UIView alloc]initWithFrame:CGRectMake(30 + i * ((self.frame.size.width - 140)/6), (self.frame.size.height - 80)/2, 80, 80)];
        backgroudnColorView.clipsToBounds = YES;
        backgroudnColorView.layer.masksToBounds = YES;
        backgroudnColorView.layer.cornerRadius = 40;
        if (i == 0) {
//            foregroundLayer.backgroundColor = [UIColor colorWithRed:208.0/255.0 green:25.0/255.0 blue:5.0/255.0 alpha:1.0f].CGColor;
            backgroudnColorView.backgroundColor = [UIColor colorWithRed:208.0/255.0 green:25.0/255.0 blue:5.0/255.0 alpha:1.0f];
        }else if (i == 1){
//            foregroundLayer.backgroundColor = [UIColor colorWithRed:252.0/255.0 green:86.0/255.0 blue:43.0/255.0 alpha:1.0f].CGColor;
            backgroudnColorView.backgroundColor = [UIColor colorWithRed:252.0/255.0 green:86.0/255.0 blue:43.0/255.0 alpha:1.0f];
        }else if (i == 2){
//            foregroundLayer.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:145.0/255.0 blue:118.0/255.0 alpha:1.0f].CGColor;
            backgroudnColorView.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:145.0/255.0 blue:118.0/255.0 alpha:1.0f];
        }else if (i == 3){
//            foregroundLayer.backgroundColor = [UIColor whiteColor].CGColor;
            backgroudnColorView.backgroundColor = [UIColor whiteColor];
        }else if (i == 4){
//            foregroundLayer.backgroundColor = [UIColor colorWithRed:137.0/255.0 green:202.0/255.0 blue:202.0/255.0 alpha:1.0f].CGColor;
            backgroudnColorView.backgroundColor = [UIColor colorWithRed:137.0/255.0 green:202.0/255.0 blue:202.0/255.0 alpha:1.0f];
        }else if (i == 5){
//            foregroundLayer.backgroundColor = [UIColor colorWithRed:72.0/255.0 green:178.0/255.0 blue:178.0/255.0 alpha:1.0f].CGColor;
            backgroudnColorView.backgroundColor = [UIColor colorWithRed:72.0/255.0 green:178.0/255.0 blue:178.0/255.0 alpha:1.0f];
        }else if (i == 6){
//            foregroundLayer.backgroundColor = [UIColor colorWithRed:25.0/255.0 green:148.0/255.0 blue:148.0/255.0 alpha:1.0f].CGColor;
            backgroudnColorView.backgroundColor = [UIColor colorWithRed:25.0/255.0 green:148.0/255.0 blue:148.0/255.0 alpha:1.0f];
        }
        UIImage *backgroudnImage = [self convertViewToImage:backgroudnColorView];
        // 1.开启位图上下文，跟图片尺寸一样大
        UIGraphicsBeginImageContextWithOptions(backgroudnImage.size, NO, 0);
        // 2.设置圆形裁剪区域，正切与图片
        // 2.1创建圆形的路径
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, backgroudnImage.size.width, backgroudnImage.size.height)];
        // 2.2把路径设置为裁剪区域
        [path addClip];
        // 3.绘制图片
        [backgroudnImage drawAtPoint:CGPointZero];
        // 4.从上下文中获取图片
        UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
        // 5.关闭上下文
        UIGraphicsEndImageContext();
//        _imageView.image = clipImage;
        foregroundLayer.contents = (id)clipImage.CGImage;

//        foregroundLayer.contents = (id)backgroudnImage.CGImage;
        
        [self.layerMutArray addObject:foregroundLayer];
    }
    
    self.textTimer = [NSTimer timerWithTimeInterval:kTimeDifference target:self selector:@selector(timeDifference) userInfo:nil repeats: YES];
    [[NSRunLoop mainRunLoop] addTimer:self.textTimer forMode:NSRunLoopCommonModes];
    
    //2、大菱形动画
//    enlarge = [CAKeyframeAnimation animation];
//    enlarge.keyPath = @"bounds";
//    enlarge.duration = 4;
//    enlarge.repeatCount = INT32_MAX;
//    NSValue *boundsBeatValue1 = [NSValue valueWithCGRect:CGRectMake(0, 0, self.diamondViewWidth, self.diamondViewHeight)];
//    NSValue *boundsBeatValue2 = [NSValue valueWithCGRect:CGRectMake(20, 20, self.diamondViewWidth - 20, self.diamondViewHeight - 20)];
//    NSValue *boundsBeatValue3 = [NSValue valueWithCGRect:CGRectMake(0, 0, self.diamondViewWidth, self.diamondViewHeight)];
//    enlarge.values = @[boundsBeatValue1,boundsBeatValue2,boundsBeatValue3];
//    enlarge.keyTimes = @[[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:1.0]];
//    [self.diamondLayer addAnimation:enlarge forKey:@"zxc-diamond-boudns"];
    
//    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, (self.frame.size.height - 50)/2, self.frame.size.width - 60, 50)];
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth - kTextLayerWidth)/2, (self.frame.size.height - 50)/2, kTextLayerWidth, 50)];
//    self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.text = @"L o a d i n g";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"Courier" size:30];
    [self addSubview:self.titleLabel];
}

- (void)timeDifference
{
    if (self.timeI < 7) {
        CALayer *foregroundLayer = [self.layerMutArray objectAtIndex:self.timeI];
        foregroundLayer.hidden = NO;
        CAKeyframeAnimation *enlarge = [CAKeyframeAnimation animation];
//        enlarge.removedOnCompletion = NO;
//        enlarge.fillMode = kCAFillModeForwards;
        enlarge.keyPath = @"bounds";
        enlarge.duration = 7/1.5;
        enlarge.repeatCount = INT32_MAX;
        NSValue *boundsBeatValue1 = [NSValue valueWithCGRect:CGRectMake(80, 80, 0, 0)];
        NSValue *boundsBeatValue2 = [NSValue valueWithCGRect:CGRectMake(0, 0, 80, 80)];
        NSValue *boundsBeatValue3 = [NSValue valueWithCGRect:CGRectMake(80, 80, 0, 0)];
        NSValue *boundsBeatValue4 = [NSValue valueWithCGRect:CGRectMake(80, 80, 0, 0)];
        enlarge.values = @[boundsBeatValue1,boundsBeatValue2,boundsBeatValue3,boundsBeatValue4];
        enlarge.keyTimes = @[[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.071 * 2], [NSNumber numberWithFloat:0.142 * 2], [NSNumber numberWithFloat:1.0]];
        [foregroundLayer addAnimation:enlarge forKey:[NSString stringWithFormat:@"zxc-bounds-key-%d",self.timeI]];
    }
    self.timeI ++;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
