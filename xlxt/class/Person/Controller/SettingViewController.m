//
//  SettingViewController.m
//  xlxt
//
//  Created by xlky on 2017/7/12.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "SettingViewController.h"
#import "PCCell.h"
#import "testViewController.h"
@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *SettingArr;
}
@property (nonatomic,strong)UITableView *SetableView;

@end

@implementation SettingViewController
-(UITableView *)SetableView
{
    if (!_SetableView) {
        _SetableView = [[UITableView alloc]initWithFrame: [UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _SetableView.delegate = self;
        _SetableView.dataSource = self;
        _SetableView.separatorStyle = NO;
        _SetableView.backgroundColor = WhiteColor;
        [self.view addSubview:_SetableView];
    }
    return _SetableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.SetableView registerClass:[PCCell class] forCellReuseIdentifier:@"cell"];
    
    SettingArr = @[@{@"title":@"修改密码",@"icon":@"我的课程"},@{@"title":@"个人信息编辑",@"icon":@"我的订单"},@{@"title":@"微信账号",@"icon":@"考试中心"},@{@"title":@"解除绑定企业",@"icon":@"账户中心"},@{@"title":@"关于杏林",@"icon":@"问答中心"}];
    
    [self SetableView];
    

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SettingArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PCCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   cell1.dic = SettingArr[indexPath.section];
     return cell1;

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    testViewController *tvc = [testViewController new];
    [self.navigationController pushViewController:tvc animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
 UIView *view = [[UIView alloc] init];
    view.backgroundColor = COLORAHex(@"#f7f8fc");
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
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
