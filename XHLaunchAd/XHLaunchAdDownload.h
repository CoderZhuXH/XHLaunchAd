//
//  XHLaunchAdDownload.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/26.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^XHLaunchAdDownloadProgressBlock)(unsigned long long total, unsigned long long current);

@protocol XHLaunchAdDownloadDelegate <NSObject>

- (void)downloadFinishWithURL:(nonnull NSURL *)url;

@end

@interface XHLaunchAdDownload : NSObject

@property (assign, nonatomic ,nonnull)id<XHLaunchAdDownloadDelegate> delegate;

@end

#pragma mark - XHLaunchAdImageDownload

typedef void(^XHLaunchAdDownloadImageCompletedBlock)(UIImage *_Nullable image, NSData * _Nullable data, NSError * _Nullable error);


@interface XHLaunchAdImageDownload : XHLaunchAdDownload

-(nonnull instancetype)initWithURL:(nonnull NSURL *)url delegateQueue:(nonnull NSOperationQueue *)queue progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadImageCompletedBlock)completedBlock;

@end

#pragma mark - XHLaunchAdVideoDownload
typedef void(^XHLaunchAdDownloadVideoCompletedBlock)(NSURL * _Nullable location, NSError * _Nullable error);

@interface XHLaunchAdVideoDownload : XHLaunchAdDownload

-(nonnull instancetype)initWithURL:(nonnull NSURL *)url delegateQueue:(nonnull NSOperationQueue *)queue progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadVideoCompletedBlock)completedBlock;

@end
