//
//  CourseListCell.m
//  xlxt
//
//  Created by xlky on 2017/3/3.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CourseListCell.h"

@implementation CourseListCell


-(void)setDatadic:(NSDictionary *)Datadic
{

    
    _Datadic = Datadic;
    
    
    self.lmodel=[ListModel modelWithDictionary:_Datadic];

    [self.iv setImageWithURL:urlFormat(ImgUrl(self.lmodel.Img)) placeholder:[UIImage imageNamed:@""]];
    _titleLb.text =self.lmodel.Name;
    
    NSString * substr = [NSString stringWithFormat:@"%ld|%ld人浏览",self.lmodel.Price,self.lmodel.BrowseNum];
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:substr];
    
 //   [attri addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:179/255.f green:64/255.f blue:58/255.f alpha:1] range:nil];
    attri.color = [UIColor colorWithRed:179/255.f green:64/255.f blue:58/255.f alpha:1];
    attri.font = [UIFont systemFontOfSize:13];
    // 添加表情
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:@"coin"];
    // 设置图片大小
    attch.bounds = CGRectMake(0, -2, 13, 13);
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
//    [attri appendAttributedString:string];
    [attri insertAttributedString:string atIndex:0];
    // 用label的attributedText属性来使用富文本
    self.subtitleLb.attributedText = attri;
    
}


 
 -(UIImageView *)iv
 {
 
 if (!_iv) {
 
 _iv = [UIImageView new];
 [self addSubview:_iv];
 
 [_iv mas_makeConstraints:^(MASConstraintMaker *make) {
 
 make.left.top.bottom.mas_equalTo(kScreenW/25);
   make.bottom.mas_equalTo(-kScreenW/25);
     make.width.mas_equalTo(kScreenW/3);
 
 }];
 
 }
 return _iv;
 }


-(UILabel *)titleLb
{
    if (!_titleLb) {
    _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
        _titleLb.numberOfLines = 0;
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kScreenW/3 + kScreenW/15);
            make.top.mas_equalTo(_iv.top);
            make.height.mas_equalTo(kScreenH/15);
            make.width.mas_equalTo(kScreenW/1.8);
            
        }];
        
        
    }
    return _titleLb;
}

-(UILabel *)subtitleLb
{
    if (!_subtitleLb) {
        _subtitleLb = [UILabel new];

        [self addSubview:_subtitleLb];
        
        [_subtitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kScreenW/3 + kScreenW/15);
            make.top.mas_equalTo(_titleLb.height+25);
            make.height.mas_equalTo(kScreenH/15);
            make.width.mas_equalTo(kScreenW/1.8);
        }];
    }
    return _subtitleLb;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self iv];
        [self titleLb];
        [self subtitleLb]; 
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
