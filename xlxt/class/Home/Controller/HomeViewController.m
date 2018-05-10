//
//  HomeViewController.m
//  xlxt
//
//  Created by xlky on 2018/3/21.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "HomeViewController.h"
#import "AudioPlayerVC.h"
#import "DetailViewController.h"
#import "ListViewController.h"
#import "CircleImageView.h"
#import "YYLabel+ImageText.h"
#import "SearchView.h"
#import "ServiceLayout.h"
#import "HeaderReusableView.h"
#import "FooterReusableView.h"
#import "HomeHeaderView.h"
#import "CourseCoCell.h"
#import "ArvertisementCell.h"
#import "LiveViewCell.h"
#import "VoteViewCell.h"
#import "AudioViewCell.h"
#import "UIView+AddShadow.h"
#import "bannerModel.h"

#import "CourseManageVC.h"
#import "KnowLedgeVC.h"
#import "ChronicManagerVC.h"
#import "CourseModel.h"
#import "AudioModel.h"
#import "VoteModel.h"
#import "advertmodel.h"
@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate,ServiceLayoutDelegate,homeDelegate,homeheadDelegate>
{
    UIBarButtonItem *MassageItem;
    ServiceLayout * _flow;
    HomeHeaderView *headerView;
    NSMutableArray *recommendarr;
    NSMutableArray *deseasedarr;
    NSMutableArray *audioarr;
    NSMutableArray *hotarr;
    NSMutableArray *bannerarr1;
    NSMutableArray *bannerarr2;
    NSMutableArray *votearr;
    NSMutableArray *articlearr;
    SearchView *SV;    
    UIView *NaviView;
    NSArray * _dataSourseArray;
    
    
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *navBarHairlineImageView;
@end

@implementation HomeViewController


//主界面
- (void)viewDidLoad {
    [super viewDidLoad];

    
    //设置导航栏
    [self SetupItem];
    
    //设置子视图
    [self SetupView];
    
    //设置网络，加载数据
   [self SetupWebConnection];
    
}

-(void)viewWillAppear:(BOOL)animated
{
     [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    _navBarHairlineImageView.hidden = YES;
    SV.hidden = NO;
    self.navigationController.navigationBar.barTintColor = ClearColor;
    NaviView.hidden = NO;
}
//在页面消失的时候就让出现
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    _navBarHairlineImageView.hidden = NO;
    SV.hidden = YES;
    self.navigationController.navigationBar.barTintColor = navigationbar;
    NaviView.hidden = YES;
}

//通过一个方法来找到这个黑线(findHairlineImageViewUnder):
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

//懒加载
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        _dataSourseArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HomeData" ofType:@"plist"]];
        _flow = [[ServiceLayout alloc] init];
        _flow.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -64, kScreenW, kScreenH+64) collectionViewLayout:_flow];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        MJRefreshNormalHeader *header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
        header.lastUpdatedTimeLabel.hidden=YES;
        _collectionView.mj_header=header;
        
        MJRefreshAutoNormalFooter *footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
        _collectionView.mj_footer = footer;
        _collectionView.mj_footer.hidden=YES;
        
    }
    return _collectionView;
}

-(void)SetupItem{
    
    //去除导航栏黑线
     _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
    
    SV = [[SearchView alloc]initWithFrame:CGRectMake(13, 7, kScreenW*2.5/3, 28)];
    SV.text = @"    课程搜索";
    [self.navigationController.navigationBar addSubview:SV];

   
    MassageItem= [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Message"] style:UIBarButtonItemStyleDone target:self action:@selector(searchaction:)];
    self.navigationItem.rightBarButtonItem = MassageItem;
}

-(void)loadNew
{
    [self.collectionView.mj_header endRefreshing];
}
-(void)loadMore
{
     [self.collectionView.mj_header endRefreshing];
}

-(void)SetupView{
     self.view.backgroundColor = WhiteColor;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = WhiteColor;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[CourseCoCell class] forCellWithReuseIdentifier:@"CourseCell"];
    [self.collectionView registerClass:[ArvertisementCell class] forCellWithReuseIdentifier:@"ArverCell"];
    [self.collectionView registerClass:[LiveViewCell class] forCellWithReuseIdentifier:@"LiveViewCell"];
    [self.collectionView registerClass:[VoteViewCell class] forCellWithReuseIdentifier:@"VoteViewCell"];
     [self.collectionView registerClass:[AudioViewCell class] forCellWithReuseIdentifier:@"AudioViewCell"];
    
    [self.collectionView registerClass:[HomeHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeTopHeadView"];
    [self.collectionView registerClass:[HeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ServiceHeaderReusableView"];
    [self.collectionView registerClass:[FooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ServiceFooterReusableView"];
    NaviView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 64)];
    NaviView.backgroundColor = ClearColor;
    [self.view addSubview:NaviView];
    
 
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataSourseArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   // return section == 0 ? 6 : 3;

 return [_dataSourseArray[section][@"listcount"] integerValue];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:{
                CourseCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CourseCell" forIndexPath:indexPath];
                 cell.datas =recommendarr[indexPath.row];
            
                return cell;
        }
            break;
        case 1:
             {
                if (indexPath.item == 1) {
                      ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
                    bannerModel *bm =bannerarr1[0];
                    [cell.imageview setImageURL:[NSURL URLWithString:ImgUrl(bm.ImgUrl)]];
                      return cell;
                }else{
                     LiveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LiveViewCell" forIndexPath:indexPath];
                      return cell;
                }
            }
            break;
        case 2:
        {
            VoteViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VoteViewCell" forIndexPath:indexPath];
            cell.VModel =votearr[0];
            //添加阴影
            [cell AddShadowWithview:cell color:navigationbar shadowOffset:CGSizeMake(0,0) shadowRadius:6.0f shadowOpacity:0.35f];
            return cell;
        }
            break;
        case 3:
        {
            if (indexPath.item == 3) {
                ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
              [cell.imageview setImage:[UIImage imageNamed:@"adv4"]];
                return cell;
            }else{
                AudioViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AudioViewCell" forIndexPath:indexPath];
                cell.aumodel = audioarr[indexPath.item];
                return cell;
            }
        }
            break;
            
        case 4:
            if (indexPath.item == 0) {
                ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
                bannerModel *bm =bannerarr2[0];
                [cell.imageview setImageURL:[NSURL URLWithString:ImgUrl(bm.ImgUrl)]];
                return cell;
            } else {
                CourseCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CourseCell" forIndexPath:indexPath];
                cell.datas = hotarr[indexPath.item-1];
                return cell;
            }
            break;
            
        case 5:
        {
            ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
            [cell.imageview setImage:[UIImage imageNamed:[NSString stringWithFormat:@"adv%ld",(long)indexPath.item+1]]];
            return cell;
        }
            break;
        default:
        {
            CourseCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CourseCell" forIndexPath:indexPath];
            cell.datas = deseasedarr[indexPath.row];
            return cell;
        }
            break;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 0) {
            headerView = [collectionView  dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HomeTopHeadView" forIndexPath:indexPath];
            headerView.delegate = self;
            return headerView;
            
        }else{
            HeaderReusableView *headerView= [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ServiceHeaderReusableView" forIndexPath:indexPath];
            
            [headerView.titleLabel setText:_dataSourseArray[indexPath.section][@"title"]];
            headerView.imgView.image = [UIImage imageNamed:@"ser_b1"];
            headerView.delegate = self;
            return headerView;
        }
        
        
    } else {
        FooterReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ServiceFooterReusableView" forIndexPath:indexPath];
        return footerView;
    }
}
-(NSInteger)waterFlowLayout:(ServiceLayout *)waterFlowLayout CountForItemAtHoriziontalIndexPath:(NSIndexPath *)indexPath
{

    return [_dataSourseArray[indexPath.section][@"listcount"] integerValue];
}
/** 多列布局 单列布局 item高度 */
-(CGFloat)waterFlowLayout:(ServiceLayout *)waterFlowLayout HeightForItemAtHoriziontalIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 145;
            break;
        case 1:{
            if (indexPath.item == 0) {
               return 200;
            }
        }
            return 50;
            break;
        case 2:
            return 250;
            break;
        case 3:
            return 55;
            break;
        case 4:
            return 145;
            break;
        case 5:
            return 120;
            break;
            
        default:
            return 145;
            break;
    }
}
/** 列数*/
-(NSInteger)columnCountInWaterFlowLayout:(ServiceLayout *)waterFlowLayout columnCountForsectionndexPath:(NSIndexPath *)indexPath
{

     return [_dataSourseArray[indexPath.section][@"columnCount"] integerValue];
}
/** section 模式 */
-(FlowLayoutStyle)waterFlowLayout:(ServiceLayout *)waterFlowLayout ModeForItemAtHoriziontalIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
            waterFlowLayout.flowLayoutStyle = HorizontalWaterFlow;
            break;
        case 1:
            waterFlowLayout.flowLayoutStyle = SingleWaterFlow;
            break;
        case 2:
            waterFlowLayout.flowLayoutStyle = SingleWaterFlow;
            break;

        case 3:
             waterFlowLayout.flowLayoutStyle = ThreeWaterFlow;
            break;
        case 4:
             waterFlowLayout.flowLayoutStyle = SingleWaterFlow;
            break;
            
        default:
            waterFlowLayout.flowLayoutStyle = HorizontalWaterFlow;
            break;
    }

    return waterFlowLayout.flowLayoutStyle;
}

-(CGFloat)heightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath {
    return 0;
}
-(CGFloat)heightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.section == 0){
        return kScreenW*4.7/10+240;
    }
    return 30;
}
-(UIEdgeInsets)WaterFlowLayout:(ServiceLayout *)waterFlowLayout ForMarginAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0: case 1: case 6:
            return UIEdgeInsetsMake(17, 12, 18, 12);
            break;
            case 5:
            return UIEdgeInsetsMake(10, 12, 10, 12);
            break;
        default:
             return UIEdgeInsetsMake(17, 12, 17, 12);
            break;
    }
   
}
-(UIEdgeInsets)WaterFlowLayout:(ServiceLayout *)waterFlowLayout FoPaddingAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 5) {
        return UIEdgeInsetsMake(10, 10, 0, 0);
    }
     return UIEdgeInsetsMake(18, 18, 0, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  //  NSLog(@"offset---scroll:%f",self.collectionView.contentOffset.y);
    UIColor *color=navigationbar;
    CGFloat offset=scrollView.contentOffset.y;
    if (offset<0) {
   NaviView.backgroundColor = [color colorWithAlphaComponent:0];
        
  
        SV.backgroundColor = [UIColor whiteColor];
       
    }else {
        CGFloat alpha=1-((64-offset)/34);
      NaviView.backgroundColor=[color colorWithAlphaComponent:alpha];
 
         SV.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    }
}

//响应事件

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailcv = [DetailViewController new];
    [self.navigationController pushViewController:detailcv animated:YES];
}

-(void)searchaction:(UIBarButtonItem*)btn
{
    NSLog(@"点击右键");
}

-(void)SetupWebConnection{
    
    //轮播图
    [BaseWebUtils Get:WWWURL(@"/AD/GetAD?positionCode=APP_INDEX_BANNER_1") andParams:nil andCallback:^(id obj) {
        NSMutableArray *bannerarr = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)) {
            bannerModel* bmx = [bannerModel modelWithDictionary:bm];
            [bannerarr addObject:bmx];
        }
        
        headerView.BannerArray =bannerarr;
        [self.collectionView reloadData];
        
    }];
        //滚动广告位
    [BaseWebUtils Get:WWWURL(@"/Article/GetArticleShow?keyword=&ClassifyID=0&Pageindex=1&Pagesize=8") andParams:nil andCallback:^(id obj) {
    
    }];
    //广告位1
    [BaseWebUtils Get:WWWURL(@"/AD/GetAD?positionCode=App_First_Ad1") andParams:nil andCallback:^(id obj) {
        bannerarr1 = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)) {
            bannerModel* bmx = [bannerModel modelWithDictionary:bm];
            [bannerarr1 addObject:bmx];
        }
        [self.collectionView reloadData];
    }];
    //广告位2
    [BaseWebUtils Get:WWWURL(@"/AD/GetAD?positionCode=App_First_Ad3") andParams:nil andCallback:^(id obj) {
        bannerarr2 = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)) {
            bannerModel* bmx = [bannerModel modelWithDictionary:bm];
            [bannerarr2 addObject:bmx];
        }
        [self.collectionView reloadData];
    }];
//
    //推荐课程
    [BaseWebUtils Get:WWWURL(@"/Course/GetCoursesByTag?courseTagID=4&pageindex=1&pagesize=4") andParams:nil andCallback:^(id obj) {
        
        recommendarr = [NSMutableArray array];
        for (NSDictionary *comodel in JsonObj(obj)) {
            CourseModel* bmx = [CourseModel modelWithDictionary:comodel];
            [recommendarr addObject:bmx];
        }
       [self.collectionView reloadData];
    }];

    //热门课程
    [BaseWebUtils Get:WWWURL(@"/Course/GetCoursesByTag?courseTagID=5&pageindex=1&pagesize=2") andParams:nil andCallback:^(id obj) {
        hotarr = [NSMutableArray array];
        for (NSDictionary *hotmodel in JsonObj(obj)) {
            CourseModel* bmx = [CourseModel modelWithDictionary:hotmodel];
            [hotarr addObject:bmx];
        }
        [self.collectionView reloadData];
        
    }];
    //疾病用药
    [BaseWebUtils Get:WWWURL(@"/Course/GetCoursesByTag?courseTagID=6&pageindex=1&pagesize=6") andParams:nil andCallback:^(id obj) {
        deseasedarr = [NSMutableArray array];
        for (NSDictionary *comodel in JsonObj(obj)) {
            CourseModel* bmx = [CourseModel modelWithDictionary:comodel];
            [deseasedarr addObject:bmx];
        }
        [self.collectionView reloadData];
    }];
    //音频课程
    [BaseWebUtils Get:WWWURL(@"/Course/SeachCourseShow?cateID=47&pagesize=3&pageindex=1&keyword=") andParams:nil andCallback:^(id obj) {
        NSDictionary *dic =JsonObj(obj);
        audioarr = [NSMutableArray array];
        for (NSDictionary *audmodel in dic[@"data"]) {
            AudioModel* bmx = [AudioModel modelWithDictionary:audmodel];
            [audioarr addObject:bmx];
        }
        [self.collectionView reloadData];
    }];
    //投票活动
    NSString *urlStringUTF8 = [VoteUrl(@"/VoteView/GetVoteLit?tageName=杏林官方&keyword=&pagesize=1&pageindex=1") stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [BaseWebUtils Get:urlStringUTF8 andParams:nil andCallback:^(id obj) {
        votearr=[NSMutableArray array];
        for (NSDictionary *comodel in JsonObj(obj)) {
            VoteModel* bmx = [VoteModel modelWithDictionary:comodel];
            [votearr addObject:bmx];
        }
        [self.collectionView reloadData];
        
    }];
    //推荐位文章
    [BaseWebUtils Get:WWWURL(@"/Article/GetArticleShow?keyword=&ClassifyID=0&Pageindex=1&Pagesize=20") andParams:nil andCallback:^(id obj) {
        articlearr=[NSMutableArray array];
        for (NSDictionary *comodel in JsonObj(obj)[@"data"]) {
            advertmodel* bmx = [advertmodel modelWithDictionary:comodel];
            [articlearr addObject:bmx];
            
        }
         headerView.AdverArray =[articlearr copy];
        [self.collectionView reloadData];
        
    }];
    
}
-(void)freshdata
{
    
}

-(void)BannerClick:(NSInteger)tag
{
      NSLog(@"点击banner%ld",(long)tag);
}
- (void)ImageBtnClick:(NSInteger)tag
{
       NSLog(@"点击图片%ld",(long)tag);
    switch (tag) {
        case 0:
            
            break;
        case 1:
            navipush([CourseManageVC new]);
            break;
        case 2:
            
            break;
        case 3:
          
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            navipush([AudioPlayerVC new]);
            break;
        case 8:
            navipush([KnowLedgeVC new]);
            break;
        case 9:
           navipush([ChronicManagerVC new]); 
            break;
        case 10:
            
            break;
        case 11:
            
            break;

            
        default:
            break;
    }
    
    
}
-(void)AdverViewClick:(NSInteger)tag;
{
      NSLog(@"点击广告位%ld",(long)tag);
}
-(void)push:(NSInteger)tag
{
   //  NSLog(@"点击更多%ld",(long)tag);
    navipush([[ListViewController alloc]initWithId:1]);
    
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

#pragma mark - WSLWaterFlowLayoutDelegate

@end
