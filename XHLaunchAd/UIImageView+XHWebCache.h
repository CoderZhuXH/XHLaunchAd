//
//  UIImageView+XHWebCache.h
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XHWebImageDownload.h"


@interface UIImageView (XHWebCache)

/**
 *  异步加载网络图片带本地缓存
 *
 *  @param url 图片url
 */
- (void)xh_setImageWithURL:(NSURL *)url;

/**
 *  异步加载网络图片/带本地缓存
 *
 *  @param url         图片url
 *  @param placeholder 默认图片
 */
- (void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

/**
 *  异步加载网络图片/带本地缓存
 *
 *  @param url            图片url
 *  @param placeholder    默认图片
 *  @param completedBlock 加载完成回调
 */
- (void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(XHWebImageCompletionBlock)completedBlock;

/**
 *  异步加载网络图片/带本地缓存
 *
 *  @param url            图片url
 *  @param placeholder    默认图片
 *  @param options        缓存机制
 *  @param completedBlock 加载完成回调
 */
-(void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock;

@end
