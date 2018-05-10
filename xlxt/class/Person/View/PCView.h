//
//  PCView.h
//  xlxt
//
//  Created by xlky on 2017/7/7.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"
#import "FitHeightLabel.h"
#import "PersonModel.h"
@interface PCView : UIView
@property ( nonatomic) CircleImageView *headerimage;
@property ( nonatomic) UILabel *name;
@property ( nonatomic) FitHeightLabel *core;
@property ( nonatomic) FitHeightLabel *coursecount;
@property ( nonatomic) FitHeightLabel *totaltime;
@property(strong,nonatomic) PersonModel *DataDic;
@end
