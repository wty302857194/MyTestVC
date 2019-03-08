//
//  CJDaiGouMainViewController.m
//  MyTestVC
//
//  Created by 杨飞 on 17/1/20.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "CJDaiGouMainViewController.h"
#import "CJDaiGouViewController.h"
#import "CJDaiGouListViewController.h"
#define kScreenWidth   [[UIScreen mainScreen]bounds].size.width  //屏宽
#define kScreenHeight  [[UIScreen mainScreen]bounds].size.height //屏高
@interface CJDaiGouMainViewController ()
@property (strong, nonatomic)  UIScrollView *main_scrollView;

@end

@implementation CJDaiGouMainViewController
- (void)dealloc {
    NSLog(@"走了吗");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addVCInScrollView];
}
- (UIScrollView *)main_scrollView {
    if (!_main_scrollView) {
        _main_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-50-64)];
        _main_scrollView.showsVerticalScrollIndicator = NO;
        _main_scrollView.showsHorizontalScrollIndicator = NO;
        _main_scrollView.pagingEnabled = YES;
        _main_scrollView.scrollEnabled = NO;//禁止滚动
        _main_scrollView.contentSize = CGSizeMake(kScreenWidth*2, kScreenHeight-50-64);
        [self.view addSubview:_main_scrollView];
    }
    return _main_scrollView;
}

- (void)addVCInScrollView {
    CJDaiGouViewController *yinDao = [[CJDaiGouViewController alloc] init];
    yinDao.view.frame = CGRectMake(0, 0, kScreenWidth, self.main_scrollView.contentSize.height);

    yinDao.view.backgroundColor = [UIColor redColor];
    CJDaiGouListViewController *cjList = [[CJDaiGouListViewController alloc] init];
    cjList.view.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, self.main_scrollView.contentSize.height);

    cjList.view.backgroundColor = [UIColor blueColor];

    [self.main_scrollView addSubview:yinDao.view];
    [self.main_scrollView addSubview:cjList.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)MyDaiGou:(UIButton *)sender {
    self.navigationItem.title = @"长江代购";
    [self.main_scrollView setContentOffset:CGPointMake(sender.tag*kScreenWidth, self.main_scrollView.contentOffset.y)];
}
- (IBAction)CJDaiGou:(UIButton *)sender {
    self.navigationItem.title = @"我的代购";
    [self.main_scrollView setContentOffset:CGPointMake(sender.tag*kScreenWidth, self.main_scrollView.contentOffset.y)];
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
