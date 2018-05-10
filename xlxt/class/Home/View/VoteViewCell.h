//
//  VoteViewCell.h
//  xlxt
//
//  Created by xlky on 2018/4/8.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoteModel.h"
@interface VoteViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *VoteCondition;
@property (weak, nonatomic) IBOutlet UIButton *Good;
@property (weak, nonatomic) IBOutlet UIButton *Bad;
@property (weak, nonatomic) IBOutlet UIButton *Share;
@property (weak, nonatomic) IBOutlet UIImageView *VoteIV;
@property (weak, nonatomic) IBOutlet UIButton *JoinBtn;
@property (weak, nonatomic) IBOutlet UILabel *Introduce;
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UIImageView *HeadIV;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (nonatomic, strong) VoteModel *VModel;
@end
