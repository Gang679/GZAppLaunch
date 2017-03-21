//
//  AppDelegate.m
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/20.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "AppDelegate.h"
#import "GZAppLaunchViewController.h"
#import "ViewController.h"
@interface AppDelegate ()

@end
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#pragma mark 广告
    [self GZLaunchViewController];
#pragma mark 轮播图
    [self CarouselLaunchViewController];
#pragma mark gif图
      [self GifLaunchViewController];
#pragma mark 滚动图片
      [self RollImageLaunchViewController];
    return YES;
}

#pragma mark 广告
-(void)GZLaunchViewController{
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        
        GZAppLaunchViewController *vc = [[GZAppLaunchViewController alloc]initWithGZAppMainVC:[[ViewController alloc]init] viewControllerType:GZLaunchViewController];
    
       vc.imageURL = @"http://down2.laifudao.com/images/tupian/2014115214214.jpg";
    
        vc.adURL = @"http://www.jianshu.com/u/ab83189244d9";//简书地址
    /*
    @"https://github.com/Gang679"github地址
     */
        self.window.rootViewController = vc;
    
        [self.window makeKeyAndVisible];

}
#pragma mark 轮播图

-(void)CarouselLaunchViewController{
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        GZAppLaunchViewController *vc = [[GZAppLaunchViewController alloc]initWithGZAppMainVC:[[ViewController alloc]init] viewControllerType:CarouselLaunchViewController];
        vc.imageNameArray = @[@"轮播图1",@"轮播图2",@"轮播图3"];
        self.window.rootViewController = vc;
        [self.window makeKeyAndVisible];

}

#pragma mark gif图
-(void)GifLaunchViewController{
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        GZAppLaunchViewController *vc = [[GZAppLaunchViewController alloc]initWithGZAppMainVC:[[ViewController alloc]init] viewControllerType:GifLaunchViewController];
    
        //不需要加.gif后缀
        vc.gifImageName = @"动图1";
    
        //网络gif图片URL
       //vc.gifImageURL = @"http://img4.imgtn.bdimg.com/it/u=1067220870,225904732&fm=23&gp=0.jpg";
    
       //往页面上添加数据
       UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 100,[UIScreen mainScreen].bounds.size.width , 60)];
    
       titleLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    
        titleLable.textColor = [UIColor whiteColor];
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.text = @"雄 关 漫 道 真 如 铁";
        [vc.frontGifView addSubview:titleLable];
        self.window.rootViewController = vc;
        [self.window makeKeyAndVisible];
}

#pragma mark 滚动图片
-(void)RollImageLaunchViewController{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor orangeColor];
    
    GZAppLaunchViewController *vc = [[GZAppLaunchViewController alloc]initWithGZAppMainVC:[[ViewController alloc]init] viewControllerType:RollImageLaunchViewController];
    
    vc.rollImageName = @"滚动图.jpg";
    
    //往页面上添加数据
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 100,[UIScreen mainScreen].bounds.size.width , 60)];
    
    titleLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    
    titleLable.textColor = [UIColor orangeColor];
    
    titleLable.textAlignment = NSTextAlignmentCenter;
    
    titleLable.text = @"而 今 迈 步 从 头 越";
    
    [vc.frontRollView addSubview:titleLable];
    
    
    self.window.rootViewController = vc;

    [self.window makeKeyAndVisible];

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
