//
//  L_ServiceHeaderReusableView.h
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol homeheadDelegate<NSObject>
-(void)push:(NSInteger)tag;
@end
@interface HeaderReusableView : UICollectionReusableView
@property (assign)NSInteger sectiontag;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong)UIView *lineview;
@property(nonatomic,weak)id<homeheadDelegate>delegate;
@end
