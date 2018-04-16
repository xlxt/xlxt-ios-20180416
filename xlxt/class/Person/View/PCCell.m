//
//  PCCell.m
//  xlxt
//
//  Created by xlky on 2017/7/11.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "PCCell.h"

@implementation PCCell
-(UIImageView *)PIV
{
    if (!_PIV) {
        _PIV = [[UIImageView alloc]initWithFrame:CGRectMake(16, 16, 18, 18)];
        [self addSubview:_PIV];
    }
    return _PIV;
}
-(UIImageView *)RightIV
{
    if (!_RightIV) {
        _RightIV =[[UIImageView alloc]initWithFrame:CGRectMake(kScreenW-24, 18, 13, 10)];
        _RightIV.image = [UIImage imageNamed:@"返回"];
         [self addSubview:_RightIV];
    }
    return _RightIV;
}
-(UILabel *)TitleLabel
{
    if (!_TitleLabel) {
        _TitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(52, 18, 200, 17)];
        _TitleLabel.font = [UIFont systemFontOfSize:16];
        _TitleLabel.textColor = COLORAHex(@"#3c3d41");
        [self addSubview:_TitleLabel];
    }
    return _TitleLabel;
}
-(UILabel *)Messagelabel
{
    if (!_Messagelabel) {
        _Messagelabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW-34, 12, 10, 12)];
        [self addSubview:_Messagelabel];
    }
    return _Messagelabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];

}

-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    _PIV.image = [UIImage imageNamed:_dic[@"icon"]];
    _TitleLabel.text = _dic[@"title"];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self PIV];
        [self RightIV];
        [self TitleLabel];
        [self Messagelabel];
        [self separateLine];
    }
    
    return self;
    
    
}
-(UIView *)separateLine
{
    if (!_separateLine) {
        _separateLine = [[UIView alloc]init];
        _separateLine.backgroundColor = COLORAHex(@"#ced7e4");
        _separateLine.alpha = 0.5;
        [self addSubview:_separateLine];
        [_separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(0);
            make.height.mas_equalTo(1);
            make.left.mas_equalTo(52);
        }];
        
    }
    return _separateLine;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
