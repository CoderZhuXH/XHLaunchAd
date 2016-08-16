//
//  XHWebImageDownload.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHWebImageDownload.h"
#import "XHImageCache.h"
#import "UIImage+XHGIF.h"

@implementation XHWebImageDownload
+(void)xh_downLoadImage_asyncWithURL:(NSURL *)url options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock
{
    if(!options) options = XHWebImageDefault;
    if(options&XHWebImageOnlyLoad)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            UIImage *image = [self xh_downLoadImageWithURL:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(completedBlock)
                {
                    completedBlock(image,url);
                }
            });
        });
        
        return;
    }
    UIImage *image0 = [XHImageCache xh_getCacheImageWithURL:url];
    if(image0&&completedBlock)
    {
        completedBlock(image0,url);
        
        if(options&XHWebImageDefault) return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *image = [self xh_downLoadImageAndCacheWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(completedBlock)
            {
                completedBlock(image,url);
            }
        });
        
    });
}

+(UIImage *)xh_downLoadImageWithURL:(NSURL *)url{
    
    if(url==nil) return nil;
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [UIImage xh_animatedGIFWithData:data];
    
}
+(UIImage *)xh_downLoadImageAndCacheWithURL:(NSURL *)url
{
    if(url==nil) return nil;
    NSData *data = [NSData dataWithContentsOfURL:url];
    [XHImageCache xh_saveImageData:data imageURL:url];
    return [UIImage xh_animatedGIFWithData:data];
}
@end
