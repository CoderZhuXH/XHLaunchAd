//
//  UIImageView+XHWebCache.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "UIImageView+XHWebCache.h"

@implementation UIImageView (XHWebCache)

- (void)xh_setImageWithURL:(NSURL *)url
{
    [self xh_setImageWithURL:url placeholderImage:nil];
}
- (void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self xh_setImageWithURL:url placeholderImage:placeholder completed:nil];
}
- (void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(XHWebImageCompletionBlock)completedBlock
{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:XHWebImageDefault completed:completedBlock];
}
-(void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock
{
    if(placeholder) self.image = placeholder;
    if(url)
    {
        __weak __typeof(self)wself = self;
        
        [XHWebImageDownload xh_downLoadImage_asyncWithURL:url options:options completed:^(UIImage *image, NSURL *url) {
            
            if(!wself) return;
            
            wself.image = image;
            if(image&&completedBlock)
            {
                completedBlock(image,url);
            }
        }];
    }
}
@end
