//
//  ViewController.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/11.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "ViewController.h"
#import "UIImageView+XHWebCache.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"启动页广告";
    
    self.lab.text = @"使用说明及注意事项见github:\n https://github.com/CoderZhuXH/XHLaunchAd";
    
    NSLog(@"启动广告,不阻塞 主控制器 加载");
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
