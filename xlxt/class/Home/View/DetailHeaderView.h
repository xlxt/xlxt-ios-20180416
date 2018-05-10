//
//  DetailHeaderView.h
//  xlxt
//
//  Created by xlky on 2018/4/24.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImTxLabel.h"
@protocol DetaiIndexDelegate<NSObject>
-(void)changeValue:(NSInteger)tag;
@end
@interface DetailHeaderView : UIView
@property(nonatomic,strong)UIImageView *headerImage;
@property(nonatomic,strong)UILabel *TitleLabel;
@property(nonatomic,strong)UILabel *ReadLabel;
@property(nonatomic,strong)UILabel *PriceLabel;
@property(nonatomic,strong)ImTxLabel *ScoreLabel;
@property(nonatomic,strong)UIButton *detail;
@property(nonatomic,strong)UIButton *catalog;
@property(nonatomic,strong)UIButton *comment;
@property(nonatomic,weak)id<DetaiIndexDelegate>delegate;
@end
