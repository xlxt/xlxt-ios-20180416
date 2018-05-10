//
//  HomeHeaderView.h
//  xlxt
//
//  Created by xlky on 2018/3/30.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQBannarView.h"
@protocol homeDelegate<NSObject>
-(void)ImageBtnClick:(NSInteger)tag;
-(void)BannerClick:(NSInteger)tag;
-(void)AdverViewClick:(NSInteger)tag;
@end
@interface HomeHeaderView : UICollectionReusableView
@property (nonatomic,strong)SQBannarView *bannerView;
@property (nonatomic,strong)NSArray *BannerArray;
@property (nonatomic,strong)NSArray *AdverArray;
@property(nonatomic,weak)id<homeDelegate>delegate;
@end
