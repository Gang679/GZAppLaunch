//
//  GZAppLaunchViewController.h
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/21.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    GZLaunchViewController,//广告类型
    CarouselLaunchViewController,//轮播图新手导引类型
    GifLaunchViewController,//gif图背景类型
    RollImageLaunchViewController//滚动图片类型
}GZLaunchViewControllerType;

@interface GZAppLaunchViewController : UIViewController

/*
 初始化，指定根控制器
 @param GZAppmainVC App的根视图控制器
 @param LaunchviewControllerType 引导页面类型
 */
-(instancetype)initWithGZAppMainVC:(UIViewController *)GZAppmainVC viewControllerType:(GZLaunchViewControllerType )viewControllerType;
/* 
 跳转App根控制器
 */
-(void)SkipAppRootMainViewController ;

/*
 在除广告类型引导页上结束按钮
 */
@property (nonatomic , strong)UIButton *turnButton ;

/********************广告类型控制器相关参数************************/
/**
 广告图片的连接URL
 */
@property(nonatomic,strong)NSString *imageURL;


/**
 广告图片未出现之时的占位图,默认为"引导页.png",可自行设置.提高用户体验.
 */
@property(nonatomic,strong)NSString *placeholderImageName;


/**
 广告页的持续时间,默认为4秒钟
 */
@property(nonatomic,assign)NSInteger adTime;


/**
 广告的连接地址
 */
@property(nonatomic,strong)NSString *adURL;


/**
 广告页面标题
 */
@property(nonatomic,strong)NSString *titleString;

/**
 广告页面是否允许跳过,默认可以点击跳过
 */
@property(nonatomic,assign)BOOL isSkip;

/********************新手导引控制器相关参数************************/

//❗️❗️❗️❗️注意:如果同时加载本地图片数组和服务器图片数组,本地图片将不会生效.建议使用本地图片~因为服务器图片可能会造成卡顿,使用户体验效果下降.
/**
 加载本地图片数组来完成新手导引图片的加载,图片名称要命名规范.
 */
@property(nonatomic,strong)NSArray *imageNameArray;


/**
 加载图片URL数组来完成新手导引图片的加载,图片地址要命名规范
 */
@property(nonatomic,strong)NSArray *imageURLArray;

/**
 新手导引的页面标记
 */
@property(nonatomic,strong)UIPageControl *pageControl;


/********************GIF背景控制器相关参数************************/


//❗️❗️❗️❗️注意:如果同时加载本地图片和服务器图片,本地图片将不会生效.

/**
 本地GIF动态图背景的名称.
 */
@property(nonatomic,strong)NSString *gifImageName;


/**
 服务器GIF动态图背景的URL字符串.
 */
@property(nonatomic,strong)NSString *gifImageURL;


/**
 以动态图片为背景的frontView.
 */
@property(nonatomic,strong)UIView *frontGifView;


/**
 去除跳转按钮,默认是NO
 */
@property(nonatomic,assign)BOOL hideEndButton;





/********************滚动图片背景控制器相关参数**********************/

//❗️❗️❗️❗️注意:如果同时加载本地图片数组和服务器图片数组,本地图片将不会生效.建议使用本地图片~因为服务器图片可能会造成卡顿,使用户体验效果下降.

/**
 本地滚动图片的名称
 */
@property(nonatomic,strong)NSString *rollImageName;


/**
 服务器滚动图片的URL
 */
@property(nonatomic,strong)NSString *rollImageURL;


/**
 以滚动视图为背景的view
 */
@property(nonatomic,strong)UIView *frontRollView;

@end
