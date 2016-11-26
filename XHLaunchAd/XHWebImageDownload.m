//
//  XHWebImageDownload.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHWebImageDownload.h"
#import "XHImageCache.h"
#import "UIImage+XHLaunchAdGIF.h"

@implementation XHWebImageDownload
+(void)xh_downLoadImage_asyncWithURL:(NSURL *)url options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock
{
    if(!options) options = XHWebImageDefault;
    
    if(options&XHWebImageOnlyLoad)
    {
        [self xh_asyncDownLoadImageWithURL:url completed:completedBlock];
    }
    else if (options&XHWebImageRefreshCached)
    {
        
        UIImage *cacheImage = [XHImageCache xh_getCacheImageWithURL:url];
        if(cacheImage)
        {
            if(completedBlock) completedBlock(cacheImage,url);
        }
        
        [self xh_asyncDownLoadImageAndCacheWithURL:url completed:completedBlock];
        
    }
    else if (options&XHWebImageCacheInBackground)
    {
        
        UIImage *cacheImage = [XHImageCache xh_getCacheImageWithURL:url];
        if(cacheImage)
        {
            if(completedBlock) completedBlock(cacheImage,url);
        }
        else
        {
            [self xh_asyncDownLoadImageAndCacheWithURL:url completed:nil];
        }
    }
    else//default
    {
        
        UIImage *cacheImage = [XHImageCache xh_getCacheImageWithURL:url];
        if(cacheImage)
        {
            if(completedBlock) completedBlock(cacheImage,url);
        }
        else
        {
            [self xh_asyncDownLoadImageAndCacheWithURL:url completed:completedBlock];
        }
        
    }
    
}

+(void)xh_asyncDownLoadImageAndCacheWithURL:(NSURL *)url completed:(XHWebImageCompletionBlock)completedBlock
{
    if(url==nil) return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *image = [self xh_downLoadImageAndCacheWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(completedBlock) completedBlock(image,url);
            
        });
        
    });
}
+(void)xh_asyncDownLoadImageWithURL:(NSURL *)url completed:(XHWebImageCompletionBlock)completedBlock
{
    if(url==nil) return;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *image = [self xh_downLoadImageWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(completedBlock)  completedBlock(image,url);
            
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
