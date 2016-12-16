//
//  XHLaunchAdDownloaderManager.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/12/1.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdDownloader.h"
#import "XHLaunchAdCache.h"
#import "NSString+XHLaunchAd.h"
@interface XHLaunchAdDownloader()<XHLaunchAdDownloadDelegate>

@property (strong, nonatomic, nonnull) NSOperationQueue *downloadImageQueue;
@property (strong, nonatomic, nonnull) NSOperationQueue *downloadVideoQueue;

@property (strong, nonatomic) NSMutableDictionary *allDownloadDict;

@end

@implementation XHLaunchAdDownloader

+(nonnull instancetype )sharedDownloader{
    
    static XHLaunchAdDownloader *instance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{
        
        instance = [[XHLaunchAdDownloader alloc] init];
        
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _downloadImageQueue = [NSOperationQueue new];
        _downloadImageQueue.maxConcurrentOperationCount = 6;
        _downloadImageQueue.name = @"com.returnoc.XHLaunchAdDownloadImageQueue";
        _downloadVideoQueue = [NSOperationQueue new];
        _downloadVideoQueue.maxConcurrentOperationCount = 3;
        _downloadVideoQueue.name = @"com.returnoc.XHLaunchAdDownloadVideoQueue";
    }
    return self;
}

- (void)downloadImageWithURL:(nonnull NSURL *)url progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadImageCompletedBlock)completedBlock
{
    
    if(self.allDownloadDict[url.absoluteString.xh_md5String]) return;
    XHLaunchAdImageDownload * download = [[XHLaunchAdImageDownload alloc] initWithURL:url delegateQueue:_downloadImageQueue progress:progressBlock completed:completedBlock];
    download.delegate = self;
    [self.allDownloadDict setObject:download forKey:url.absoluteString.xh_md5String];
}

- (void)downLoadImageAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray
{
    [urlArray enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
        
        if(![XHLaunchAdCache checkImageInCacheWithURL:url])//尚未缓存
        {
        
            [self downloadImageWithURL:url progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error) {
                    
                    [XHLaunchAdCache async_saveImageData:data imageURL:url];
              
                
            }];
        }
    }];

}
- (void)downloadVideoWithURL:(nonnull NSURL *)url progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadVideoCompletedBlock)completedBlock
{

    if(self.allDownloadDict[url.absoluteString.xh_md5String]) return;
    XHLaunchAdVideoDownload * download = [[XHLaunchAdVideoDownload alloc] initWithURL:url delegateQueue:_downloadVideoQueue progress:progressBlock completed:completedBlock];
    download.delegate = self;
    [self.allDownloadDict setObject:download forKey:url.absoluteString.xh_md5String];

}
- (void)downLoadVideoAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray
{
    [urlArray enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger idx, BOOL *stop) {
        
        if(![XHLaunchAdCache checkVideoInCacheWithURL:url])//尚未缓存
        {
            [self downloadVideoWithURL:url progress:nil completed:^(NSURL * _Nullable location, NSError * _Nullable error) {
               
                if(!error && location)
                {
                
                    [XHLaunchAdCache async_saveVideoAtLocation:location URL:url];
                }
                
            }];
            
        }
    }];

}
- (NSMutableDictionary *)allDownloadDict {
    if (!_allDownloadDict) {
        
        _allDownloadDict = [[NSMutableDictionary alloc] init];
    }
    
    return _allDownloadDict;
}

- (void)downloadFinishWithURL:(NSURL *)url{

    [self.allDownloadDict removeObjectForKey:url.absoluteString.xh_md5String];
}

@end

