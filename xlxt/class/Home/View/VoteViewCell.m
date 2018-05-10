//
//  VoteViewCell.m
//  xlxt
//
//  Created by xlky on 2018/4/8.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "VoteViewCell.h"
#import "NSNumber+date.h"
#import "NSAttributedString+TransHtml.h"
#import "FitHeightLabel.h"
@implementation VoteViewCell
FitHeightLabel *flabel;
- (void)awakeFromNib {
    [super awakeFromNib];

    
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"VoteViewCell" owner:self options:nil].lastObject;
        
        self.JoinBtn.layer.cornerRadius = 16.0;
        self.JoinBtn.layer.masksToBounds = YES;
        
        flabel = [[FitHeightLabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.VoteIV.frame), kScreenW-40, 20)];
        flabel.numberOfLines = 0;
        
        [self addSubview:flabel];
        
    }
    return self;
}

-(void)setVModel:(VoteModel *)VModel{
    _VModel = VModel;
    [self.VoteIV setImageURL:[NSURL URLWithString:_VModel.HearderImg]];
    self.Title.text =_VModel.Title;
    self.TimeLabel.text =[NSNumber transferdate:[_VModel.BeginDate substringWithRange:NSMakeRange(6,13)]];
    [self.VoteIV setImageURL:[NSURL URLWithString:MURL(@"/images/Index/imgback.png")]];
    NSString *introduce =  [_VModel.Introduce componentsSeparatedByString:@"【活动名称】"][1];
    NSString *introduce2 =  [introduce componentsSeparatedByString:@"【活动奖励】"][0];
    ;
    NSMutableAttributedString *text1 = [NSAttributedString strToAttriWithStr:[introduce2 filterHTML:introduce2]].mutableCopy;
    NSMutableAttributedString *text2 = [[NSMutableAttributedString alloc] initWithString:@" ＞查看更多"];

    [text2 setTextHighlightRange:NSMakeRange(0, 6)
                          color:[UIColor blueColor]
                   backgroundColor:[UIColor whiteColor]
                         tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                             NSLog(@"查看更多");
                         }];
      [text1 appendAttributedString:text2];
    flabel.attributedText = text1;
   [flabel sethtmlstring:text1 Font:13 LineSpacing:3];
}

@end
