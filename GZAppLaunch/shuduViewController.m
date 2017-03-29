  //
//  shuduViewController.m
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/27.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "shuduViewController.h"
#import "YanhuaViewController.h"
#import "surprisedViewController.h"

@interface shuduViewController ()

@end

@implementation shuduViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数独" ;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.prompt = @"闲着没事";
    _result.text = @"回答正确有惊喜！";

    [self replay:[UIButton alloc]];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)replay:(id)sender {
    [self.view endEditing:YES];
    
    NSArray *numberArray = @[ @[@"1",@"2", @"3"], @[@"2", @"3", @"1"], @[@"3", @"1", @"2"]];
    
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:numberArray];
    
    int rand1 = arc4random() % 3;
    int rand2 = arc4random() % 3;
    
    NSArray *tmpArray = @[];
    
    tmpArray = muArray[rand1];
    muArray[rand1] = muArray[rand2];
    muArray[rand2] = tmpArray;
    
    _finishArray = muArray;
    
    NSArray *textfieldArray = @[ _number1 , _number2 , _number3 , _number4, _number5 , _number6, _number7 , _number8 ,_number9];
    
    int flag = 0;
    for( int i = 0; i < [muArray count]; i++ ){
        for( int j = 0; j < [muArray[i] count]; j++){
            //NSLog( @"%i , %@", flag, muArray[i][j] );
            UITextField *str = textfieldArray[flag];
            str.text = muArray[i][j];
            flag++;
        }
    }
    
    for( int n = 0 ; n < 4 ; n++ ){
        int tmpFlag = arc4random() % 9 ;
        UITextField *str1 = textfieldArray[tmpFlag];
        str1.text = @"";
    }
    
    
}

- (IBAction)finish:(id)sender {
    [self.view endEditing:YES];
    NSArray *textfieldArray = @[ @[_number1 , _number2 , _number3] , @[_number4, _number5 , _number6], @[_number7 , _number8 ,_number9]];
    //_finishArray
    int flag = 1;
    
//    NSLog( @"finshArray :%@", _finishArray);
    
    for( int i = 0; i < [textfieldArray count]; i++ ){
        for( int j = 0; j < [textfieldArray[i] count]; j++ ){
            UITextField *field = textfieldArray[i][j];
            if( ![field.text isEqualToString: _finishArray[i][j]] ){
                flag = 0;
            }
        }
    }
    
    if( flag == 1 ){
        YanhuaViewController *surprise = [[YanhuaViewController alloc]init];
        [self.navigationController pushViewController:surprise animated:YES];
    }else{
        surprisedViewController *surprise = [[surprisedViewController alloc]init];
        surprise.title = @"回答错误";
        [self.navigationController pushViewController:surprise animated:YES];
    }
}

@end
