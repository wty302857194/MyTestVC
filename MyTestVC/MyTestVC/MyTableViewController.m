//
//  MyTableViewController.m
//  MyTestVC
//
//  Created by 杨飞 on 17/1/19.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "MyTableViewController.h"
#import "CJDaiGouMainViewController.h"
#import "QQQiPaoViewController.h"
#import "ImageTuoZhuaiViewController.h"
//#import "TYLianXiViewController.h"
#import "MyAnimationViewController.h"
#import "RulerViewController.h"
#import "SemaphoreViewController.h"
#import "IphoneXViewController.h"
#import "SearchResultConductViewController.h"
//#import "SureLianXiViewController.h"
#import "BoundsViewController.h"
#import "TableSCViewController.h"
#import "64ViewController.h"

@interface MyTableViewController () {
//    NSTimer *_timer;
//    NSArray *_timeArr;
//    NSMutableArray *_timeMutableArr;
    NSThread *_currentThread;
}
@property (nonatomic,strong)NSArray *data_arr;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,strong)NSMutableArray *timeArr;
@property (nonatomic,strong)NSMutableArray *timeMutableArr;

@end

@implementation MyTableViewController
- (void)dealloc {
    NSLog(@"哥们来了。。。。。");
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self performSelector:@selector(cancelTimer) onThread:_currentThread withObject:nil waitUntilDone:YES];
    
}
- (void)cancelTimer {
    [self.timer invalidate];
    self.timer = nil;
    
    
}
- (NSArray *)data_arr {
    if (!_data_arr) {
        _data_arr = @[@"长江代购",@"气泡拖拽",@"图片拖拽",@"练习demo",@"动画",@"刻度尺",@"数据量",@"iphone X",@"二级列表",@"runtime",@"SureLianXiViewController",@"TableSCViewController",@ "64ViewController.h",@"BoundsViewController"];
    }
    return _data_arr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _timeMutableArr = [NSMutableArray arrayWithCapacity:0];
    _timeArr = [@[@"12341",@"24553",@"234523",@"4564",@"5675"] mutableCopy];
    [self timerRegist];
    
    
    NSString *str;
    if (TY_stringIsEmpty(str)) {
        return;
    }

    TYWeakSelf(self);
    
    TYStrongSelf(self);
    
    strongself;
}
- (void)timerRegist {
     __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        weakSelf.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerFire) userInfo:nil repeats:YES];
        _currentThread = [NSThread currentThread];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"走了吗。。。。。。");
    });
}
- (void)timerFire {
    for (int i=0; i<self.timeArr.count; i++) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UITableViewCell *cell = (UITableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            
            NSInteger num = [self.timeArr[i] integerValue];
            num++;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",(long)num];
            [_timeArr replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%ld",(long)num]];
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data_arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
        
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 5, 60, 30)];
//        [cell.contentView addSubview:view];
//        
//        UIButton *btn = [UIButton buttonWithType:0];
//        btn.frame = view.bounds;
//        btn.backgroundColor = [UIColor redColor];
//        [view addSubview:btn];
    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 5, 60, 30)];
    [cell.contentView addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:0];
    btn.frame = view.bounds;
    btn.backgroundColor = [UIColor redColor];
    [view addSubview:btn];
    [btn addTarget:self action:@selector(cellBtnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
//    for (UIView *view in cell.contentView.subviews) {
//        if ([view isKindOfClass:[UIButton class]]) {
//            UIButton *btn = (UIButton *)view;
//            [btn addTarget:self action:@selector(cellBtnClicked:event:) forControlEvents:UIControlEventTouchUpInside];
//        }
//    }
    
    cell.textLabel.text = self.data_arr[indexPath.row];

    return cell;
}
/**
 通过点击按钮的触摸点转换为tableView上的点，然后根据这个点获取cell
 */
- (void)cellBtnClicked:(id)sender event:(id)event
{
    NSSet *touches =[event allTouches];
    UITouch *touch =[touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.tableView];
    NSIndexPath *indexPath= [self.tableView indexPathForRowAtPoint:currentTouchPosition];
    if (indexPath!= nil)
    {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath: indexPath];
        NSLog(@"%@",cell);
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        CJDaiGouMainViewController *cjdaigou = [[CJDaiGouMainViewController alloc] init];
        [self.navigationController pushViewController:cjdaigou animated:YES];
    }else if (indexPath.row == 1) {
        QQQiPaoViewController *qqq = [[QQQiPaoViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 2) {
        ImageTuoZhuaiViewController *qqq = [[ImageTuoZhuaiViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 3) {
//        TYLianXiViewController *qqq = [[TYLianXiViewController alloc] init];
//        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 4) {
        MyAnimationViewController *qqq = [[MyAnimationViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 5) {
        RulerViewController *qqq = [[RulerViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 6) {
        SemaphoreViewController *qqq = [[SemaphoreViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 7) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        IphoneXViewController *qqq = [story instantiateViewControllerWithIdentifier:@"IphoneXViewController"];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 8) {
        SearchResultConductViewController *qqq = [[SearchResultConductViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }
//    else if (indexPath.row == 9) {
//        RunTimeViewController *qqq = [[RunTimeViewController alloc] init];
//        [self.navigationController pushViewController:qqq animated:YES];
//    }else if (indexPath.row == 10) {
//        SureLianXiViewController *qqq = [[SureLianXiViewController alloc] init];
//        [self.navigationController pushViewController:qqq animated:YES];
//    }

    else if (indexPath.row == 11) {
        TableSCViewController *qqq = [[TableSCViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 12) {
        _4ViewController *qqq = [[_4ViewController alloc] init];
        [self.navigationController pushViewController:qqq animated:YES];
    }else if (indexPath.row == 13) {
        BoundsViewController *vc = [[BoundsViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
