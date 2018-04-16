//
//  testViewController.m
//  xlxt
//
//  Created by xlky on 2017/7/20.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "testViewController.h"
#import "PCCell.h"
#import "PlayCataCell.h"
#import "INheaderView.h"
#define MyNib(x) [UINib nibWithNibName:x bundle:nil]
@interface testViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *SettingArr;
    NSDictionary* cataDic;
    int sectioncount;
    
}
@property (nonatomic,strong)UITableView *TetableView;


@end

@implementation testViewController
-(UITableView *)TetableView
{
    if (!_TetableView) {
        _TetableView = [[UITableView alloc]initWithFrame: [UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
        _TetableView.delegate = self;
        _TetableView.dataSource = self;
        _TetableView.separatorStyle = NO;
        _TetableView.backgroundColor = GrayColor;
        
       
    }
    return _TetableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [self.TetableView registerNib:MyNib(@"PlayCataCell") forCellReuseIdentifier:@"cellx"];
//    NSString *turl = WURL(@"/Course/GetChapterCoursewareShow?courseID=1");
//    [BaseWebUtils Get:turl andParams:nil andCallback:^(id obj) {
//        
//    cataDic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];
//        
//        SettingArr = cataDic[@"list"];
//      //  NSLog(@"输出字典：%@",cataDic);
//        [self.TetableView reloadData];
//    }];
     [self.view addSubview:self.TetableView];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    sectioncount = [cataDic[@"chapterCount"] intValue];
    return sectioncount;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = SettingArr[section];
    int i = [dic[@"coursewareCount"] intValue];
    return i;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlayCataCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cellx" forIndexPath:indexPath];
    NSDictionary *dic = SettingArr[indexPath.section];
    NSArray *arr =dic[@"courseware"];
    NSDictionary *dic2 = arr[indexPath.row];
    
    cell1.CourseTitle.text = [NSString stringWithFormat:@"课件%ld    %@",indexPath.row+1,dic2[@"Name"]];
    return cell1;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString * identy = @"head";
    INheaderView * hf = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identy];
    UILabel *titlelb;
    if (!hf) {
        
        hf = [[INheaderView alloc]initWithReuseIdentifier:identy];
        
        
        UIView *forview = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 5, 20)];
        forview.backgroundColor = [UIColor greenColor];
        
        [hf addSubview:forview];
        
        titlelb = [[UILabel alloc]initWithFrame:CGRectMake(25, 10, 100, 20)];
        [hf addSubview:titlelb];
        
    }

    titlelb.text = [NSString stringWithFormat:@"章节%ld",section];
    
        return hf;
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
