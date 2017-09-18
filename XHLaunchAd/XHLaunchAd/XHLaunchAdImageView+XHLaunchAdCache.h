//
//  XHLaunchAdImageView+XHLaunchAdCache.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2017/9/18.
//  Copyright © 2017年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdView.h"
#import "XHLaunchAdImageManager.h"

@interface XHLaunchAdImageView (XHLaunchAdCache)

- (void)xh_setImageWithURL:(nonnull NSURL *)url;

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder;

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(XHLaunchAdImageOptions)options;

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder completed:(nullable XHExternalCompletionBlock)completedBlock;

- (void)xh_setImageWithURL:(nonnull NSURL *)url completed:(nullable XHExternalCompletionBlock)completedBlock;

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(XHLaunchAdImageOptions)options completed:(nullable XHExternalCompletionBlock)completedBlock;

- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder GIFImageCycleOnce:(BOOL)GIFImageCycleOnce options:(XHLaunchAdImageOptions)options completed:(nullable XHExternalCompletionBlock)completedBlock;

@end
