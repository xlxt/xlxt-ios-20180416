//
//  AudioCell.h
//  xlxt
//
//  Created by xlky on 2017/4/6.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioModel.h"
#import "ImTxLabel.h"
@interface AudioCell : UITableViewCell
@property(nonatomic,strong) UILabel *Coursetitle;
@property(nonatomic,strong) ImTxLabel *timeAndHit;
@property(nonatomic,strong) UIImageView *courseIv;
@property(nonatomic,strong) UIImageView *PlayIV;
@property(nonatomic) AudioModel *ACellModel;
@property(nonatomic,strong) NSDictionary*dic;
@property (assign)CGFloat cellheight;

@end
