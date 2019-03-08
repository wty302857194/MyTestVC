//
//  SearchResultConductTableViewCell.m
//  CJHLogistics
//
//  Created by wbb on 2017/11/16.
//  Copyright © 2017年 cjh. All rights reserved.
//

#import "SearchResultConductTableViewCell.h"
#import "SearchResultModel.h"

@interface SearchResultConductTableViewCell ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *dataArr;
}
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation SearchResultConductTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
- (void)setDataSourceArr:(NSArray *)dataSourceArr {
    _dataSourceArr = dataSourceArr;
    
    for (GoodsListModel *model in dataSourceArr) {
        model.cellHeight = 44;
        model.isFlex =YES;
        [dataArr addObject:model];
    }
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.contentView addSubview:_tableView];
    }
    return _tableView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsListModel *model = self.dataSourceArr[indexPath.section];

    return model.cellHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GoodsTypeListModel *model = self.dataSourceArr[section];

    return model.goodsList.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.dataSourceArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    GoodsTypeListModel *model = self.dataSourceArr[indexPath.section];
    GoodsListModel *listMode = model.goodsList[indexPath.row];
    model.cellHeight = model.goodsList.count * listMode.cellHeight;
    cell.textLabel.text = listMode.goodsName;

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    GoodsTypeListModel *model = self.dataSourceArr[section];
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
//    lab.text = model.goodsTypeName;;
//    return lab;
//
//}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GoodsTypeListModel *model = self.dataSourceArr[section];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor = [UIColor redColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = view.bounds;
    [button addTarget:self action:@selector(doFlex:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = section + 100;
    [button setTitle:model.goodsTypeName forState:UIControlStateNormal];
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
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
