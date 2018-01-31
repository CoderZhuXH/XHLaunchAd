//
//  ViewController.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/11.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd
//  首页
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"进入首页");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"XHLaunchAdExample";
    
    self.label.text = @"使用说明及注意事项见github:\n https://github.com/CoderZhuXH/XHLaunchAd";
    
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



@end
