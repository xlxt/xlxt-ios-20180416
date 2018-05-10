//
//  DetailHeaderView.m
//  xlxt
//
//  Created by xlky on 2018/4/24.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//
////  = 1 << 0,
//UIViewAutoresizingFlexibleWidth        = 1 << 1,
//UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
//UIViewAutoresizingFlexibleTopMargin

#import "DetailHeaderView.h"

@implementation DetailHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        [self headerImage];
        [self TitleLabel];
        [self ReadLabel];
        [self PriceLabel];
        [self ScoreLabel];
        [self detail];
        [self catalog];
        [self comment];
        
        
    }
    return self;
}
-(UIImageView *)headerImage
{
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*9/16)];
        _headerImage.image = [UIImage imageNamed:@"课程占位图@2x"];
        [self addSubview:_headerImage];
    }
    return _headerImage;
}
-(UILabel *)TitleLabel
{
    if (!_TitleLabel) {
        _TitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, kScreenW*9/16+15, kScreenW-10, 17)];
        _TitleLabel.text =@"商品新品管理";
        [self addSubview:_TitleLabel];
        _TitleLabel.autoresizingMask =UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleRightMargin|    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
    }
    return _TitleLabel;
}
-(UILabel *)ReadLabel
{
    if (!_ReadLabel) {
        _ReadLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, kScreenW*9/16+15+22, kScreenW/2, 17)];
        _ReadLabel.font = FontSet(13);
        _ReadLabel.text =@"阅读 6787";
        [self addSubview:_ReadLabel];
        _ReadLabel.autoresizingMask =UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleRightMargin|    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
    }
    return _ReadLabel;
}
-(UILabel *)PriceLabel
{
    if (!_PriceLabel) {
        _PriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, kScreenW*9/16+55, kScreenW/2, 17)];
        _PriceLabel.text =@"¥ 4999";
        _PriceLabel.textColor =COLOR(222, 75, 76);
        _PriceLabel.font = FontSet(13);
        [self addSubview:_PriceLabel];
        _PriceLabel.autoresizingMask =UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleRightMargin|    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
    }
    return _PriceLabel;
}
-(ImTxLabel *)ScoreLabel
{
    if (!_ScoreLabel) {
        _ScoreLabel = [[ImTxLabel alloc]initWithFrame:CGRectMake(kScreenW/2+50, kScreenW*9/16+30, kScreenW/2-10, 15)];
        [_ScoreLabel SetText:@"评分: " SetImageArr:@[@"x2",@"x2",@"x2",@"x2",@"x2"]];
        [self addSubview:_ScoreLabel];
    }
    return _ScoreLabel;
}
-(UIButton *)detail
{
    if (!_detail) {
        _detail = [UIButton buttonWithType:UIButtonTypeCustom];
        _detail.frame = CGRectMake(0, kScreenW*9/16+80, kScreenW/3, 35);
        _detail.titleLabel.font = FontSet(16);
        _detail.tag = 0;
        [_detail setTitle:@"详情" forState:UIControlStateNormal];
        [_detail setTitleColor:BlackColor forState:UIControlStateNormal];
        [_detail addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
        [_detail setTitleColor:navigationbar forState:UIControlStateSelected];
        [self addSubview:_detail];
        UIView *upline = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenW*9/16+79, kScreenW, 1)];
        upline.backgroundColor = COLOR(231, 231, 231);
        [self addSubview:upline];
    }
    return _detail;
}
-(UIButton *)catalog
{
    if (!_catalog) {
        _catalog = [UIButton buttonWithType:UIButtonTypeCustom];
        _catalog.frame = CGRectMake(kScreenW/3, kScreenW*9/16+80, kScreenW/3, 35);
        _catalog.titleLabel.font = FontSet(16);
        _catalog.tag = 1;
        [_catalog setTitle:@"目录" forState:UIControlStateNormal];
        [_catalog setTitleColor:BlackColor forState:UIControlStateNormal];
         [_catalog addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
        [_catalog setTitleColor:navigationbar forState:UIControlStateSelected];
        [self addSubview:_catalog];
    }
    return _catalog;
}
-(UIButton *)comment
{
    if (!_comment) {
        
        _comment = [UIButton buttonWithType:UIButtonTypeCustom];
        _comment.frame = CGRectMake(kScreenW/3*2, kScreenW*9/16+80, kScreenW/3, 35);
        _comment.titleLabel.font = FontSet(16);
        _comment.tag = 2;
        [_comment setTitle:@"评论" forState:UIControlStateNormal];
         [_comment setTitleColor:BlackColor forState:UIControlStateNormal];
         [_comment addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
        [_comment setTitleColor:navigationbar forState:UIControlStateHighlighted];
        [self addSubview:_comment];
        UIView *upline = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenW*9/16+115, kScreenW, 1)];
        upline.backgroundColor = COLOR(231, 231, 231);
        [self addSubview:upline];
    }
    return _comment;
}
-(void)changeAction:(UIButton*)btn
{
    [self.delegate changeValue:btn.tag];
}
@end
