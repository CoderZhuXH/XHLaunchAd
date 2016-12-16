//
//  XHLaunchImageView.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchImageView.h"


@interface XHLaunchImageView ()

@end

@implementation XHLaunchImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = YES;
        self.image = [self launchImage];
    }
    return self;
}

-(UIImage *)launchImage
{
    UIImage *imageP = [self launchImageWithType:@"Portrait"];
    if(imageP) return imageP;
    UIImage *imageL = [self launchImageWithType:@"Landscape"];
    if(imageL) return imageL;
    NSLog(@"获取LaunchImage失败!请检查是否添加启动图,或者规格是否有误.");
    return nil;
}
-(UIImage *)launchImageWithType:(NSString *)type
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = type;
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if([viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            if([dict[@"UILaunchImageOrientation"] isEqualToString:@"Landscape"])
            {
                imageSize = CGSizeMake(imageSize.height, imageSize.width);
            }
            if(CGSizeEqualToSize(imageSize, viewSize))
            {
                launchImageName = dict[@"UILaunchImageName"];
                UIImage *image = [UIImage imageNamed:launchImageName];
                return image;
            }
        }
    }
    return nil;
}
@end
