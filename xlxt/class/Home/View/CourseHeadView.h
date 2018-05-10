//
//  CourseHeadView.h
//  xlxt
//
//  Created by xlky on 2017/4/10.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseHeadView : UICollectionReusableView
typedef void (^Courseblock)(NSInteger section);
@property (nonatomic) UIView *Cline;
@property (nonatomic) UILabel *Ctitle;
@property (nonatomic) UIButton *Cmore;
@property (nonatomic) NSInteger section;
@property (nonatomic, copy) void(^pushBlock)(CourseHeadView *vc);
@property(nonatomic, copy)Courseblock block;
@end
