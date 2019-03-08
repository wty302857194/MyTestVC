//
//  QQQiPaoViewController.m
//  MyTestVC
//
//  Created by 杨飞 on 17/1/23.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "QQQiPaoViewController.h"
#import "DGSlimeView.h"
@interface QQQiPaoViewController ()

@end

@implementation QQQiPaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    __block DGSlimeView *slimeView = [[DGSlimeView alloc] initWithFrame: CGRectMake(100, 100, 30, 30)];
//    __block float a = 0;
    
    [slimeView initWithSupperView:self.view withTuoZhuaiBlock:^{
        NSLog(@"拖拽成功");
//        slimeView.num_label.text = [NSString stringWithFormat:@"%ld",(long)++a];
    }];
    slimeView.num_label.text = [NSString stringWithFormat:@"%ld",(long)99];
    [self.view addSubview: slimeView];
    [self.view sendSubviewToBack:slimeView];
    
    
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(200, 200, 100, 40)];
    tf.backgroundColor = [UIColor redColor];
    [tf addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:tf];
    
}
- (void)valueChange:(UITextField *)sender {
    NSString *subString = sender.text;
    NSString *lang = sender.textInputMode.primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *range = [sender markedTextRange];
        if (!range&&subString.length>5) {
            sender.text = [subString substringToIndex:5];
        }
    }else if(subString.length>5) {
        sender.text = [subString substringToIndex:5];
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
