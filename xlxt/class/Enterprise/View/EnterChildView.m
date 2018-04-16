//
//  EnterChildView.m
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "EnterChildView.h"

@implementation EnterChildView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = WhiteColor;
        ViewBorder(self, 0.5, COLORA(225, 233, 239, 0.5));
        [self titlelabel];
        [self imageview];
        [self vipimageview];
        
    }
    return self;
}
//lazy load
-(UIImageView *)imageview
{
    if (!_imageview) {
        _imageview = [[UIImageView alloc]init];
        _imageview.backgroundColor = WhiteColor;
        _imageview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageview];
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(21);
            make.right.mas_equalTo(-21);
            make.bottom.mas_equalTo(-45);
            
        }];
    }
    return _imageview;
}

-(UIImageView *)vipimageview
{
    if (!_vipimageview) {
        _vipimageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"VIP角标1"]];

        _vipimageview.hidden = YES;
        [self addSubview:_vipimageview];
        [_vipimageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.mas_equalTo(0);
            make.width.height.mas_equalTo(50);
        }];
        
    }
    return _vipimageview;
}
-(UILabel *)titlelabel
{
    if (!_titlelabel) {
        _titlelabel =[[UILabel alloc]init];
        _titlelabel.textAlignment = NSTextAlignmentCenter;
        _titlelabel.textColor = COLORA(51, 53, 55, 1);
        _titlelabel.font = FontSet(12);
        [self addSubview:_titlelabel];
        [_titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-21);
            make.height.mas_equalTo(12);
        }];
    }
    return _titlelabel;
}
@end
