//
//  ViewController.m
//  GZAppLaunch
//
//  Created by xinshijie on 17/3/20.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)UITableView *ScrollViews ;

@property (strong, nonatomic) CADisplayLink *displayLink;


@property (assign,nonatomic) int count;

@property (strong,nonatomic) NSArray *dataArray;
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
    //self.ScrollViews.userInteractionEnabled = NO;
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

- (void)dealloc {
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
}
-(UITableView *)ScrollViews{
    if (!_ScrollViews) {
        _ScrollViews = [[UITableView alloc]initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width - 100, 150)];
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
