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
#import "XHLaunchAdImage.h"

#pragma mark - XHLaunchAdDownload
@interface XHLaunchAdDownload()

@property (strong, nonatomic) NSURLSession *session;
@property(strong,nonatomic)NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, assign) unsigned long long totalLength;
@property (nonatomic, assign) unsigned long long currentLength;
@property (nonatomic, copy) XHLaunchAdDownloadProgressBlock progressBlock;
@property (strong, nonatomic) NSURL *url;

@end
@implementation XHLaunchAdDownload

@end

#pragma mark -  XHLaunchAdImageDownload
@interface XHLaunchAdImageDownload()<NSURLSessionDownloadDelegate,NSURLSessionTaskDelegate>

@property (nonatomic, copy ) XHLaunchAdDownloadImageCompletedBlock completedBlock;

@end
@implementation XHLaunchAdImageDownload

-(nonnull instancetype)initWithURL:(nonnull NSURL *)url delegateQueue:(nonnull NSOperationQueue *)queue progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadImageCompletedBlock)completedBlock
{
    self = [super init];
    
    if (self) {
        self.url = url;
        self.progressBlock = progressBlock;
        _completedBlock = completedBlock;
        NSURLSessionConfiguration * sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.timeoutIntervalForRequest = 15.0;
        self.session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                                     delegate:self
                                                delegateQueue:queue];
        
        self.downloadTask =  [self.session downloadTaskWithRequest:[NSURLRequest requestWithURL:url]];
        [self.downloadTask resume];
    }
    return self;
}
#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    
    NSData *data = [NSData dataWithContentsOfURL:location];
    UIImage *image = [XHLaunchAdImage imageWithData:data];
    //主线程回调
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (_completedBlock) {
            _completedBlock(image,data, nil);
            // 防止重复调用
            _completedBlock = nil;
        }
        //下载完成回调
        if ([self.delegate respondsToSelector:@selector(downloadFinishWithURL:)]) {
            [self.delegate downloadFinishWithURL:self.url];
        }
    });
    
    //销毁
    [self.session invalidateAndCancel];
    self.session = nil;
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    self.currentLength = totalBytesWritten;
    self.totalLength = totalBytesExpectedToWrite;
    
    if (self.progressBlock) {
        self.progressBlock(self.totalLength, self.currentLength);
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    if (error){
        NSLog(@"error=%@",error);
        if (_completedBlock) {
            _completedBlock(nil,nil, error);
        }
        _completedBlock = nil;
    }
}

//处理HTTPS请求的
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler
{
    NSURLProtectionSpace *protectionSpace = challenge.protectionSpace;
    if ([protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        SecTrustRef serverTrust = protectionSpace.serverTrust;
        completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:serverTrust]);
    } else {
        completionHandler(NSURLSessionAuthChallengePerformDefaultHandling, nil);
    }
}

@end

#pragma makr - XHLaunchAdVideoDownload
@interface XHLaunchAdVideoDownload()<NSURLSessionDownloadDelegate,NSURLSessionTaskDelegate>

@property (nonatomic, copy ) XHLaunchAdDownloadVideoCompletedBlock completedBlock;

@end
@implementation XHLaunchAdVideoDownload

-(nonnull instancetype)initWithURL:(nonnull NSURL *)url delegateQueue:(nonnull NSOperationQueue *)queue progress:(nullable XHLaunchAdDownloadProgressBlock)progressBlock completed:(nullable XHLaunchAdDownloadVideoCompletedBlock)completedBlock
{
    self = [super init];
    if (self) {
        
        self.url = url;
        self.progressBlock = progressBlock;
        _completedBlock = completedBlock;
        NSURLSessionConfiguration * sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.timeoutIntervalForRequest = 15.0;
        self.session = [NSURLSession sessionWithConfiguration:sessionConfiguration
                                                     delegate:self
                                                delegateQueue:queue];
        self.downloadTask =  [self.session downloadTaskWithRequest:[NSURLRequest requestWithURL:url]];
        [self.downloadTask resume];
    }
    return self;
    
}

#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    
    NSError *error=nil;
    NSURL *toURL = [NSURL fileURLWithPath:[XHLaunchAdCache videoPathWithURL:self.url]];
    [[NSFileManager defaultManager] copyItemAtURL:location toURL:toURL error:&error];
    if(error)  NSLog(@"error=%@",error);
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (_completedBlock) {
            
            if(!error)
            {
                _completedBlock(toURL,nil);
            }
            else
            {
                _completedBlock(nil,error);
            }
            // 防止重复调用
            _completedBlock = nil;
        }
        //下载完成回调
        if ([self.delegate respondsToSelector:@selector(downloadFinishWithURL:)]) {
            [self.delegate downloadFinishWithURL:self.url];
        }
    });
    
    [self.session invalidateAndCancel];
    self.session = nil;
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
    self.currentLength = totalBytesWritten;
    self.totalLength = totalBytesExpectedToWrite;
    
    if (self.progressBlock) {
        self.progressBlock(self.totalLength, self.currentLength);
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    if (error) {
        if (_completedBlock) {
            _completedBlock(nil, error);
        }
        _completedBlock = nil;
    }
}

@end


#pragma mark - XHLaunchAdDownloader
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
        _downloadImageQueue.name = @"com.it7090.XHLaunchAdDownloadImageQueue";
        _downloadVideoQueue = [NSOperationQueue new];
        _downloadVideoQueue.maxConcurrentOperationCount = 3;
        _downloadVideoQueue.name = @"com.it7090.XHLaunchAdDownloadVideoQueue";
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
        
        if(![XHLaunchAdCache checkImageInCacheWithURL:url])
        {
            [self downloadImageWithURL:url progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error) {
                
                [XHLaunchAdCache async_saveImageData:data imageURL:url];
                
            }];
            
        };
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
        
        if(![XHLaunchAdCache checkVideoInCacheWithURL:url])
        {
            [self downloadVideoWithURL:url progress:nil completed:^(NSURL * _Nullable location, NSError * _Nullable error) {
                
                if(!error && location) [XHLaunchAdCache async_saveVideoAtLocation:location URL:url];
                
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

