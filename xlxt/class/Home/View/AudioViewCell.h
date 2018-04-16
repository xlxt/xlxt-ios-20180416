//
//  AudioViewCell.h
//  xlxt
//
//  Created by xlky on 2018/4/8.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"
@interface AudioViewCell : UICollectionViewCell
@property(nonatomic,strong)CircleImageView *headiv;
@property(nonatomic,strong)YYLabel *titleLB;
@property(nonatomic,strong)YYLabel *browsecount;
@property(nonatomic,strong)UIImageView *start;
@end
