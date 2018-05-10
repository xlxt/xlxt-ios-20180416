//
//  KnowLedgeVC.m
//  xlxt
//
//  Created by xlky on 2017/5/22.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "KnowLedgeVC.h"
#import "ArvertisementCell.h"
#import "DetailViewController.h"
#import "CourseCoCell.h"
#import "bannerModel.h"
#import "CourseModel.h"
@interface KnowLedgeVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *Ad1Array;
    NSMutableArray *Ad2Array;
    NSMutableArray *TagArray;
    NSMutableArray *ListArray;
    
}
@property (nonatomic, strong)UICollectionView *collectionView2;

@end

@implementation KnowLedgeVC
//lazy load
-(UICollectionView *)collectionView2
{
    if (!_collectionView2) {
        
        UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
    
        _collectionView2 = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds
                                                collectionViewLayout:fl];
        _collectionView2.backgroundColor = [UIColor whiteColor];
        _collectionView2.delegate = self;
        _collectionView2.dataSource = self;
        [self.view addSubview:_collectionView2];
    }
    return _collectionView2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"产品知识";
    //注册imagecell
    [self.collectionView2 registerClass:[ArvertisementCell class] forCellWithReuseIdentifier:@"Scell"];
    [self.collectionView2 registerClass:[CourseCoCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self collectionView2];
    [self loadProductWebData];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return Ad1Array.count;
            break;
        case 1:
            return TagArray.count;
            break;
        case 2:
            return Ad2Array.count;
            break;

        default:
            return ListArray.count;
            break;
    }
}
-(void)loadProductWebData
{
    
    
    [BaseWebUtils Get:WWWURL(@"/AD/GetAD?positionCode=APP_CPZS_BANNER_1") andParams:nil andCallback:^(id obj) {
        Ad1Array = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)) {
            bannerModel* bmx = [bannerModel modelWithDictionary:bm];
            [Ad1Array addObject:bmx];
        }

        [self.collectionView2 reloadData];
    }];
    
    [BaseWebUtils Get:WWWURL(@"/AD/GetAD?positionCode=APP_CPZS_BANNER_2") andParams:nil andCallback:^(id obj) {
        Ad2Array = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)) {
            bannerModel* bmx = [bannerModel modelWithDictionary:bm];
            [Ad2Array addObject:bmx];
        }
                [self.collectionView2 reloadData];
    }];
    
    
    [BaseWebUtils Get:WWWURL(@"/Course/GetCoursesByTag?courseTagID=9&pageindex=1&pagesize=50") andParams:nil andCallback:^(id obj) {
        
         TagArray = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)) {
            CourseModel* bmx = [CourseModel modelWithDictionary:bm];
            [TagArray addObject:bmx];
        }
        [self.collectionView2 reloadData];

    }];
    
    [BaseWebUtils Get:WWWURL(@"/Course/GetCoursesByTag?courseTagID=10&pageindex=1&pagesize=50") andParams:nil andCallback:^(id obj) {

        ListArray = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)) {
            CourseModel* bmx = [CourseModel modelWithDictionary:bm];
            [ListArray addObject:bmx];
        }
        [self.collectionView2 reloadData];
    }];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       ArvertisementCell *celli = [collectionView dequeueReusableCellWithReuseIdentifier:@"Scell" forIndexPath:indexPath];
        bannerModel *bn = Ad1Array[indexPath.item];
        [celli.imageview setImageURL:[NSURL URLWithString:ImgUrl(bn.ImgUrl)]];
        return celli;
    }else if (indexPath.section == 2){
        ArvertisementCell *celli2 = [collectionView dequeueReusableCellWithReuseIdentifier:@"Scell" forIndexPath:indexPath];
        bannerModel *bn = Ad2Array[indexPath.item];
        [celli2.imageview setImageURL:[NSURL URLWithString:ImgUrl(bn.ImgUrl)]];
         return celli2;
    }
    CourseCoCell* ncell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.section == 1) {
         ncell.datas = TagArray[indexPath.row];
    }else{
       ncell.datas = ListArray[indexPath.row];
    }
    return ncell;
}

//控制显示大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float W = (kScreenW-34)/2;
    float H = kScreenH/4.5;

    if (indexPath.section == 0) {
        
        return CGSizeMake(kScreenW, kScreenH/4);
    }else if (indexPath.section==2){
        W =kScreenW-12*2;
        H = kScreenH/9.5;
        return CGSizeMake(W, H);
    }    
    return CGSizeMake(W, H);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 0, kMargin, 0);;
    }
    return UIEdgeInsetsMake(kMargin, 12, kMargin, 12);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return kMargin;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section!=0) {
        int productid;
        int SupplierID;

        switch (indexPath.section) {
            case 1:
                productid = [TagArray[indexPath.row][@"ID"] intValue];
                SupplierID = [TagArray[indexPath.row][@"SupplierID"] intValue];
                break;
            case 2:{
                NSString *str2=Ad2Array[indexPath.row][@"Link"];
                NSArray *temp=[str2 componentsSeparatedByString:@"="];
                productid = [[temp lastObject] intValue];
                SupplierID = [TagArray[indexPath.row][@"SupplierID"] intValue];
            }
                break;
                
            default:
                productid = [ListArray[indexPath.row][@"ID"] intValue];
                SupplierID = [ListArray[indexPath.row][@"SupplierID"] intValue];
                break;
        }
        
//        DetailViewController *detail = [DetailViewController new];
//        
//        detail.productid = productid;
//        detail.SupplierID =SupplierID;
//        
//        [self.navigationController pushViewController:detail animated:YES];

        
        
        
    }
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
