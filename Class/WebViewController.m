//
//  WebViewController.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/9/8.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    [self setupWebView];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)setupWebView{

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.URLString]];
    [self.myWebView loadRequest:request];

}
- (IBAction)closeAction:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];

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
