//
//  XHWebImageDownload.h
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, XHWebImageOptions) {
    
    /**
     *  有缓存,读取缓存,不重新加载,没缓存先加载,并缓存
     */
    XHWebImageDefault = 1 << 0,
    
    /**
     *  只加载,不缓存
     */
    XHWebImageOnlyLoad = 1 << 1,
    
    /**
     *  先读缓存,再加载刷新图片和缓存
     */
    XHWebImageRefreshCached = 1 << 2
    
};

typedef void(^XHWebImageCompletionBlock)(UIImage *image,NSURL *url);

@interface XHWebImageDownload : NSObject

/**
 *  异步下载图片
 *
 *  @param url            图片URL
 *  @param options        缓存机制
 *  @param completedBlock 下载完成回调
 */
+(void)xh_downLoadImage_asyncWithURL:(NSURL *)url options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock;


@end
