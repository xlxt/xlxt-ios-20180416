//
//  AudioViewCell.m
//  xlxt
//
//  Created by xlky on 2018/4/8.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "AudioViewCell.h"
#import "NSAttributedString+TransHtml.h"
@implementation AudioViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self headiv];
        [self titleLB];
        [self browsecount];
        [self start];
        self.titleLB.text = @"制作POP技巧（上）";
        self.browsecount.text = @"1535人浏览";
        
    }
    return self;
}

-(CircleImageView *)headiv
{
    if (!_headiv) {
        _headiv = [[CircleImageView alloc]initWithFrame:CGRectMake(0, 0, 55, 55) AndUrl:@""];
        _headiv.backgroundColor = [UIColor grayColor];
        [self addSubview:_headiv];
        [_headiv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.width.mas_equalTo(55);
            make.height.mas_equalTo(55);
        }];
    }
    return _headiv;
}

-(YYLabel *)titleLB
{
    if (!_titleLB) {
        _titleLB = [[YYLabel alloc]init];
        _titleLB.numberOfLines = 0;
        _titleLB.font = [UIFont systemFontOfSize:13];
        [self addSubview:_titleLB];
        
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headiv.mas_right).mas_offset(15);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(-5);
            make.height.mas_equalTo(30);
        }];
    }
    return _titleLB;
}
-(YYLabel *)browsecount
{
    if (!_browsecount) {
         _browsecount = [[YYLabel alloc]init];
         _browsecount.font = [UIFont systemFontOfSize:13];
        [self addSubview:_browsecount];
        [_browsecount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLB.mas_bottom);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.titleLB.mas_left);
            make.right.mas_equalTo(-5);
        }];
    }
    return _browsecount;
}

-(UIImageView *)start
{
    if (!_start) {
        _start = [[UIImageView alloc]init];
        _start.image = [UIImage imageNamed:@"playSmall"];
        [self addSubview:_start];
        [_start mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
            make.center.mas_equalTo(self.headiv);
            
        }];
    }
    return _start;
}
-(void)setAumodel:(AudioModel *)aumodel
{
    _aumodel = aumodel;
    [self.headiv setImageURL:[NSURL URLWithString:ImgUrl(_aumodel.course.Img)]];
    self.titleLB.text =_aumodel.course.Name;
    NSString *browsestr=[NSString stringWithFormat:@"%ld人浏览",(long)_aumodel.course.BrowseNum];
    NSString *str =[NSString stringWithFormat:@"%ld",(long)_aumodel.course.BrowseNum];
    self.browsecount.attributedText = [NSAttributedString ChangeColor:[UIColor orangeColor] AtRange: [browsestr rangeOfString:str]  String:browsestr];
}
@end
