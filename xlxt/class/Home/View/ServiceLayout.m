//
//  L_ServiceLayout.m
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//
#define kBaseLine(a) (CGFloat)a * SCREEN_WIDTH / 375.0

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define COLORA(R,G,B,A) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:A]
#define COLOR(R,G,B) COLORA(R,G,B,1.0)

/** 边框*/
#define ViewBorder(View,Width,Color)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]
#import "ServiceLayout.h"

@interface ServiceLayout ()
{
    
    UIEdgeInsets margin;
    UIEdgeInsets padding;
    NSInteger count;
    CGFloat x;
    CGFloat y;
    CGFloat w;
    CGFloat h;
}
@property (nonatomic, assign) CGFloat totalHeight;
@property (nonatomic, strong) NSMutableArray *attrsArr;

/** 存放所有cell的布局属性*/
@property (assign, nonatomic) NSInteger ItemCount;
@property (assign, nonatomic) NSInteger ColumnCount;
@property (assign, nonatomic) CGFloat ItemHeight;

@end

@implementation ServiceLayout

-(void)prepareLayout {
    [super prepareLayout];
    self.totalHeight = 0;
    NSMutableArray *attributesArr = [NSMutableArray array];
    NSInteger sectionCount = [self.collectionView numberOfSections];
    for (int i = 0; i < sectionCount; i++) {
        NSIndexPath *indexP = [NSIndexPath indexPathWithIndex:i];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexP];
        [attributesArr addObject:attr];
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < itemCount; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [attributesArr addObject:attrs];
        }
        UICollectionViewLayoutAttributes *attr1 = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexP];
        [attributesArr addObject:attr1];
    }
    self.attrsArr = [NSMutableArray arrayWithArray:attributesArr];
}
/// contentSize
-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, self.totalHeight+50);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *layoutAttrs = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    CGFloat height = 0;
    
    if (elementKind == UICollectionElementKindSectionHeader) {
        if (_delegate != nil && [_delegate respondsToSelector:@selector(heightOfSectionHeaderForIndexPath:)]) {
            height = [_delegate heightOfSectionHeaderForIndexPath:indexPath];
        }
    } else {
        if (_delegate != nil && [_delegate respondsToSelector:@selector(heightOfSectionFooterForIndexPath:)]) {
            height = [_delegate heightOfSectionFooterForIndexPath:indexPath];
        }
    }
    layoutAttrs.frame = CGRectMake(0, self.totalHeight, SCREEN_WIDTH, height);
    self.totalHeight += height;
    return layoutAttrs;
}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
   self.ItemCount = [self.delegate waterFlowLayout:self CountForItemAtHoriziontalIndexPath:indexPath];

    
    switch (indexPath.section) {
        case 0:
            [self HorizontalLayout:layoutAttributes indexPath:indexPath];
            break;
        case 1:
            [self SingleLayout:layoutAttributes indexPath:indexPath];
            break;
        case 2:
            [self SingleLayout:layoutAttributes indexPath:indexPath];
            break;
        case 3:
            [self SingleLayout:layoutAttributes indexPath:indexPath];
            break;
        case 4:
             [self layoutAttributesForCopyRightlayout:layoutAttributes indexPath:indexPath];
            break;
        case 5:
            [self SingleLayout:layoutAttributes indexPath:indexPath];
            break;
        default:
            [self HorizontalLayout:layoutAttributes indexPath:indexPath];
            break;
    }
    return layoutAttributes;
}
/// 服务
- (void)layoutAttributesForServiceLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat y = self.totalHeight;
    if (indexPath.item == 0) {
        layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH, kBaseLine(85));
        self.totalHeight += kBaseLine(85);
    } else {
        if (indexPath.item > 6) { return; }
        long row = (indexPath.item -1) % 3;
        CGFloat width = SCREEN_WIDTH / 3.0;
        layoutAttributes.frame = CGRectMake(row * width, y, width, kBaseLine(100));
        if (indexPath.item == 3 || indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
            self.totalHeight += kBaseLine(100);
        }
    }
}
/// 版权
- (void)layoutAttributesForCopyRightlayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat height = [self.delegate waterFlowLayout:self HeightForItemAtHoriziontalIndexPath:indexPath];
    margin = [self.delegate WaterFlowLayout:self ForMarginAtIndexPath:indexPath];
    padding = [self.delegate WaterFlowLayout:self FoPaddingAtIndexPath:indexPath];
    
    CGFloat y = self.totalHeight+margin.top;
    CGFloat width = (SCREEN_WIDTH-margin.left-margin.right-padding.left) / 2.0;

    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(margin.left, y, width, height*2+padding.top);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(width+padding.left+margin.left, y, width, height);
            break;
        case 2:
            layoutAttributes.frame = CGRectMake(width+padding.left+margin.left, height + y+padding.top, width, height);
            break;
        default:
            break;
    }
    if (indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
        self.totalHeight += (height*2+margin.top+margin.bottom+padding.top);
    }
}
/// 专利
- (void)layoutAttributesForPatentLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat y = self.totalHeight;
    CGFloat height = 0;
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH, kBaseLine(85));
            height = kBaseLine(85);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            height = kBaseLine(80);
            break;
        case 2:
            layoutAttributes.frame = CGRectMake(SCREEN_WIDTH/2.0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            height = kBaseLine(80);
            break;
        default:
            break;
    }
    if (indexPath.item == 0 || indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
        self.totalHeight += height;
    }
}
/// 案件
- (void)layoutAttributesForCaseLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat y = self.totalHeight;
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            self.totalHeight += kBaseLine(80);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            self.totalHeight += kBaseLine(80);
            break;
        case 2:
            layoutAttributes.frame = CGRectMake(SCREEN_WIDTH/2.0, y - kBaseLine(160), SCREEN_WIDTH/2.0, kBaseLine(160));
            break;
        default:
            break;
    }
}
//横向多列布局
- (void)HorizontalLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    
    margin = [self.delegate WaterFlowLayout:self ForMarginAtIndexPath:indexPath];
    padding = [self.delegate WaterFlowLayout:self FoPaddingAtIndexPath:indexPath];
    
    self.ColumnCount = [self.delegate columnCountInWaterFlowLayout:self columnCountForsectionndexPath:indexPath];
    count = [self.collectionView numberOfItemsInSection:indexPath.section];
    NSInteger row = count%self.ColumnCount == 0 ? count/self.ColumnCount:count/self.ColumnCount+1;
    
    self.ItemHeight = [self.delegate waterFlowLayout:self HeightForItemAtHoriziontalIndexPath:indexPath];
    
    
     w = self.collectionView.frame.size.width/self.ColumnCount-margin.left-padding.left/self.ColumnCount;
     h = self.ItemHeight;
    
     x = indexPath.item%self.ColumnCount*(padding.left+w)+margin.left;
     y =(indexPath.item/self.ColumnCount*(self.ItemHeight+padding.top))+self.totalHeight+margin.top;
    
    layoutAttributes.frame = CGRectMake(x, y, w, h);
    
    if (indexPath.item ==count-1) {
         self.totalHeight +=row*(self.ItemHeight+margin.top)+margin.bottom;
    }
    
}

-(void)SingleLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    margin = [self.delegate WaterFlowLayout:self ForMarginAtIndexPath:indexPath];
    padding = [self.delegate WaterFlowLayout:self FoPaddingAtIndexPath:indexPath];
    count = [self.collectionView numberOfItemsInSection:indexPath.section];
    self.ItemHeight = [self.delegate waterFlowLayout:self HeightForItemAtHoriziontalIndexPath:indexPath];
     x = margin.left;
     w = SCREEN_WIDTH-margin.right-margin.left;
     h = self.ItemHeight;
     y = self.totalHeight+margin.top;
    
    
     layoutAttributes.frame = CGRectMake(x,y, w, h);
    
    
    if (indexPath.item ==count-1) {
        self.totalHeight=self.totalHeight+self.ItemHeight+margin.bottom+padding.top;
    }else if(indexPath.item ==0){
        self.totalHeight=self.totalHeight+self.ItemHeight+margin.top;
    }
    else
    {
        self.totalHeight=self.totalHeight+self.ItemHeight+padding.top;
    }
    
}
@end
