//
//  AudioView.h
//  xlxt
//
//  Created by xlky on 2017/4/5.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^recommend)(NSInteger RID);
@interface AudioView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *AudioBanner;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *CellBtn0;
@property (weak, nonatomic) IBOutlet UIImageView *CellBtn1;
@property (weak, nonatomic) IBOutlet UIImageView *CellBtn2;
@property (weak, nonatomic) IBOutlet UIImageView *CellBtn3;
@property (weak, nonatomic) IBOutlet UILabel *CellTl0;
@property (weak, nonatomic) IBOutlet UILabel *CellTl1;
@property (weak, nonatomic) IBOutlet UILabel *CellTl2;
@property (weak, nonatomic) IBOutlet UILabel *CellTl3;
@property (nonatomic, copy)recommend block;
@property (nonatomic,strong)NSDictionary *DataDic;
@property (nonatomic,strong)NSArray *Atarray;

@end
