//
//  L_ServiceLayout.h
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ThreeWaterFlow = 0, /** 三排列瀑布流 */
    HorizontalWaterFlow = 1, /** 多列水平瀑布流 */
    SingleWaterFlow = 2,  /** 单排列瀑布流 */
} FlowLayoutStyle; //样式
@class ServiceLayout;
@protocol ServiceLayoutDelegate <NSObject>
@optional;
-(CGFloat)heightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)heightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath;
/** 多列布局 item数量 */
-(NSInteger)waterFlowLayout:(ServiceLayout *)waterFlowLayout CountForItemAtHoriziontalIndexPath:(NSIndexPath *)indexPath;
/** 单列布局 item高度 */
-(CGFloat)waterFlowLayout:(ServiceLayout *)waterFlowLayout HeightForItemAtHoriziontalIndexPath:(NSIndexPath *)indexPath;
/** 列数*/
-(NSInteger)columnCountInWaterFlowLayout:(ServiceLayout *)waterFlowLayout columnCountForsectionndexPath:(NSIndexPath *)indexPath;
/** section 模式 */
-(FlowLayoutStyle)waterFlowLayout:(ServiceLayout *)waterFlowLayout ModeForItemAtHoriziontalIndexPath:(NSIndexPath *)indexPath;
//外边距
-(UIEdgeInsets)WaterFlowLayout:(ServiceLayout *)waterFlowLayout ForMarginAtIndexPath:(NSIndexPath *)indexPath;
//内边距
-(UIEdgeInsets)WaterFlowLayout:(ServiceLayout *)waterFlowLayout FoPaddingAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface ServiceLayout : UICollectionViewLayout

@property (nonatomic, weak) id<ServiceLayoutDelegate>delegate;
@property (nonatomic, assign) FlowLayoutStyle  flowLayoutStyle;
@end
