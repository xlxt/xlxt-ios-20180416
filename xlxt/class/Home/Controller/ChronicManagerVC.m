//
//  ChronicManager.m
//  xlxt
//
//  Created by xlky on 2018/4/28.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "ChronicManagerVC.h"
#import "CourseCoCell.h"
#import "ChronicHeaderview.h"
#import "CataModel.h"
#import "CourseModel.h"
@interface ChronicManagerVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,BannerDelegate>
{
    NSMutableArray *cataarr;
    NSMutableArray *ChronicArr;
}
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation ChronicManagerVC
//lazy load
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds
                                             collectionViewLayout:fl];
        

        _collectionView.backgroundColor = WhiteColor;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        
        [self.view addSubview:_collectionView];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"慢病管理";
    [self collectionView];
    [self.collectionView registerClass:[CourseCoCell class] forCellWithReuseIdentifier:@"cell"];
    //注册组头
    [self.collectionView registerClass:[ChronicHeaderview class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ChronicHeaderview"];
    
    [BaseWebUtils Get:WWWURL(@"/Course/GetCourseClassifyChildByInfoParentID?ParentID=6&Pagesize=5&Pageindex=1") andParams:nil andCallback:^(id obj) {
        cataarr = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)[@"data"]) {
            CataModel* bmx = [CataModel modelWithDictionary:bm];
            [cataarr addObject:bmx];
        }
        [self.collectionView reloadData];
    }];
    
    [self loadWebData:45];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   CourseCoCell* ncell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    //    if (indexPath.section == 1) {
     ncell.datas = ChronicArr[indexPath.item];
    //    }else{
    //       ncell.datas = self.ListArray[indexPath.row];
    //    }
    
    return ncell;
    
}

//控制显示大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    float W = (kScreenW-34)/2;
    float H = kScreenH/4.5;
    return CGSizeMake(W, H);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return UIEdgeInsetsMake(kMargin, 12, kMargin, 12);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(0, 295);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return kMargin;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return ChronicArr.count;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    ChronicHeaderview *view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ChronicHeaderview" forIndexPath:indexPath];
        view.delegate = self;
        view.titleArray = cataarr;
         return view;
    }
    return nil;
}
-(void)Refresh:(NSInteger)tag
{
    [self loadWebData:tag];
}
-(void)loadWebData:(NSInteger)ParentID
{
    NSString *URLstr = [NSString stringWithFormat:@"/Course/GetCourseShow?newest=false&browseNum=true&reviewAvg=false&courseClassify=%ld&pagesize=12&pageindex=1&keyword=",(long)ParentID];
    [BaseWebUtils Get:WWWURL(URLstr) andParams:nil andCallback:^(id obj) {
        
        ChronicArr = [NSMutableArray array];
        for (NSDictionary* bm in JsonObj(obj)[@"data"]) {
            CourseModel* bmx = [CourseModel modelWithDictionary:bm];
            [ChronicArr addObject:bmx];
        }
        [self.collectionView reloadData];
    }];

}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return NO;
}

- (void)updateFocusIfNeeded {
    
}

@end
