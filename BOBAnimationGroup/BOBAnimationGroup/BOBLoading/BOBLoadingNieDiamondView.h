//
//  BOBLoadingNieDiamondView.h
//  BOBAnimationGroup
//
//  Created by 张兴程 on 2019/11/5.
//  Copyright © 2019 张兴程. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BOBLittleDiamondView;

NS_ASSUME_NONNULL_BEGIN

/**1-2 9个菱形飞行动画(0023-13)*/
@interface BOBLoadingNieDiamondView : UIView

@end

/**小菱形(最大的一个菱形50*50，最小的菱形25*25)*/
@interface BOBLittleDiamondView : UIView

@property (nonatomic, strong) CAShapeLayer *diamondLayer;

@end

NS_ASSUME_NONNULL_END
