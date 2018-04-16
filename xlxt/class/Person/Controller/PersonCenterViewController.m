//
//  PersonCenterViewController.m
//  xlxt
//
//  Created by xlky on 2017/7/7.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
#import "PCView.h"
#import "PCCell.h"
@interface PersonCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *LineArr1;
    NSArray *LineArr2;
    NSArray *LineArr3;
    
}
@property (nonatomic,strong)UITableView *StableView;
@property (nonatomic,strong)NSMutableArray *Sarray;
@property (nonatomic,strong)PCView *tbh;
@property (nonatomic)UIBarButtonItem *SettingItem;


@end

@implementation PersonCenterViewController
//懒加载
-(UIBarButtonItem *)SettingItem{
    if (!_SettingItem) {
        _SettingItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStyleDone target:self action:@selector(SettingAction)];
        
    }
    return _SettingItem;
}
-(UITableView *)StableView
{
    if (!_StableView) {
        _StableView = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, kScreenW, kScreenH-110) style:UITableViewStylePlain];
        _StableView.delegate = self;
        _StableView.dataSource = self;
        _StableView.separatorStyle = NO;
        _StableView.backgroundColor = WhiteColor;
        
        [self.view addSubview:_StableView];
    }
    return _StableView;
}
-(NSMutableArray *)Sarray
{
    if (!_Sarray) {
        _Sarray = [NSMutableArray array];
    }
    return _Sarray;
}
-(PCView *)tbh
{
    if (!_tbh) {
        _tbh = [[PCView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 200)];
        
    }
    return _tbh;
}
-(void)SettingAction
{
    SettingViewController *sv= [SettingViewController new];
    [self.navigationController pushViewController:sv animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.SettingItem;
    self.navigationItem.title = @"个人中心";
    LineArr1 = @[@{@"title":@"消息中心",@"icon":@"消息中心"},@{@"title":@"我的课程",@"icon":@"我的课程"},@{@"title":@"考试中心",@"icon":@"考试中心"}];
    LineArr2 = @[@{@"title":@"我的订单",@"icon":@"我的订单"},@{@"title":@"账户中心",@"icon":@"账户中心"},@{@"title":@"问答中心",@"icon":@"问答中心"}];
    LineArr3 = @[@{@"title":@"退出当前账户",@"icon":@"退出当前账户"}];
    
    [self StableView];
    self.StableView.tableHeaderView = self.tbh;
    self.StableView.tableFooterView.backgroundColor = GrayColor;
    self.StableView.sectionFooterHeight = 10;
     [self.StableView registerClass:[PCCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {

        return LineArr1.count;
    }
    if (section == 1) {
        return LineArr2.count;
    }
        return LineArr3.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

       PCCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *dic;
    if (indexPath.section == 0) {
        
        dic = LineArr1[indexPath.row];
        
    }else if (indexPath.section == 1){
        
        dic = LineArr2[indexPath.row];
        
    }else{
        
        dic = LineArr3[indexPath.row];
        
    }

    cell1.dic = dic;
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
//    NSString *Purl;
    
//    if (indexPath.section == 0) {
//        Purl = MURL(@"/member/course_progress_list.html");
//    }else if (indexPath.section == 1){
//        switch (indexPath.row) {
//            case 0:
//               Purl = MURL(@"/member/order_all.html");
//                break;
//                
//            default:
//                Purl = MURL(@"/Exchange/accountcenter.html");
//                break;
//        }
//        
//    }else{
//        
//        switch (indexPath.row) {
//            case 0:
//                Purl = @"";
//                break;
//            case 1:
//                Purl = @"";
//                break;
//                
//            default:
//                Purl = @"";
//                break;
//        }
//        
//    }
    if (indexPath.section == 2) {
            LoginViewController *VC = [LoginViewController new];

            [self.navigationController pushViewController:VC animated:YES];
    }
//    
//    
//    ViewController *VC = [ViewController new];
//    
//    VC.urlstr = Purl;
//    
//    [self.navigationController pushViewController:VC animated:YES];

    
    
    
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
