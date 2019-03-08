//
//  SearchResultConductViewController.m
//  CJHLogistics
//
//  Created by wbb on 2017/11/16.
//  Copyright © 2017年 cjh. All rights reserved.
//

#import "SearchResultConductViewController.h"
#import "SearchResultConductTableViewCell.h"
#import "SearchResultModel.h"

@interface SearchResultConductViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isFlex;//展开合并
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation SearchResultConductViewController

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"home.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

        NSArray *arr = dic[@"data"][@"phoneList"];
        for (NSDictionary *dic in arr) {
            SearchResultModel *resultModel = [SearchResultModel objectWithKeyValues:dic];
            [_dataArr addObject:resultModel];
        }
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSLog(@"self.dataArr === %@",self.dataArr);
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsTypeListModel *model = self.dataArr[indexPath.section];
    
    return model.cellHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    SearchResultConductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SearchResultConductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    SearchResultModel *resultModel = self.dataArr[indexPath.section];
//    GoodsTypeListModel *listModel = resultModel.goodsTypeList[indexPath.row];
//    resultModel.cellHeight = resultModel.goodsTypeList.;
//    resultModel.isFlex = YES;
    cell.dataSourceArr = resultModel.goodsTypeList;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SearchResultModel *searchResultModel = self.dataArr[section];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor redColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = view.bounds;
    [button addTarget:self action:@selector(doFlex:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = section + 100;
    [button setTitle:searchResultModel.phone forState:UIControlStateNormal];
    [view addSubview:button];
    return view;
}
- (void)doFlex:(UIButton *)btn  {
    
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
