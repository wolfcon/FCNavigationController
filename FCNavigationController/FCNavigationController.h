//
//  FCNavigationController.h
//  
//
//  Created by Frank on 11/14/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  利用在NavigationBar下面插一UIView, 通过改变UIView的Alpha, 来改变NavigationBar的Alpha
 */
@interface FCNavigationController : UINavigationController

/**
 *  设置背景值为透明, 但title等不透明
 *
 *  @param alpha 透明度值
 *  @param animationDuration 动画时间
 */
- (void)setBackgroundAlpha:(CGFloat)alpha animationDuration:(CGFloat)duration;

/**
 *  设置背景值为透明, 但title等不透明(0.5s的渐变动画)
 *
 *  @param alpha 透明度值
 *  @param animated 是否动画效果
 */
- (void)setBackgroundAlpha:(CGFloat)alpha animated:(BOOL)animated;

/**
 *  设置背景值为透明, 但title等不透明(无动画效果)
 *
 *  @param alpha 透明度值
 */
- (void)setBackgroundAlpha:(CGFloat)alpha;

/**
 *  在最大的透明度和最小透明度之间切换, 默认0.5s动画时间
 *
 *  @param minAlpha 最小透明度
 *  @param maxAlpha 最大透明度
 */
- (void)switchTransparentWithMinAlpha:(CGFloat)minAlpha maxAlpha:(CGFloat)maxAlpha;

/**
 *  在最大的透明度和最小透明度之间切换
 *
 *  @param minAlpha 最小透明度
 *  @param maxAlpha 最大透明度
 *  @param duration 切换时间
 */
- (void)switchTransparentWithMinAlpha:(CGFloat)minAlpha maxAlpha:(CGFloat)maxAlpha duration:(CGFloat)duration;

@end
