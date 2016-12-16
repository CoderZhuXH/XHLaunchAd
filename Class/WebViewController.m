//
//  WebViewController.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/9/8.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd
//  广告详情页

#import "WebViewController.h"
#import "UIView+MBProgressHUD.h"
@interface WebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.URLString]];
    [self.myWebView loadRequest:request];

}

- (IBAction)closeAction:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];

}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.view showHUD];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view hideHUD];
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
