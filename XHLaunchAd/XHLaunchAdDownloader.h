//
//  XHLaunchAdDownloaderManager.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/12/1.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import "XHLaunchAdDownload.h"

@interface XHLaunchAdDownloader : NSObject

+(nonnull instancetype )sharedDownloader;

- (void)downloadImageWithURL:(nonnull NSURL *)url progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadImageCompletedBlock)completedBlock;

- (void)downLoadImageAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray;

- (void)downloadVideoWithURL:(nonnull NSURL *)url progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadVideoCompletedBlock)completedBlock;

- (void)downLoadVideoAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray;

@end
