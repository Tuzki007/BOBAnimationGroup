//
//  BOBThreeBallLoading1.h
//  BOBAnimationGroup
//
//  Created by Orange on 2019/11/17.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BOBLittleBallGroupView;

NS_ASSUME_NONNULL_BEGIN

@interface BOBThreeBallLoading1 : UIView

@property (nonatomic, strong) BOBLittleBallGroupView *littleBall1;
@property (nonatomic, strong) BOBLittleBallGroupView *littleBall2;
@property (nonatomic, strong) BOBLittleBallGroupView *littleBall3;

@end

/**大球80(控件宽100)、小球60(控件宽80)*/
@interface BOBLittleBallGroupView : UIView

/**大圆*/
@property (nonatomic, strong) CALayer *bigCircularLayer;
/**小球颜色*/
@property (nonatomic, strong) UIColor *littleBallColor;
/**文字*/
@property (nonatomic, strong) CATextLayer *titleLayer;

@end

NS_ASSUME_NONNULL_END
