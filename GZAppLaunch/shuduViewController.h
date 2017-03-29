//
//  shuduViewController.h
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/27.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shuduViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *number1;

@property (weak, nonatomic) IBOutlet UITextField *number2;

@property (weak, nonatomic) IBOutlet UITextField *number3;

@property (weak, nonatomic) IBOutlet UITextField *number4;

@property (weak, nonatomic) IBOutlet UITextField *number5;

@property (weak, nonatomic) IBOutlet UITextField *number6;

@property (weak, nonatomic) IBOutlet UITextField *number7;

@property (weak, nonatomic) IBOutlet UITextField *number8;

@property (weak, nonatomic) IBOutlet UITextField *number9;

- (IBAction)replay:(id)sender;

- (IBAction)finish:(id)sender;

@property (nonatomic, strong ) NSMutableArray *finishArray;

@property (weak, nonatomic) IBOutlet UILabel *result;

@end
