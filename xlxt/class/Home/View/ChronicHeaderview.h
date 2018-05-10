//
//  ChronicHeaderview.h
//  xlxt
//
//  Created by xlky on 2018/4/28.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerButton.h"
#import "ImTxLabel.h"
#import "CataModel.h"
@protocol BannerDelegate<NSObject>
-(void)Refresh:(NSInteger)tag;
@end
@interface ChronicHeaderview : UICollectionReusableView
@property(nonatomic)UIImageView *headerview;
@property(nonatomic)BannerButton *bannerbtn;
@property(nonatomic)ImTxLabel *titlelb;
@property(nonatomic,copy)NSMutableArray *BtnArray;
@property(nonatomic,copy)NSMutableArray *titleArray;
@property(nonatomic,weak)id<BannerDelegate>delegate;
@end
