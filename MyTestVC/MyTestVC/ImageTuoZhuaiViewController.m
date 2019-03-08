//
//  ImageTuoZhuaiViewController.m
//  MyTestVC
//
//  Created by 杨飞 on 17/2/24.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "ImageTuoZhuaiViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
static CGRect oldframe;//用于记录按钮放大之前的frame
@interface ImageTuoZhuaiViewController ()<UIScrollViewDelegate>{
    UIView *imgView;//展示图片的父视图
    NSMutableArray *imagesArray;//存储图片
    CATransition *animation;//缩放动画效果
    CGFloat scaleNum;//图片放大倍数
}
@property(nonatomic,strong)UIScrollView *scrollview;//用于捏合放大与缩小的scrollView
@property(nonatomic,strong)UIButton *imgButton;//显示图片的按钮

@end

@implementation ImageTuoZhuaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    imagesArray=[[NSMutableArray alloc] initWithCapacity:0];
    
    //获取网络图片并存入到imagesArray中的代码，放到此处,此处以本地图片为例
    for (int i=0; i<5; i++) {
        UIImage *image = [UIImage imageNamed:@"default_head"];
        [imagesArray addObject:image];
    }
    //然后进行视图的布局,进行图片的显示
    NSInteger rows =imagesArray.count%3==0?imagesArray.count/3:imagesArray.count/3+1;
    CGFloat height = ((SCREEN_WIDTH -20)/3)+2.5;
    imgView = [[UIView alloc]initWithFrame:CGRectMake(0,64,SCREEN_WIDTH, (10+(5+height)*rows))];
    [self.view addSubview:imgView];
    
    [self loadImageShowOnView];
//    [self semaphore];
    
    
    
    
//    NSLog(@"1");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2");
//    });
//    NSLog(@"3");
}
- (void)semaphore {
    dispatch_semaphore_t signal;
    signal = dispatch_semaphore_create(1);
    __block long x = 0;
    NSLog(@"0_x:%ld",x);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        NSLog(@"waiting");
        x = dispatch_semaphore_signal(signal);
        NSLog(@"1_x:%ld",x);
        
        sleep(2);
        NSLog(@"waking");
        x = dispatch_semaphore_signal(signal);
        NSLog(@"2_x:%ld",x);
    });
    //    dispatch_time_t duration = dispatch_time(DISPATCH_TIME_NOW, 1*1000*1000*1000); //超时1秒
    //    dispatch_semaphore_wait(signal, duration);
    
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"3_x:%ld",x);
    
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"wait 2");
    NSLog(@"4_x:%ld",x);
    
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"wait 3");
    NSLog(@"5_x:%ld",x);
}
#pragma mark - 展示图片
-(void)loadImageShowOnView{
    CGRect aRect, bRect, bounds = CGRectMake(2.5, 10, imgView.bounds.size.width,10000000);
    NSInteger rows =imagesArray.count%3==0?imagesArray.count/3:imagesArray.count/3+1;
    for (int i =0; i<rows; i++) {
        DivideWithPadding(bounds, &aRect, &bounds,90,5,CGRectMinYEdge);
        for (int m =0; m<3; m++) {
            NSInteger index = i * 3 + m;
            if (index >= imagesArray.count) {
                return;
            }
            DivideWithPadding(aRect, &bRect, &aRect, bounds.size.width/3-5,5,CGRectMinXEdge);
            UIImage *img= [imagesArray objectAtIndex:index];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = bRect;
            [button setImage:img forState:UIControlStateNormal];
            [button addTarget:self action:@selector(enlargeImage:) forControlEvents:UIControlEventTouchUpInside];
            button.exclusiveTouch =YES;//禁止两个按钮同时被点击，引起图片显示错乱现象发生
            [imgView addSubview:button];
        }
    }
}

#pragma mark - 放大图片
-(void)enlargeImage:(UIButton *)button{
    scaleNum=1;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe=[button convertRect:button.bounds toView:imgView];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    button.tag=1;
    
    //添加捏合手势，放大与缩小图片
    self.scrollview=[[UIScrollView alloc]initWithFrame:backgroundView.bounds];
    self.imgButton=button;
    [self.scrollview addSubview:button];
    
    //设置UIScrollView的滚动范围和图片的真实尺寸一致
    self.scrollview.contentSize=button.frame.size;
    //设置实现缩放
    //设置代理scrollview的代理对象
    self.scrollview.delegate=self;
    //设置最大伸缩比例
    self.scrollview.maximumZoomScale=3;
    //设置最小伸缩比例
    self.scrollview.minimumZoomScale=1;
    [self.scrollview setZoomScale:1 animated:NO];
    
    self.scrollview.scrollsToTop =NO;
    self.scrollview.scrollEnabled =YES;
    self.scrollview.showsHorizontalScrollIndicator=NO;
    self.scrollview.showsVerticalScrollIndicator=NO;
    
    [backgroundView addSubview:self.scrollview];
    [window addSubview:backgroundView];
    
    //单击手势
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    singleTapGesture.numberOfTapsRequired = 1;
    singleTapGesture.numberOfTouchesRequired  =1;
    [backgroundView addGestureRecognizer:singleTapGesture];
    
    //双击手势
    UITapGestureRecognizer *doubleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
    doubleTapGesture.numberOfTapsRequired = 2;
    doubleTapGesture.numberOfTouchesRequired =1;
    [backgroundView addGestureRecognizer:doubleTapGesture];
    
    [singleTapGesture requireGestureRecognizerToFail:doubleTapGesture];
    
    [UIView animateWithDuration:0.3 animations:^{
        button.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-(button.frame.size.height*[UIScreen mainScreen].bounds.size.width/button.frame.size.width+80))/2, [UIScreen mainScreen].bounds.size.width, button.frame.size.height*[UIScreen mainScreen].bounds.size.width/button.frame.size.width+80);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        button.userInteractionEnabled=NO;
    }];
}

#pragma mark - 还原图片
-(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIButton *button=(UIButton *)[tap.view viewWithTag:1];
    animation = [CATransition animation];
    animation.duration =0.2;
    animation.timingFunction =UIViewAnimationCurveEaseInOut;
    animation.fillMode =kCAFillModeForwards;
    animation.type =kCATransition;
    backgroundView.alpha=0;
    [backgroundView.layer addAnimation:animation forKey:@"animation"];
    button.frame=oldframe;
    [imgView addSubview:button];
    button.userInteractionEnabled=YES;
}
#pragma mark - 处理单击手势
-(void)handleSingleTap:(UIGestureRecognizer *)sender{
    UITapGestureRecognizer *tap=(UITapGestureRecognizer *)sender;
    [self hideImage:tap];
}
#pragma mark - 处理双击手势
-(void)handleDoubleTap:(UIGestureRecognizer *)sender{
    if (scaleNum>=1&&scaleNum<=2) {
        scaleNum++;
    }else{
        scaleNum=1;
    }
    [self.scrollview setZoomScale:scaleNum animated:YES];
}
#pragma mark - UIScrollViewDelegate,告诉scrollview要缩放的是哪个子控件
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imgButton;
}
#pragma mark - 等比例放大，让放大的图片保持在scrollView的中央
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGFloat offsetX = (self.scrollview.bounds.size.width > self.scrollview.contentSize.width)?(self.scrollview.bounds.size.width - self.scrollview.contentSize.width) *0.5 : 0.0;
    CGFloat offsetY = (self.scrollview.bounds.size.height > self.scrollview.contentSize.height)?
    (self.scrollview.bounds.size.height - self.scrollview.contentSize.height) *0.5 : 0.0;
    self.imgButton.center =CGPointMake(self.scrollview.contentSize.width *0.5 + offsetX,self.scrollview.contentSize.height *0.5 + offsetY);
}
#pragma mark - 自动排列图片
void DivideWithPadding(CGRect rect,CGRect *slice,CGRect *remainder,CGFloat amount,CGFloat padding,CGRectEdge edge) {
    CGRect tmpSlice;
    CGRectDivide(rect, &tmpSlice, &rect, amount, edge);
    if (slice) {
        *slice = tmpSlice;
    }
    CGRectDivide(rect, &tmpSlice, &rect, padding, edge);
    if (remainder) {
        *remainder = rect;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
