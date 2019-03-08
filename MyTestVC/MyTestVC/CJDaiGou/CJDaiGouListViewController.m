//
//  CJDaiGouListViewController.m
//  MyTestVC
//
//  Created by 杨飞 on 17/1/20.
//  Copyright © 2017年 wbb. All rights reserved.
//

#import "CJDaiGouListViewController.h"

@interface CJDaiGouListViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *dataSource;
}
@property (weak, nonatomic) IBOutlet UITableView *table_view;

@end

@implementation CJDaiGouListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIButton *btn = [UIButton buttonWithType:0];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(touchUpBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    dataSource = @[@"0",@"1",@"2",@"3",@"4"];
    _table_view.userInteractionEnabled = YES;
}
- (void)touchUpBtn {
    NSLog(@"=======");
    [self.navigationController pushViewController:[[UIViewController alloc] init] animated:YES];
}
#pragma mark listViewdataSource method and delegate method
- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
    return 5;//dateListArray.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid=@"listviewid";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:cellid];
        cell.textLabel.text = dataSource[indexPath.row];
    }

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;//_name_btn.frame.size.height;
}
//当选择下拉列表中的一行时，设置文本框中的值，隐藏下拉列表
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
