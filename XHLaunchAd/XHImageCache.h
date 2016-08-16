//
//  XHImageCache.h
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHImageCache : NSObject

/**
 *  获取缓存图片
 *
 *  @param url 图片url
 *
 *  @return 图片
 */
+(UIImage *)xh_getCacheImageWithURL:(NSURL *)url;

/**
 *  缓存图片
 *
 *  @param data imageData
 *  @param url  图片url
 */
+(void)xh_saveImageData:(NSData *)data imageURL:(NSURL *)url;

/**
 *  获取缓存路径
 *
 *  @return path
 */
+(NSString *)xh_cacheImagePath;

/**
 *  check路径
 *
 *  @param path 路径
 */
+(void)xh_checkDirectory:(NSString *)path;
@end
