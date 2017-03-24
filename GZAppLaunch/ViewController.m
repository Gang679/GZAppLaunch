//
//  ViewController.m
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/20.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>

@property (nonatomic , strong)UITableView *ScrollViews ;

@property (strong, nonatomic) CADisplayLink *displayLink;


@property (assign,nonatomic) int count;

@property (strong,nonatomic) NSArray *dataArray;

@property (strong,nonatomic) UIImageView *img ;

@property (strong, nonatomic)NSTimer *timer; //图片长按识别
@property (strong, nonatomic)NSString *scannedResult;  //扫描出来的结果

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景图片
   // [self SetBackgroundImage];
    
    //我推荐大家使用的方法（当然我们也可以添加UIimageView实现效果）
    NSString *path = [[NSBundle mainBundle]pathForResource:@"GZAppImage" ofType:@"bundle"];
    UIImage *image = [UIImage imageWithContentsOfFile:[path stringByAppendingPathComponent:@"image.jpg"]];
    self.view.layer.contents = (id)image.CGImage;
    
    self.ScrollViews.backgroundColor = [UIColor greenColor];
    
    self.count = 0;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    //测试数据----->将需要展示的数据进行拼接,比如需要展示的数据数组为 @[@"1",@"2",@"3",@"4",@"5"] 那么需要拼接新数组 为 @[@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5"],示例如下
    self.dataArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5", nil];
    [self.ScrollViews setContentOffset:CGPointMake(0, 0) animated:YES];
    
    _img = [[UIImageView alloc]initWithFrame:CGRectMake(50, 0, self.view.bounds.size.width -100, 200)];
    _img.contentMode = UIViewContentModeScaleAspectFit;
    _img.image = [UIImage imageNamed:@"WechatIMG19"];
    _img.userInteractionEnabled = YES;
    
    //长按设置
    UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(dealLongPress:)];
    longGes.numberOfTouchesRequired = 1;
    [_img addGestureRecognizer:longGes];
    [self.view addSubview:_img];

}

//CADisplayLink 定时器 系统默认每秒调用60次
- (void) tick:(CADisplayLink *)displayLink {
    
    self.count ++;
    //(25.0 / 30.0) * (float)self.count) ---> (tableview需要滚动的contentOffset / 一共调用的次数) * 第几次调用
    //比如该demo中 contentOffset最大值为 = cell的高度 * cell的个数 ,5秒执行一个循环则调用次数为 300,没1/60秒 count计数器加1,当count=300时,重置count为0,实现循环滚动.
    [self.ScrollViews setContentOffset:CGPointMake(0, ((25.0 / 30.0) * (float)self.count)) animated:NO];
    
    if (self.count >= 300) {
        
        self.count = 0;
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1 ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellStyleDefault ;
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50 ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    //设置显示文本
    hud.labelText = [NSString stringWithFormat:@"您点击的是第%ld个",indexPath.row];
    //设置显示时间
    [hud hide: YES afterDelay: 1];
}

#pragma mark->长按识别二维码

-(void)dealLongPress:(UIGestureRecognizer*)gesture{
    
    if(gesture.state==UIGestureRecognizerStateBegan){
        /**
         *  fireDate:NSTimer的方法
         */
        _timer.fireDate=[NSDate distantFuture];
        UIImageView  *tempImageView=(UIImageView*)gesture.view;
        if(tempImageView.image){
            //1.初始化扫描仪，设置设别类型和识别质量
            CIDetector  *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
            //2.扫描获取的特征组
            NSArray*features = [detector featuresInImage:[CIImage imageWithCGImage:tempImageView.image.CGImage]];
            if(features.count>0) {
                CIQRCodeFeature *feature = [features objectAtIndex:0];
                NSString *scannedResult = feature.messageString;
                NSLog(@"扫描结果------%@",scannedResult);
                UIActionSheet *ac = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"发送给朋友",@"保存图片",@"识别图中二维码",nil];
                ac.tag = 1110 ;
                [ac showInView:self.view];
            }else{
                UIActionSheet *ac = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"发送给朋友",@"保存图片",nil];
                ac.tag = 1111 ;
                [ac showInView:self.view];
            }
        }else{
            UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"扫描结果"message:@"您还没有生成二维码"delegate:nil cancelButtonTitle:@"确定"otherButtonTitles:nil,nil];
            [alertView show];
        }
    }else if(gesture.state==UIGestureRecognizerStateEnded){
        _timer.fireDate=[NSDate distantPast];
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 8_3) __TVOS_PROHIBITED{
    
    if(buttonIndex == 1){
        //保存图片到沙盒中
        /*
        //拿到图片
        UIImage *image = [UIImage imageNamed:@"WechatIMG19.png"]; NSString *path_sandox = NSHomeDirectory();
        NSLog(@"%@",path_sandox);
        //设置一个图片的存储路径
        NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/flower.png"];
        //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
        [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
         */
        
        UIImageWriteToSavedPhotosAlbum(self.img.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        
    }
}

// 指定回调方法(看是否保存到手机相册)
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error == nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已存入手机相册" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保存失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
    
}
- (void)dealloc {
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
}
-(UITableView *)ScrollViews{
    if (!_ScrollViews) {
        _ScrollViews = [[UITableView alloc]initWithFrame:CGRectMake(50, 220, self.view.bounds.size.width - 100, 150)];
        [self.view addSubview:_ScrollViews];
        _ScrollViews.delegate = self ;
        _ScrollViews.dataSource = self ;
    }
    return _ScrollViews ;
}

-(void)SetBackgroundImage{
   // 1.将图片作为UIView的背景色，该方法过于占内存，不建议使用。
    //1.imageNamed方式
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image.jpg"]];
    
    
    //2.方式
    NSString *path = [[NSBundle mainBundle]pathForResource:@"image"ofType:@"jpg"];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:path]];
    
    //这两种方式都会在生成color时占用大量的内存。如果图片大小不够，就会平铺多张图片，不会去拉伸图片以适应View的大小。
    //在View释放后，1中的color不会跟着释放，而是一直存在内存中；2中的color会跟着释放掉，当然再次生成color时就会再次申请内存
   // 2.在UIView上再添加一个UIImageView显示图片作为UIView的背景图片
    //注意：如果有点击事件的话， userInteractionEnabled用户交互设置为YES。
   // 3.iOS视图都是一个图层，最先放置的图层就会在最底层，如此最先给UIView添加一个UIImageView就可以作为UIView的背景图片使用啦。
    //4 viewDidLoad方法中推荐的方法。
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
