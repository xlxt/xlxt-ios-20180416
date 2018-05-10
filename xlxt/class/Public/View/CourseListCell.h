//
//  CourseListCell.h
//  xlxt
//
//  Created by xlky on 2017/3/3.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
@interface CourseListCell : UITableViewCell
@property(nonatomic)UIImageView *iv;
@property(nonatomic)UILabel *titleLb;
@property(nonatomic)UILabel *subtitleLb;
@property(nonatomic)NSDictionary *Datadic;
@property(nonatomic)ListModel *lmodel;
@end
