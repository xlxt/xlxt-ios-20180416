//
//  CoCourseCell.m
//  xlxt
//
//  Created by xlky on 2017/4/7.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CoCourseCell.h"

@implementation CoCourseCell

- (void)awakeFromNib {
    [super awakeFromNib];
 
}
-(UIImageView *)HeadImage
{
    if (!_HeadImage) {
        _HeadImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kScreenW/3.5, kScreenW*9/56)];
        [self addSubview:_HeadImage];
    }
    return _HeadImage;
}
-(UILabel *)TitleLB
{
    if (!_TitleLB) {
        
        _TitleLB = [UILabel new];
        _TitleLB.numberOfLines = 0;
        [self addSubview:_TitleLB];
    }
    return _TitleLB;
}
-(UILabel *)AverageB
{
    if (!_AverageB) {
        _AverageB = [UILabel new];
        [self addSubview:_AverageB];
    }
    return _AverageB;
}
-(UILabel *)LearningLB
{
    if (!_LearningLB) {
        _LearningLB = [UILabel new];
        _LearningLB.font = [UIFont systemFontOfSize:14];
        [self addSubview:_LearningLB];
    }
    return _LearningLB;
}
-(void)setCmodel:(CoCourseModel *)cmodel
{
    _cmodel = cmodel;
    [self HeadImage];
    [self TitleLB];
    [self AverageB];
    [self LearningLB];
    
//    [_HeadImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.xlxt.net%@",_cmodel.Img]]];
//
//    _TitleLB.text = _cmodel.Name;
//    CGSize titleSize = [_cmodel.Name boundingRectWithSize:CGSizeMake(kScreenW*2/3.5, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
//    _TitleLB.frame = CGRectMake(kScreenW/3.5+25, 10, titleSize.width, titleSize.height);
    
    
    
    
    // _timeAndHit.text = [NSString stringWithFormat:@"▶️%d  🕛👍%@",_ACellModel.Hits,[self timeFormatted:_ACellModel.TimeLength]];
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] init];
    //NSTextAttachment可以将要插入的图片作为特殊字符处理
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    for (int i = 0; i<_cmodel.Average; i++) {
        //定义图片内容及位置和大小
        attch.image = [UIImage imageNamed:@"x"];
        attch.bounds = CGRectMake(i*14-50, 10, 14, 14);
        //创建带有图片的富文本
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        [attri appendAttributedString:string];
   
    }
//    _AverageB.frame = CGRectMake(kScreenW/3.5+25, titleSize.height+15, 220, 20);
//    _AverageB.attributedText =attri;
//    
//    _LearningLB.text =[NSString stringWithFormat:@"%d人学过",_cmodel.SaleAmount];
//    _LearningLB.frame=CGRectMake(kScreenW/3.5+25, titleSize.height+30, 220, 20);

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
