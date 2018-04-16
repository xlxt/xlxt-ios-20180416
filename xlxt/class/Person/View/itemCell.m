//
//  itemCell.m
//  xlxt
//
//  Created by xlky on 2016/12/30.
//  Copyright © 2016年 xlky. All rights reserved.
//

#import "itemCell.h"

@implementation itemCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //       self.layer.borderWidth = 1;
 //       self.layer.borderColor = MainGrayColor.CGColor;
        self.IV = [UIImageView new];
        [self.contentView addSubview:self.IV];
        
        [self.IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.mas_width).multipliedBy(0.3);
            make.height.mas_equalTo(self.mas_width).multipliedBy(0.3);
            make.center.mas_equalTo(0);
            make.centerY.offset(-15);
            
        }];
        
        self.label = [UILabel new];

        self.label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.label];
        self.label.adjustsFontSizeToFitWidth = YES;
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.IV.mas_bottom);
            make.width.mas_equalTo(self.mas_width).multipliedBy(0.4);
            make.width.centerX.offset(0);
            make.height.mas_equalTo(self.mas_width).multipliedBy(0.3);
        }];
        

        

        UIView *view1 = [UIView new];
        view1.backgroundColor = MainGrayColor;
        [self addSubview:view1];
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.right.mas_equalTo(0);
            make.width.mas_equalTo(.8);
        }];
        
        UIView *view2 = [UIView new];
        view2.backgroundColor =  MainGrayColor;
        [self addSubview:view2];
        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(.8);
        }];
        
        

    }
    
    return self;
}
@end
