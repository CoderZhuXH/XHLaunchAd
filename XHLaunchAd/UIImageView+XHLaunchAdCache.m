//
//  UIImageView+XHLaunchAdCache.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/13.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "UIImageView+XHLaunchAdCache.h"

@implementation UIImageView (XHLaunchAdCache)

- (void)xh_setImageWithURL:(nonnull NSURL *)url
{
    [self xh_setImageWithURL:url placeholderImage:nil];
}
- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder
{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:XHLaunchAdImageDefault];
}
-(void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(XHLaunchAdImageOptions)options
{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:options completed:nil];
}

- (void)xh_setImageWithURL:(nonnull NSURL *)url completed:(nullable XHExternalCompletionBlock)completedBlock {
    
    [self xh_setImageWithURL:url placeholderImage:nil completed:completedBlock];
}
- (void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder completed:(nullable XHExternalCompletionBlock)completedBlock
{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:XHLaunchAdImageDefault completed:completedBlock];
}
-(void)xh_setImageWithURL:(nonnull NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(XHLaunchAdImageOptions)options completed:(nullable XHExternalCompletionBlock)completedBlock
{
    if(placeholder) self.image = placeholder;
    if(!url) return;
     __weak __typeof(self)wself = self;
    [[XHLaunchAdImageManager sharedManager] loadImageWithURL:url options:options progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, NSURL * _Nullable imageURL) {

        if(image) wself.image = image;
        
        if(completedBlock) completedBlock(image,error,imageURL);
        
    }];
}
@end
