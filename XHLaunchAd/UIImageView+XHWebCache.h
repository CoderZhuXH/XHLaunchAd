//
//  UIImageView+XHWebCache.h

//  Copyright (c) 2016 XHLaunchAd (https://github.com/CoderZhuXH/XHLaunchAd)

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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

@interface XHWebImageDownloader : NSObject

/**
 *  缓存路径
 */
+ (NSString *)xh_cacheImagePath;

+(void)xh_checkDirectory:(NSString *)path;

@end

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
