//
//  GZLaunchWebViewController.m
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/21.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "GZLaunchWebViewController.h"

@interface GZLaunchWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;

@property(nonatomic,strong)UIActivityIndicatorView *activityIndicatorView;


@end

@implementation GZLaunchWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNavView];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    
    self.webView.scrollView.bounces = NO;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.requestURL]]];
    
    self.webView.delegate = self;
    
    [self.view addSubview:self.webView];
    
    [self loadActivityIndicatorView];
    
}

-(void)loadActivityIndicatorView{
    
    self.activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(20, 20, 100 , 100)];
    
    self.activityIndicatorView.center = self.view.center;
    
    self.activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:self.activityIndicatorView];
    
    
    [self.view bringSubviewToFront:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    
    self.activityIndicatorView.color = [UIColor lightGrayColor];
    
    
}

-(void)loadNavView{
    
    self.navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    
    self.navigationView.backgroundColor = [UIColor colorWithRed:130/255.0 green:156/255.0 blue:255/255.0 alpha:1.0];
    
    [self.view addSubview:self.navigationView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(5, 20, 60, 44)];
    
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    
    [button setTintColor:[UIColor whiteColor]];
    
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    
    [button addTarget:self action:@selector(setMainViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationView addSubview:button];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(65, 20, self.view.frame.size.width-130, 44)];
    
    if (self.titleString ==nil) {
        label.text = @"轻斟浅醉17";
        
    }else{
        
        
        label.text = self.titleString;
    }
    
    label.textColor = [UIColor whiteColor];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    
    [self.navigationView addSubview:label];
    
    
}




-(void)setMainViewController{
    
    
    self.view.window.rootViewController =self.mainViewController;
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityIndicatorView stopAnimating];
    
    [self.activityIndicatorView removeFromSuperview];
    
}




@end
