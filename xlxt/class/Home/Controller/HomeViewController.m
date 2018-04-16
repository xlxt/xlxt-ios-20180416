//
//  HomeViewController.m
//  xlxt
//
//  Created by xlky on 2018/3/21.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "HomeViewController.h"
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
@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate,ServiceLayoutDelegate>
{
    UIBarButtonItem *MassageItem;
    ServiceLayout * _flow;
    SearchView *SV;
    UIView *NaviView;
    
    
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) HomeHeaderView *HeaderView;
@property (nonatomic, strong) UIImageView *navBarHairlineImageView;
@end

@implementation HomeViewController
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
-(void)viewWillAppear:(BOOL)animated
{
    _navBarHairlineImageView.hidden = YES;
}
//在页面消失的时候就让出现
-(void)viewWillDisappear:(BOOL)animated
{
    _navBarHairlineImageView.hidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    //设置导航栏
    [self SetupItem];
    
    //设置子视图
    [self SetupView];
    
    //设置网络，加载数据
    [self SetupWebConnection];
    
}
//懒加载
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        _flow = [[ServiceLayout alloc] init];
        _flow.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -64, kScreenW, kScreenH+64) collectionViewLayout:_flow];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
-(HomeHeaderView *)HeaderView
{
    if (!_HeaderView) {
        _HeaderView = [[HomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH/2)];
    }
    return _HeaderView;
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

-(void)searchaction:(UIBarButtonItem*)btn
{
    NSLog(@"点击右键");
}
-(void)SetupView{

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
    NaviView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:NaviView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 7;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   // return section == 0 ? 6 : 3;

    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 4;
            break;
        case 4:
            return 3;
            break;
        case 5:
            return 3;
            break;
        default:
            return 6;
            break;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:{
                CourseCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CourseCell" forIndexPath:indexPath];
                return cell;
        }
            break;
        case 1:
             {
    
                if (indexPath.item == 1) {
                      ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
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
            //添加阴影
            [cell AddShadowWithview:cell color:navigationbar shadowOffset:CGSizeMake(0,0) shadowRadius:6.0f shadowOpacity:0.35f];
            return cell;
        }
            break;
        case 3:
        {
            if (indexPath.item == 3) {
                ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
                return cell;
            }else{
                AudioViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AudioViewCell" forIndexPath:indexPath];
                return cell;
            }
        }
            break;
            
        case 4:
            if (indexPath.item == 0) {
                ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
                return cell;
            } else {
                CourseCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CourseCell" forIndexPath:indexPath];
                return cell;
            }
            
            break;
            
        case 5:
        {
            ArvertisementCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ArverCell" forIndexPath:indexPath];
            return cell;
        }
            break;
        default:
        {
            CourseCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CourseCell" forIndexPath:indexPath];
            return cell;
        }
            break;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderReusableView *headerView;
    if (kind == UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 0) {
            headerView = [collectionView  dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HomeTopHeadView" forIndexPath:indexPath];
        }else{
            headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ServiceHeaderReusableView" forIndexPath:indexPath];
            headerView.imgView.image = [UIImage imageNamed:@"ser_b1"];
        }
        
        return headerView;
    } else {
        FooterReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ServiceFooterReusableView" forIndexPath:indexPath];
        return footerView;
    }
}
-(NSInteger)waterFlowLayout:(ServiceLayout *)waterFlowLayout CountForItemAtHoriziontalIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 4;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 3;
            break;
        case 4:
            return 3;
            break;

        default:
            return 6;
            break;
    }
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
    switch (indexPath.section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 2;
            break;
            
        default:
            return 2;
            break;
    }
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
            
        default:
             return UIEdgeInsetsMake(17, 12, 17, 12);
            break;
    }
   
}
-(UIEdgeInsets)WaterFlowLayout:(ServiceLayout *)waterFlowLayout FoPaddingAtIndexPath:(NSIndexPath *)indexPath
{
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

-(void)SetupWebConnection{
    
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
