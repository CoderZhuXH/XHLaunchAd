//
//  UIButton+XHEnlarged.h
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/8/19.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>

@interface UIButton (XHEnlarged)

/**
 *  扩大button点击区域,4边设置相同值
 */
@property (nonatomic, assign) CGFloat enlargedEdge;

/**
 *  扩大button点击区域,4边分别设置
 */
-(void)xh_setEnlargedEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

@end
