//
//  CourseCoCell.m
//  xlxt
//
//  Created by xlky on 2018/4/4.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CourseCoCell.h"

@implementation CourseCoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        
        [self imageview];
        [self titleLabel];
        [self priseLabel];
        [self purchaseLabel];
        
    }
    
    return self;
}
-(UIImageView *)imageview
{
    if (!_imageview) {
        _imageview =[UIImageView new];
        _imageview.contentMode = UIViewContentModeScaleAspectFit;
        _imageview.backgroundColor = ClearColor;
        _imageview.image = [UIImage imageNamed:@"课程占位图@2x"];
        [self addSubview:_imageview];
        
        
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-46);
        }];
    }
    return _imageview;
}

-(YYLabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [YYLabel new];
        _titleLabel.text =@"杏林学堂课程";
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.backgroundColor = WhiteColor;
        _titleLabel.textColor = COLOR(55, 57, 59);
        [self addSubview:_titleLabel];
        
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.imageview.mas_bottom).mas_offset(10);
            make.height.mas_equalTo(15);
        }];
    }
    return _titleLabel;
}

-(YYLabel *)priseLabel
{
    if (!_priseLabel) {
        _priseLabel = [YYLabel new];
        _priseLabel.backgroundColor = WhiteColor;
        _priseLabel.textColor = [UIColor orangeColor];
        _priseLabel.font = [UIFont systemFontOfSize:12];
        _priseLabel.text =@"¥24";
        [self addSubview:_priseLabel];
        
        [_priseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(self.titleLabel.mas_centerX);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(8);
            
        }];
    }
    return _priseLabel;
}

-(YYLabel *)purchaseLabel
{
    if (!_purchaseLabel) {
        _purchaseLabel = [YYLabel new];
        
        _purchaseLabel.backgroundColor = WhiteColor;
        _purchaseLabel.textAlignment = NSTextAlignmentRight;
        _purchaseLabel.textColor = [UIColor grayColor];
        _purchaseLabel.font = [UIFont systemFontOfSize:12];
        _purchaseLabel.text = @"4984";
        [self addSubview:_purchaseLabel];
        
        [_purchaseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.titleLabel.mas_centerX);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(7);
        }];
    }
    return _purchaseLabel;
}
-(void)setDatas:(CourseModel *)datas
{
    _datas = datas;
    [self.imageview setImageURL:[NSURL URLWithString:ImgUrl(_datas.Img)]];
    self.titleLabel.text = _datas.Name;
    self.priseLabel.text = [NSString stringWithFormat:@"¥%ld",(long)_datas.Price];
    self.purchaseLabel.text =[NSString stringWithFormat:@"%ld人浏览",(long)_datas.BrowseNum];
    
}
@end
