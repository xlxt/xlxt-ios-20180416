//
//  PCCell.h
//  xlxt
//
//  Created by xlky on 2017/7/11.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PCCell : UITableViewCell
@property(nonatomic)UIImageView *PIV;
@property(nonatomic)UIImageView *RightIV;
@property(nonatomic)UILabel *TitleLabel;
@property(nonatomic)UILabel *Messagelabel;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,strong)UIView *separateLine;
@end
