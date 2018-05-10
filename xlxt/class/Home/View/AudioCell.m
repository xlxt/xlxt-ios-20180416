//
//  AudioCell.m
//  xlxt
//
//  Created by xlky on 2017/4/6.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "AudioCell.h"
#import "AudioModel.h"
#import "NSNumber+date.h"
@implementation AudioCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(UIImageView *)courseIv
{
    if (!_courseIv) {
        _courseIv = [[UIImageView alloc]init];
        _courseIv.layer.cornerRadius = 30.0f;
        _courseIv.clipsToBounds = YES;
        [self addSubview:_courseIv];
    }
    return _courseIv;
}
-(UIImageView *)PlayIV
{
    if (!_PlayIV) {
        _PlayIV = [[UIImageView alloc]init];
        _PlayIV.image = [UIImage imageNamed:@"AudioPlay"];
        _PlayIV.layer.cornerRadius = 30.0f;
        _PlayIV.clipsToBounds = YES;
        [self addSubview:_PlayIV];
    }
    return _PlayIV;
}

-(UILabel *)Coursetitle
{
    if (!_Coursetitle) {
        _Coursetitle = [UILabel new];
        _Coursetitle.font = [UIFont systemFontOfSize:17];
        
        _Coursetitle.numberOfLines = 0;

         [self addSubview:_Coursetitle];
    }
    return _Coursetitle;
}


-(ImTxLabel *)timeAndHit
{
    if (!_timeAndHit) {
        _timeAndHit = [[ImTxLabel alloc] initWithFrame:CGRectMake(70, 70, 300, 0)];
        [_timeAndHit SetImageFont:13 TextFont:13 imageoffset:13 lineSpace:0 color:[UIColor lightGrayColor]];
        _timeAndHit.font = [UIFont systemFontOfSize:12.5];
        [self addSubview:_timeAndHit];
    }
    return _timeAndHit;
}
-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    self.ACellModel = [AudioModel modelWithDictionary:_dic];
    [self.courseIv setImageURL: [NSURL URLWithString:ImgUrl(self.ACellModel.course.Img)]];
    [self.Coursetitle setText:self.ACellModel.course.Name];
   [self.timeAndHit SetImage:@"grayplaybtn" setText:[NSString stringWithFormat:@"  %ld                     %@",self.ACellModel.course.BrowseNum,[NSNumber transferdate:[self.ACellModel.course.AddTime substringWithRange:NSMakeRange(6,13)]]]];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self courseIv];
        [self PlayIV];
        [self Coursetitle];
        [self timeAndHit];
        [self layoutSubview];
    }
    return self;
}
- (void)layoutSubview{
    [self.courseIv mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.left.mas_equalTo(self).offset(kMargin);
        make.height.width.mas_equalTo(60);
     //   make.center.mas_equalTo(self);
    }];
    
    [self.PlayIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(60);
        make.center.mas_equalTo(self.courseIv);
    }];
    [self.Coursetitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-15);
        make.left.equalTo(self.courseIv.mas_right).offset(15);
    }];
    [self.timeAndHit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Coursetitle.mas_bottom).offset(15);
        make.right.equalTo(self).offset(-15);
        make.left.equalTo(self.courseIv.mas_right).offset(15);
        make.bottom.equalTo(self).offset(-15);
    }];
    
}

- (NSString *)timeFormatted:(int)totalSeconds
{
    
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
