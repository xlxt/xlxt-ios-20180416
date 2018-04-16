//
//  EnterViewController.m
//  xlxt
//
//  Created by xlky on 2018/3/21.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "EnterViewController.h"
#import "FitHeightLabel.h"
#import "ImTxLabel.h"
#import "EnterHeaderView.h"
#import "EnterChildView.h"
@interface EnterViewController ()
{
    FitHeightLabel *fl;
    int x;
    float headerheight;
    NSArray *dataarray;
}
@property (nonatomic,strong)EnterHeaderView *enterhv;
@property (nonatomic,strong)UIScrollView *myScrollView;
@property (nonatomic,strong)UIView *childview;
@end



@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"企业大学";
    self.view.backgroundColor = COLORAHex(@"#f7f8fC");

    //网络请求
    [self WebDataRequest];
    dataarray = @[@"企业课程",@"内部课程",@"企业试题",@"学习任务",@"企业文库",@"企业公告",@"学习地图",@"比赛中心",@"企业商城",@"杏林说",@"员工带教",@"更多",];


    //初始化滚动视图
    [self myScrollView];
    
    //添加头视图;
    [self.myScrollView addSubview:self.enterhv];
    
   // 添加子视图
    [self.myScrollView addSubview:self.childview];
    
    // 计算滚动式图的高度
    self.myScrollView.contentSize = CGSizeMake(kScreenW, CGRectGetHeight(self.enterhv.frame)+CGRectGetHeight(self.childview.frame)+20);
    
    //添加滚动视图
    [self.view addSubview:self.myScrollView];
    
    
}
//lazy load

-(EnterHeaderView *)enterhv
{
    if (!_enterhv) {
        _enterhv = [[EnterHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 10)];
    }
    return _enterhv;
}
-(UIScrollView *)myScrollView
{
    if (!_myScrollView) {
        _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64)];
        
        _myScrollView.directionalLockEnabled = YES; //只能一个方向滑动
        
        _myScrollView.showsVerticalScrollIndicator =YES; //垂直方向的滚动指示
        
        //    myScrollView.scrollIndicatorInsets =
        
        _myScrollView.pagingEnabled = NO; //是否翻页
        
        _myScrollView.scrollEnabled = YES;//控制控件是否能滚动
        
        _myScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;//滚动指示的风格
        
        _myScrollView.showsHorizontalScrollIndicator = NO;//水平方向的滚动指示
        
        
        _myScrollView.bounces = YES;//控制控件遇到边框是否反弹
        
        _myScrollView.alwaysBounceVertical = NO;//控制垂直方向遇到边框是否反弹
        
        _myScrollView.alwaysBounceHorizontal = NO;//控制水平遇到边框是否反弹
        
    }
    return _myScrollView;
}

-(UIView *)childview{
    if (!_childview) {
        float w = kScreenW/4;
        float h = 93;
        int i = 0;
        _childview = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.enterhv.frame), kScreenW, (dataarray.count/4+1)*h)];
        _childview.backgroundColor = ClearColor;
        
        for (NSString *childtitle in dataarray) {
            EnterChildView *ECV = [[EnterChildView alloc]initWithFrame:CGRectMake(i%4*w, i/4*h, w, h)];
            ECV.titlelabel.text = childtitle;
            NSString *imnm = [NSString stringWithFormat:@"%@icon",childtitle];
            ECV.imageview.image = [UIImage imageNamed:imnm];
            [_childview addSubview:ECV];
            i++;
        }
    }
    return _childview;
}
-(void)WebDataRequest
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
