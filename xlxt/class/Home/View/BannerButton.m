//
//  BannerButton.m
//  xlxt
//
//  Created by xlky on 2018/4/2.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS //简化宏，mas_** -> **
#import "BannerButton.h"


@implementation BannerButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WhiteColor;
       [self nameLB];
       [self buttonIV];

    }
    
    return self;
}
-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    self.buttonIV.image = [UIImage imageNamed:dic[@"image"]];
    self.nameLB.text = dic[@"name"];
    self.url =dic[@"url"];
}
-(UIImageView *)buttonIV
{
    if (!_buttonIV) {
        WS(weakself);
        _buttonIV = [[UIImageView alloc]init];
        _buttonIV.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_buttonIV];
        [_buttonIV mas_makeConstraints:^(MASConstraintMaker *make) {

                make.left.equalTo(weakself).with.offset(15);
                make.right.equalTo(weakself).with.offset(-15);
                make.top.equalTo(weakself).with.offset(14);
                make.bottom.equalTo(weakself.nameLB).with.offset(-20);


        }];

    }
    return _buttonIV;
}

-(UILabel *)nameLB
{
    if (!_nameLB) {
        _nameLB = [[UILabel alloc]init];
        _nameLB.font = [UIFont systemFontOfSize:11];
        _nameLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLB];
          WS(weakself);
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(11);
            make.left.equalTo(weakself).with.offset(0);
            make.bottom.equalTo(weakself).with.offset(0);
            make.right.equalTo(weakself).with.offset(0);
           

        }];
    }
    return _nameLB;
}
-(void)setMode:(NSInteger)mode
{
    _mode = mode;
     WS(weakself);
    if (self.mode == 0) {
        
    }else if (self.mode == 1){
        [self.buttonIV mas_remakeConstraints:^(MASConstraintMaker *make) {

                make.left.equalTo(weakself).with.offset(12);
                make.right.equalTo(weakself).with.offset(-12);
                make.top.equalTo(weakself).with.offset(9);
                make.bottom.equalTo(weakself.nameLB).with.offset(-12);
        }];
        self.nameLB.font = FontSet(14);

    }

}
@end
