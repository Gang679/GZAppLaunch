//
//  mouseViewController.h
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/28.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mouseViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *Number1;
@property (weak, nonatomic) IBOutlet UITextField *Number2;

@property (weak, nonatomic) IBOutlet UITextField *Result;

@property (weak, nonatomic) IBOutlet UITextField *changeString;

@property (weak, nonatomic) IBOutlet UITextField *changedString;


- (IBAction)changeButton:(id)sender;


- (IBAction)ButtonResult:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *senderOutLet;

//----------- 地鼠

@property(nonatomic ,strong) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIButton *button1set;

- (IBAction)button1:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button2set;

- (IBAction)button2:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button3set;

- (IBAction)button3:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button4set;

- (IBAction)button4:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button5set;

- (IBAction)button5:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button6set;

- (IBAction)button6:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button7set;

- (IBAction)button7:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button8set;

- (IBAction)button8:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *button9set;

- (IBAction)button9:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *mouseNumber;

@property (weak, nonatomic) IBOutlet UILabel *score;

@end
