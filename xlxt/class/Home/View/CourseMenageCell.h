//
//  CourseMenageCell.h
//  xlxt
//
//  Created by xlky on 2018/4/27.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImTxLabel.h"
@interface CourseMenageCell : UICollectionViewCell
@property (assign)NSInteger index;
@property (nonatomic) ImTxLabel *titleLB;
@property (nonatomic) UIView *vline;
@property (nonatomic) UIView *hline;
@property (nonatomic,strong)NSDictionary *CDataDic;
@end
