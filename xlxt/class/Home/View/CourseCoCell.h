//
//  CourseCoCell.h
//  xlxt
//
//  Created by xlky on 2018/4/4.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseModel.h"
@interface CourseCoCell : UICollectionViewCell
@property (assign)NSInteger mode;
@property (nonatomic)UIImageView *imageview;
@property (nonatomic)YYLabel *titleLabel;
@property (nonatomic)YYLabel *priseLabel;
@property (nonatomic)YYLabel *purchaseLabel;
@property (nonatomic,strong)CourseModel *datas;
@end
