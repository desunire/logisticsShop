//
//  KLDetailViewController.m
//  siRuiLogistics
//
//  Created by desunire on 2017/9/22.
//  Copyright © 2017年 desunire. All rights reserved.
//

#import "KLDetailViewController.h"
#import <WebKit/WebKit.h>
@interface KLDetailViewController ()

@property (strong, nonatomic) WKWebView *webView;

@end

@implementation KLDetailViewController

#pragma mark - LazyLoad

- (WKWebView *)webView
{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero];
        _webView.frame = self.view.bounds;
        [self.view addSubview:_webView];
    }
    return _webView;
}


#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBase];
    
    [self setUpGoodsParticularsWKWebView];
}

- (void)setUpBase
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView.backgroundColor = self.view.backgroundColor;
}

- (void)setUpGoodsParticularsWKWebView
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [self.webView loadRequest:request];
}

@end
