//
//  RulerViewController.m
//  MyTestVC
//
//  Created by wbb on 2017/9/8.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "RulerViewController.h"
#define DISTANCEVALUE 8.f // 每隔刻度实际长度8个点

@interface RulerViewController ()<UIScrollViewDelegate> {
    NSInteger _rulerCount;
}
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation RulerViewController

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 100, 300, 80)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _rulerCount = 100;
    [self setRulerSV];
}
- (void)setRulerSV
{
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.strokeColor = [UIColor grayColor].CGColor;
    layer1.lineWidth = 1;
    [self.scrollView.layer addSublayer:layer1];

    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    for (int i = 0; i<_rulerCount; i++) {
        [path1 moveToPoint:CGPointMake(DISTANCEVALUE*i,-50 )];
        [path1 addLineToPoint:CGPointMake(DISTANCEVALUE*i, 80)];
        layer1.path = path1.CGPath;
    }
    self.scrollView.contentSize = CGSizeMake(_rulerCount * DISTANCEVALUE, 80);

    
    
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
