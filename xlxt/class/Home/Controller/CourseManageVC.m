//
//  CourseManageVC.m
//  xlxt
//
//  Created by xlky on 2017/4/7.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//
#import "CourseManageVC.h"
#import "CMCell.h"
#import "CourseHeadView.h"
#import "FooterView.h"
#import "ListViewController.h"
#import "CourseMenageCell.h"
#import "AudioPlayerVC.h"

@interface CourseManageVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray *Bouti;
    NSArray *skillarr;
    NSArray *HeadArray;
    
    NSArray *dataArr;
}
@property (nonatomic, strong)UICollectionView *CMcollectionView;
@property (nonatomic,strong)UIImageView *bannerIV;

@end

@implementation CourseManageVC
// lazy load
-(UIImageView *)bannerIV
{
    if (!_bannerIV) {
        _bannerIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CMbanner.jpg"]];
        _bannerIV.frame = CGRectMake(0, 0, kScreenW, kScreenH/7);
        [self.CMcollectionView addSubview:_bannerIV];
    }
    return _bannerIV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = MainFrame;
    self.navigationItem.title = @"课程管理";
    UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
    self.CMcollectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:fl];
   //  ViewBorder(self.CMcollectionView, 10, WhiteColor);
    self.view.backgroundColor = WhiteColor;
    self.CMcollectionView.backgroundColor = WhiteColor;
    self.CMcollectionView.delegate = self;
    self.CMcollectionView.dataSource = self;
   
    [self.view addSubview:self.CMcollectionView];
    
//    [self.CMcollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.right.mas_equalTo(self.view);
//    }];
    
    [self bannerIV];
    //注册cell
    [self.CMcollectionView registerNib:[UINib nibWithNibName:@"CMCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CoCell"];
    [self.CMcollectionView registerNib:[UINib nibWithNibName:@"imageViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"IMCell"];
    [self.CMcollectionView registerClass:[CourseMenageCell class] forCellWithReuseIdentifier:@"CourseMenageCell"];

    //注册组头
    [self.CMcollectionView registerClass:[CourseHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CheaderView"];
    //注册组尾
    [self.CMcollectionView registerClass:[FooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CfooterView"];
    
    dataArr = [[NSArray alloc] initWithContentsOfFile:plistload(@"CourseManage")];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return dataArr.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSArray *arr = dataArr[section][@"group"];
    return arr.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    CourseMenageCell *Ccell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CourseMenageCell" forIndexPath:indexPath];
     Ccell.index = indexPath.row;
     Ccell.CDataDic = dataArr[indexPath.section][@"group"][indexPath.row];
    return Ccell;
    
}

//控制显示大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.section == 0) {
//        return CGSizeMake(kScreenW, kScreenH/13-13);
//    }
    return CGSizeMake(kScreenW/2-10.5, kScreenH/14);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 10, 0, 10);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(0, kScreenH/18);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    

    CourseHeadView *view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {

        
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CheaderView" forIndexPath:indexPath];
        view.Ctitle.text = dataArr[indexPath.section][@"header"];
        view.backgroundColor = COLOR(245, 248, 251);
        view.Cmore.tag = indexPath.section;

        if (indexPath.section == 3 ) {
            view.Cmore.hidden = NO;
        }else{
            view.Cmore.hidden = YES;
           
        }
   
        view.block = ^(NSInteger tag1){
            navipush([AudioPlayerVC new]);
        };
    
        return view;
    }else{

return nil;
    }
    
    return nil;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    navipush([[ListViewController alloc]initWithId:[dataArr[indexPath.section][@"group"][indexPath.row][@"id"] integerValue]]);
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
