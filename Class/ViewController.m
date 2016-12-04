//
//  ViewController.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/11.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd
//  首页
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"进入首页");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"XHLaunchAdExample";
//    self.lab.text = @"-1.网络视频广告目前只支持mp4格式 \n\n-2.网络视频广告不支持实时展示,只支持缓存ok后下次展示 \n\n-3.使用说明及注意事项见github:\n https://github.com/CoderZhuXH/XHLaunchAd ";
    
    self.lab.text = @"使用说明及注意事项见github:\n https://github.com/CoderZhuXH/XHLaunchAd ";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



@end
