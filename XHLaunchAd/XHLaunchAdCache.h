//
//  XHLaunchAdCache.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/13.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^VideoSaveCompletionBlock)(BOOL result , NSURL * pathURL);

@interface XHLaunchAdCache : NSObject

/**
 *  获取缓存图片
 *
 *  @param url 图片url
 *
 *  @return 图片
 */
+(UIImage *)getCacheImageWithURL:(NSURL *)url;

/**
 *  缓存图片
 *
 *  @param data imageData
 *  @param url  图片url
 */
+(BOOL)saveImageData:(NSData *)data imageURL:(NSURL *)url;

/**
 *  缓存图片 - 异步
 *
 *  @param data imageData
 *  @param url  图片url
 */
+(void)async_saveImageData:(NSData *)data imageURL:(NSURL *)url;

/**
 *  检查是否已缓存在该图片
 *
 *  @param url image url
 *
 *  @return BOOL
 */
+(BOOL)checkImageInCacheWithURL:(NSURL *)url;

/**
 *  检查是否已缓存该视频
 *
 *  @param url video url
 *
 *  @return BOOL
 */
+(BOOL)checkVideoInCacheWithURL:(NSURL *)url;

/**
 *  获取缓存视频路径
 *
 *  @param url 视频链接url
 *  @return 视频本地路径
 */
+(nullable NSURL *)getCacheVideoWithURL:(NSURL *)url;


/**
 保存视频到缓存目录

 @param location 视频路径
 @param url      视频url

 @return 视频保存路劲
 */
+(nullable NSURL *)saveVideoAtLocation:(NSURL *)location URL:(NSURL *)url;

/**
 保存视频到缓存目录 - 异步

 @param location 视频路径
 @param url      视频url
 */
+(void)async_saveVideoAtLocation:(NSURL *)location URL:(NSURL *)url;

/**
 *  缓存路径
 */
+ (NSString *)xhLaunchAdCachePath;

/**
 *  生成视频路径 for url
 */
+(NSString *)videoPathWithURL:(NSURL *)url;

/**
 *  清除XHLaunch本地缓存
 */
+(void)clearDiskCache;

/**
 *  获取XHLaunch本地缓存大小(M)
 */
+(float)diskCacheSize;

@end

NS_ASSUME_NONNULL_END
