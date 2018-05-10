//
//  DetailCell.m
//  xlxt
//
//  Created by xlky on 2017/3/14.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
#define kWidth   280
#define kLabelMarginTop  10
#import "DetailCell.h"
#import "NSAttributedString+TransHtml.h"
@implementation DetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {

        [self addSubview:self.contentLabel];
        
    }
    return self;
}

-(void)setLBtest:(NSString *)text AndLBheight:(CGFloat)height
{
    _contentLabel.frame = CGRectMake(15, 10, kScreenW-30, height+40);
   // _contentLabel.text = text;

    _contentLabel.attributedText =[NSAttributedString strToAttriWithStr:text];
    _contentLabel.font = [UIFont systemFontOfSize:13];
    
}

-(YYLabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [YYLabel new];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:10];
    }
    return _contentLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
