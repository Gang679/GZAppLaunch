//
//  ActionViewController.h
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/27.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionViewController : UIViewController
// 创建圆角矩形
+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
@end
