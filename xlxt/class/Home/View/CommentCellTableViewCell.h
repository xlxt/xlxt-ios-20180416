//
//  CommentCellTableViewCell.h
//  xlxt
//
//  Created by xlky on 2018/4/24.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"
#import "ImTxLabel.h"
#import "CommentModel.h"
@interface CommentCellTableViewCell : UITableViewCell
@property(nonatomic,strong)CircleImageView *headiv;
@property(nonatomic,strong)ImTxLabel *titleLb;
@property(nonatomic,strong)UILabel *dateLB;
@property(nonatomic,strong)ImTxLabel *contentLB;
@property(nonatomic,strong)CommentModel *Cmodel;
@end
