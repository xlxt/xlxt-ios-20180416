//
//  CoCourseCell.h
//  xlxt
//
//  Created by xlky on 2017/4/7.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoCourseModel.h"
@interface CoCourseCell : UITableViewCell
@property (nonatomic,strong)UIImageView *HeadImage;
@property (nonatomic,strong)UILabel *TitleLB;
@property (nonatomic,strong)UILabel *AverageB;
@property (nonatomic,strong)UILabel *LearningLB;
@property (nonatomic,strong)CoCourseModel *cmodel;
@end
