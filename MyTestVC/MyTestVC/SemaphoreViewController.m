//
//  SemaphoreViewController.m
//  MyTestVC
//
//  Created by wbb on 2017/9/19.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "SemaphoreViewController.h"

@interface SemaphoreViewController (){
    dispatch_semaphore_t semaphore;
}

@end

@implementation SemaphoreViewController
- (BOOL)navigationShouldPop
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:0];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 200, 100, 200);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    float content = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO);
    NSLog(@"=======%f",content);
}
- (void)ceShi
{
    dispatch_queue_t  queue = dispatch_queue_create("wbb", NULL);
    
    dispatch_async(queue, ^{
        NSLog(@"123123123");
        dispatch_semaphore_signal(semaphore);
    });
}
- (void)click
{
    NSLog(@"11111");
    // 创建信号量
    semaphore = dispatch_semaphore_create(0);
    [self ceShi];
    
     dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"22222");
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
