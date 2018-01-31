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

typedef void(^SaveCompletionBlock)(BOOL result , NSURL * URL);

@interface XHLaunchAdCache : NSObject

#pragma mark - 图片
/**
 *  获取缓存图片
 *
 *  @param url 图片url
 *
 *  @return 图片
 */
+(UIImage *)getCacheImageWithURL:(NSURL *)url;

/**
 获取缓存图片

 @param url 图片url
 @return imageData
 */
+(NSData *)getCacheImageDataWithURL:(NSURL *)url;

/**
 缓存图片

 @param data imageData
 @param url 图片url
 @return 缓存结果
 */
+(BOOL)saveImageData:(NSData *)data imageURL:(NSURL *)url;

/**
 缓存图片 - 异步

 @param data imageData
 @param url 图片url
 @param completedBlock 结果回调
 */
+(void)async_saveImageData:(NSData *)data imageURL:(NSURL *)url completed:(nullable SaveCompletionBlock)completedBlock;

/**
 *  检查是否已缓存在该图片
 *
 *  @param url image url
 *
 *  @return BOOL
 */

#pragma mark - 视频
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
 *  检查是否已缓存该视频(仅限于本地视频读取使用)
 *
 *  @param videoFileName 本地视频文件名称
 *
 *  @return BOOL
 */
+(BOOL)checkVideoInCacheWithFileName:(NSString *)videoFileName;

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

 @return 缓存结果
 */
+(BOOL)saveVideoAtLocation:(NSURL *)location URL:(NSURL *)url;

/**
 保存视频到缓存目录 - 异步

 @param location 视频路径
 @param url  视频url
 @param completedBlock 结果回调
 */
+(void)async_saveVideoAtLocation:(NSURL *)location URL:(NSURL *)url completed:(nullable SaveCompletionBlock)completedBlock;;

/**
 *  生成视频路径 for url
 */
+(NSString *)videoPathWithURL:(NSURL *)url;

/**
 *  生成视频路径 for videoFileName(仅限于本地视频读取使用)
 */
+(NSString *)videoPathWithFileName:(NSString *)videoFileName;

#pragma mark - url缓存
/**
 存储图片url - 异步
 
 @param url 图片url
 */
+(void)async_saveImageUrl:(NSString *)url;

/**
 获取最后一次缓存的图片url
 
 @return url string
 */
+(NSString *)getCacheImageUrl;

/**
 存储视频url - 异步

 @param url 视频url
 */
+(void)async_saveVideoUrl:(NSString *)url;

/**
 获取最后一次缓存的视频url

 @return url string
 */
+(NSString *)getCacheVideoUrl;

#pragma mark - 其他
/**
 *  缓存路径
 */
+ (NSString *)xhLaunchAdCachePath;

/**
 *  清除XHLaunchAd本地所有缓存(异步)
 */
+(void)clearDiskCache;

/**
 清除指定Url的图片本地缓存(异步)
 
 @param imageUrlArray 图片Url数组
 */
+(void)clearDiskCacheWithImageUrlArray:(NSArray<NSURL *> *)imageUrlArray;

/**
 清除指定Url除外的图片本地缓存(异步)

 @param exceptImageUrlArray 不需要清除缓存的图片Url数组,此url数组图片缓存将被保留
 */
+(void)clearDiskCacheExceptImageUrlArray:(NSArray<NSURL *> *)exceptImageUrlArray;

/**
 清除指定Url的视频本地缓存(异步)
 
 @param videoUrlArray 视频url数组
 */
+(void)clearDiskCacheWithVideoUrlArray:(NSArray<NSURL *> *)videoUrlArray;

/**
 清除指定Url除外的视频本地缓存(异步)

 @param exceptVideoUrlArray 不需要清除缓存的视频Url数组,此url数组视频缓存将被保留
 */
+(void)clearDiskCacheExceptVideoUrlArray:(NSArray<NSURL *> *)exceptVideoUrlArray;

/**
 *  获取XHLaunch本地缓存大小(M)
 */
+(float)diskCacheSize;

#pragma mark - other

+(NSString *)md5String:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
