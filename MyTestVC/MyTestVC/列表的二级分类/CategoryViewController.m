//
//  CategoryViewController.m
//  MyTestVC
//
//  Created by wbb on 2017/10/13.
//  Copyright © 2017年 wbb. All rights reserved.
//


#import "CategoryViewController.h"

@interface CategaryModel : NSObject

@end

@implementation  CategaryModel

@end

@interface CategoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSDictionary *dataDic;

@end

@implementation CategoryViewController
- (NSDictionary *)dataDic {
    if (!_dataDic) {
        _dataDic = @{@"1":@[@"1",@"2",@"3",@"4"],
                     @"2":@[@"1",@"2",@"3"],
                     @"3":@[],
                     @"4":@[@"1",@"2"],
                     @"5":@[],
                     @"6":@[@"1",@"2",@"3",@"4"]};
    }
    return _dataDic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor redColor];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = self.dataDic[self.dataDic.allKeys[section]];
    return arr.count;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    
    return self.dataDic.allKeys.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
