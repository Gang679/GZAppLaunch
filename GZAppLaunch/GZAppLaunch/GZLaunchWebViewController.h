//
//  GZLaunchWebViewController.h
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/21.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZLaunchWebViewController : UIViewController

@property(nonatomic,strong)NSString *requestURL;

//导航栏view
@property(nonatomic,strong)UIView *navigationView;


/**
 广告标题
 */
@property(nonatomic,strong)NSString *titleString;

/**
 根视图控制器
 */
@property(nonatomic,strong)UIViewController *mainViewController;


@end
