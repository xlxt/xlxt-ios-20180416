//
//  PCView.m
//  xlxt
//
//  Created by xlky on 2017/7/7.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "PCView.h"
#import "NSNumber+date.h"
@implementation PCView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:(CGRect)frame]) {
        self.backgroundColor = navigationbar;
        [self headerimage];
        [self name];
        [self core];
        [self coursecount];
        [self totaltime];
        
    }
    return self;
    
}
-(CircleImageView *)headerimage
{
    if (!_headerimage) {
        _headerimage = [[CircleImageView alloc]initWithFrame:CGRectMake(0, 5, 80, 80) AndUrl:@""];
        _headerimage.centerX = self.centerX;
        _headerimage.backgroundColor = GrayColor;
        [self addSubview:_headerimage];

        
    }
    return _headerimage;
}
-(UILabel *)name
{
    if (!_name) {
        _name = [[UILabel alloc]initWithFrame:CGRectMake(0, 102, 80, 17)];
        _name.font = FontSet(17);
        _name.textColor = WhiteColor;
        _name.text = @"胡八一";
        _name.textAlignment = NSTextAlignmentCenter;
        _name.centerX = self.centerX;
         [self addSubview:_name];
    }
    return _name;
}

-(FitHeightLabel *)core
{
    if (!_core) {
        _core = [[FitHeightLabel alloc]initWithFrame:CGRectMake(0, 135, kScreenW/3, 60)];
        _core.textAlignment = NSTextAlignmentCenter;
        _core.font = FontSet(15);
        _core.numberOfLines = 0;
        _core.textColor = WhiteColor;
        _core.text = @"1265\n\n总积分";
        [self addSubview:_core];
    }
    return _core;
}
-(FitHeightLabel *)coursecount
{
    if (!_coursecount) {
        _coursecount = [[FitHeightLabel alloc]initWithFrame:CGRectMake(kScreenW/3, 135, kScreenW/3, 60)];
         _coursecount.textAlignment = NSTextAlignmentCenter;
        _coursecount.font = FontSet(15);
        _coursecount.numberOfLines = 0;
        _coursecount.textColor = WhiteColor;
        _coursecount.text= @"5\n\n课程数";
        [self addSubview:_coursecount];
    }
    return _coursecount;
}
-(FitHeightLabel *)totaltime
{
    if (!_totaltime) {
        _totaltime = [[FitHeightLabel alloc]initWithFrame:CGRectMake(kScreenW/3*2, 135, kScreenW/3, 60)];
        _totaltime.textAlignment = NSTextAlignmentCenter;
        _totaltime.font = FontSet(15);
        _totaltime.numberOfLines = 0;
        _totaltime.textColor = WhiteColor;
        _totaltime.text =@"01：50\n\n总课时";
        [self addSubview:_totaltime];
    }
    return _totaltime;
}


-(void)setDataDic:(PersonModel *)DataDic
{
    _DataDic = DataDic;
    
    self.coursecount.attributedText =[self transferAttri:[NSString stringWithFormat:@"%@\n课程数",_DataDic.StudyCourse]];
    self.core.attributedText =  [self transferAttri:[NSString stringWithFormat:@"%@\n总积分",_DataDic.CoinCount]];
    self.totaltime.attributedText =[self transferAttri:[NSString stringWithFormat:@"%@\n课程数",[NSNumber transfersecond:[_DataDic.cpStudyTime intValue]]]];
    self.name.text = _DataDic.Name;
    self.headerimage.url = ImgUrl(_DataDic.HeadImg);
    
}
-(NSMutableAttributedString*)transferAttri:(NSString *)str
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    attributedString.color = WhiteColor;
    attributedString.font = FontSet(16);
    // 设置文字居中
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [paragraphStyle setLineSpacing:10];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];

    return attributedString;
}
@end
