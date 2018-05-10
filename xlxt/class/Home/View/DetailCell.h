//
//  DetailCell.h
//  xlxt
//
//  Created by xlky on 2017/3/14.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModel.h"
@interface DetailCell : UITableViewCell
@property (nonatomic)NSString *lbtext;
@property (nonatomic, strong) YYLabel *contentLabel;
-(void)setLBtest:(NSString *)text AndLBheight:(CGFloat)height;

@end
