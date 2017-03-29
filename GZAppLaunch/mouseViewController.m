//
//  mouseViewController.m
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/28.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "mouseViewController.h"

@interface mouseViewController ()

@end

@implementation mouseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(setMouse) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//转换大写
- (IBAction)changeButton:(id)sender {
    _changedString.text = [_changeString.text uppercaseString];
}

//当“计算”按钮点击以后 得到Number1 和 Number2 的值相加以后放入Result结果控件里
- (IBAction)ButtonResult:(id)sender {
    NSLog( @"Button Press");
    NSString *str = [NSString stringWithFormat:@"%i",
                     [_Number1.text intValue] + [_Number2.text intValue]];
    _Result.text = str;
}

// 打地鼠游戏
- (void) setMouse
{
    //数组里装着 9个按钮对象
    NSArray *array = @[ _button1set , _button2set , _button3set ,
                        _button4set ,
                        _button5set ,
                        _button6set ,
                        _button7set ,
                        _button8set ,
                        _button9set ];
    
    //随机整个数组 并且设置某个按钮的标签名
    int flag = arc4random() % 9;
    [array[flag] setTitle:@"地鼠" forState:UIControlStateNormal];
    
    //设置产生地鼠的个数
    _mouseNumber.text = [NSString stringWithFormat:@"%i",[_mouseNumber.text intValue] + 1];
    
}

- (IBAction)button1:(id)sender {
    if( [_button1set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button1set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}

- (IBAction)button2:(id)sender {
    if( [_button2set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button2set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}

- (IBAction)button3:(id)sender {
    if( [_button3set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button3set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}

- (IBAction)button4:(id)sender {
    if( [_button4set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button4set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}

- (IBAction)button5:(id)sender {
    if( [_button5set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button5set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}
- (IBAction)button6:(id)sender {
    if( [_button6set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button6set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}
- (IBAction)button7:(id)sender {
    if( [_button7set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button7set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}
- (IBAction)button8:(id)sender {
    if( [_button8set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button8set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}
- (IBAction)button9:(id)sender {
    if( [_button9set.titleLabel.text isEqualToString: @"地鼠"] ){
        [_button9set setTitle:@"地洞" forState:UIControlStateNormal];
        _score.text = [ NSString stringWithFormat:@"%i",[_score.text intValue] + 1];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
