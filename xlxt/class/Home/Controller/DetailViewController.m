//
//  DetailViewController.m
//  xlxt
//
//  Created by xlky on 2018/4/24.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "CommentCellTableViewCell.h"
#import "DetailHeaderView.h"
#import "DetailCell.h"
#import "INheaderView.h"
#import "ImTxLabel.h"
#import "catalogCell.h"
#import "DetailInfoModel.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource,DetaiIndexDelegate>
{
    NSInteger detailIndex;
    NSInteger headerheight;
    NSInteger CourseID;
    ImTxLabel *imlb;
    NSArray *CataArr;
    DetailInfoModel *Infomodel;
    
    
}
@property (nonatomic,strong)UITableView *StableView;
@property (nonatomic,strong)DetailHeaderView *tbh;
@property (nonatomic,strong)UIButton *PurchaseBtn;
@property (nonatomic,strong)UIButton *WatchTestBtn;
@end

@implementation DetailViewController
-(instancetype)initWithID:(NSInteger)courseID
{
    self = [super init];
    if (self) {
        CourseID = courseID;
        self.navigationItem.title = @"详情页";
        self.view.backgroundColor = WhiteColor;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.StableView];
    [self PurchaseBtn];
    [self WatchTestBtn];
    [self.StableView registerClass:[DetailCell class] forCellReuseIdentifier:@"cell0"];
    [self.StableView registerNib:[UINib nibWithNibName:@"catalogCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell1"];
    [self.StableView registerClass:[CommentCellTableViewCell class] forCellReuseIdentifier:@"cell2"];
}
-(UIButton *)PurchaseBtn
{
    if (!_PurchaseBtn) {
        _PurchaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _PurchaseBtn.frame = CGRectMake(0, kScreenH-40, kScreenW/2-2, 40);
        _PurchaseBtn.backgroundColor = COLOR(255, 90, 0);
        _PurchaseBtn.tag = 0;
        [_PurchaseBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        [_PurchaseBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [_PurchaseBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_PurchaseBtn];
        
    }
    return _PurchaseBtn;
}

-(UIButton *)WatchTestBtn
{
    if (!_WatchTestBtn) {
        _WatchTestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _WatchTestBtn.frame = CGRectMake(kScreenW/2+2, kScreenH-40, kScreenW/2-2, 40);
        _WatchTestBtn.backgroundColor = navigationbar;
        _WatchTestBtn.tag = 1;
        [_WatchTestBtn setTitle:@"试看一分钟" forState:UIControlStateNormal];
        [_WatchTestBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
        [_WatchTestBtn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_WatchTestBtn];
    }
    return _WatchTestBtn;
}

-(DetailHeaderView *)tbh
{
    if (!_tbh) {
        _tbh = [[DetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH/2)];
        _tbh.delegate = self;
        headerheight = 70;
    }
    return _tbh;
}
-(UITableView *)StableView
{
    if (!_StableView) {
        _StableView = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, kScreenW, kScreenH-40) style:UITableViewStylePlain];
        _StableView.delegate = self;
        _StableView.dataSource = self;
        _StableView.separatorStyle = NO;
        _StableView.backgroundColor = WhiteColor;
        _StableView.tableHeaderView = self.tbh;
        _StableView.tableFooterView.backgroundColor = GrayColor;
        _StableView.sectionFooterHeight = 10;


        
        [self.view addSubview:_StableView];
    }
    return _StableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (detailIndex ==0) {
        
        DetailCell*cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0" forIndexPath:indexPath];
        return cell0;
    }
    if (detailIndex ==1) {
        catalogCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        return cell1;
  
    }
    CommentCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
          return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (detailIndex) {
        case 0:
            return 50;
            break;
        case 1:
            return 30;
            break;
            
        default:
            return 100;
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return headerheight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString * identy = @"head";
    INheaderView * hf = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identy];
  //  UILabel *titlelb;
    
    if (!hf) {
        hf = [[INheaderView alloc]initWithReuseIdentifier:identy];
        imlb = [[ImTxLabel alloc]initWithFrame:CGRectMake(10, 10, kScreenW-20, 20)];
        [hf addSubview:imlb];
        
    }
    return hf;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
-(void)changeValue:(NSInteger)tag
{
    detailIndex = tag;
    
    if (tag == 0) {
        [imlb SetText:@"新商品进入门店后如何提高新品的动销率法等方面的两方面的老师傅麦当劳是父母的老师发的快乐十分第三方第三方第三方；第三方；的老师粪坑里；第三方肯定是第三方第三方第三方第三方的双丰收范德萨范德萨范德萨范德萨范德萨范德萨发的；分肯定是；发了；都快疯了；v;cxmv,;cxmvldsfk;lvdls;k分开打开发了的看法；大连市反馈；代理商" SetImage:nil];
    }else if (tag == 1){
        [imlb SetImage:@"grennf" setText:[NSString stringWithFormat:@"章节%d",1]];
    }else{
        [imlb SetText:[NSString stringWithFormat:@"当前有%d条评论",1] SetImage:nil];
    }
    
    headerheight = CGRectGetMaxY(imlb.frame);
    [self.StableView reloadData];
}
-(void)pushAction:(UIButton*)btn
{
    if (btn.tag == 0) {
        
    }else{
        
    }
}
-(void)loadWebData
{
    //获取课程简介和详情信息
   NSString *courseinfo = [NSString stringWithFormat:@"/Course/GetCourseByIDShow?courseID=%ld",CourseID];
    [BaseWebUtils Get:WWWURL(courseinfo) andParams:nil andCallback:^(id obj) {
        Infomodel = [DetailInfoModel modelWithDictionary:JsonObj(obj)];
    }];
    
    //获取课程目录信息
    NSString *cataloginfo = [NSString stringWithFormat:@"/Course/GetCourseByIDShow?courseID=%ld",CourseID];
    [BaseWebUtils Get:WWWURL(cataloginfo) andParams:nil andCallback:^(id obj) {
        CataArr = JsonObj(obj)[@"list"];
    }];
 //   https://www.xlxt.net/Course/CheckCourseStae?courseID=356
    //获取课程目录信息
    NSString *ifpurchase = [NSString stringWithFormat:@"/Course/CheckCourseStae?courseID=%ld",CourseID];
    [BaseWebUtils Get:WWWURL(ifpurchase) andParams:nil andCallback:^(id obj) {
      //   JsonObj(obj)[@"Msg"];
    }];
    
}
@end
