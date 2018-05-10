//
//  EnterHeaderView.m
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "EnterHeaderView.h"
#import "UIView+AddShadow.h"
@implementation EnterHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WhiteColor;
        ViewBorder(self, 10, COLORAHex(@"#f7f8fC"));
        
        [self headerview];
        [self titlelb];
        [self introducelb];
        
        CGFloat h = CGRectGetHeight(self.titlelb.frame)+30+CGRectGetHeight(self.introducelb.frame)+18;
        [self setHeight:h];
        
    }
    return self;
}
-(void)setHeaddic:(UniModel *)headdic
{
    _headdic = headdic;
    [self.titlelb SetText:_headdic.Name SetImage:nil];
    [self.introducelb SetText:_headdic.Introduce SetImage:nil];
    [self.headerview setImageWithURL:[NSURL URLWithString:ImgUrl(_headdic.BannerImg)] placeholder:[UIImage imageNamed:@"icon58"]];
    CGFloat h = CGRectGetHeight(self.titlelb.frame)+30+CGRectGetHeight(self.introducelb.frame)+18;
    [self setHeight:h];
    
}
-(UIImageView *)headerview
{
    if (!_headerview) {
        _headerview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon58"]];
        _headerview.frame = CGRectMake(20, 28, 25, 25);
        [_headerview AddShadowWithview:_headerview color:navigationbar shadowOffset:CGSizeMake(0, 0) shadowRadius:6.0f shadowOpacity:0.35f];
        [self addSubview:_headerview];
    }
    return _headerview;
}
-(ImTxLabel *)titlelb
{
    if (!_titlelb) {
        _titlelb = [[ImTxLabel alloc]initWithFrame:CGRectMake(55, 28, kScreenW-48, 10)];
     //   _titlelb.attri.color = COLORA(51, 53, 55, 1);
        [_titlelb SetImageFont:15 TextFont:15 imageoffset:15 lineSpace:6 color:COLORA(51, 53, 55, 1)];
        [_titlelb SetText:@"北京杏林康云信息科技股份有限公司" SetImage:nil];
        [self addSubview:_titlelb];
    }
    return _titlelb;
}

-(ImTxLabel *)introducelb
{
    if (!_introducelb) {
        
        CGFloat getheight = CGRectGetHeight(self.titlelb.frame);
        _introducelb = [[ImTxLabel alloc]initWithFrame:CGRectMake(20, getheight+30, kScreenW-40, 10)];
        _introducelb.attri.color  = COLORA(51, 53, 55, 1);
         [_introducelb SetImageFont:13 TextFont:13 imageoffset:13 lineSpace:5 color:COLORA(51, 53, 55, 1)];
        [_introducelb SetText:@"杏林学堂，为国内首个医药零售领域的微课培训云平台，旨在构建智慧型课堂，让学习更为简单有利" SetImage:nil];
        [self addSubview:_introducelb];
    }
    return _introducelb;
}
@end
