//
//  CommentCellTableViewCell.m
//  xlxt
//
//  Created by xlky on 2018/4/24.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CommentCellTableViewCell.h"
#import "NSNumber+date.h"
@implementation CommentCellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self headiv];
        [self titleLb];
        [self dateLB];
        [self contentLB];
        
    }
    return self;
}

-(CircleImageView *)headiv
{
    if (!_headiv) {
        _headiv = [[CircleImageView alloc]initWithFrame:CGRectMake(10, 20, 50, 50)
        AndUrl:@""];
        _headiv.backgroundColor = GrayColor;
        [self addSubview:_headiv];
    }
    return _headiv;
}

-(ImTxLabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [[ImTxLabel alloc]initWithFrame:CGRectMake(70, 20, kScreenW-100, 15)];
        [self addSubview:_titleLb];
    }
    return _titleLb;
}
-(UILabel *)dateLB
{
    if (!_dateLB) {
        _dateLB = [[UILabel alloc]initWithFrame:CGRectMake(70, 40, kScreenW-100, 15)];
        [self addSubview:_dateLB];
    }
    return _dateLB;
}
-(ImTxLabel *)contentLB
{
    if (!_contentLB) {
        _contentLB = [[ImTxLabel alloc]initWithFrame:CGRectMake(70, 60, kScreenW-100, 10)];
        [self addSubview:_contentLB];
    }
    return _contentLB;
}
-(void)setCmodel:(CommentModel *)Cmodel
{
    _Cmodel = Cmodel;
    [self.headiv setImageURL:urlFormat(ImgUrl(_Cmodel.HeadImg))];
    self.dateLB.text =[NSNumber transferdate:[_Cmodel.AddTime substringWithRange:NSMakeRange(6,13)]];
    [self.contentLB SetText:_Cmodel.Content SetImage:nil];
    [self.titleLb SetText:[NSString stringWithFormat:@"会员：%@",_Cmodel.Name] SetImageArr: [self SetStar:_Cmodel.Star]];
    
}
-(NSArray*)SetStar:(NSInteger)star
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i<star; i++) {
        [arr addObject:@"x1"];
    }
    return [arr copy];
    
}
@end
