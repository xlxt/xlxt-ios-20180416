//
//  ChronicHeaderview.m
//  xlxt
//
//  Created by xlky on 2018/4/28.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "ChronicHeaderview.h"

@implementation ChronicHeaderview
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    //    CataModel*cmodel = [CataModel new];
     // self.titleArray = [NSMutableArray arrayWithObjects:cmodel,cmodel,cmodel,cmodel,cmodel, nil];
        [self headerview];
        [self titlelb];
    }
      return self;
        
}
-(UIImageView *)headerview
{
    if (!_headerview) {
        _headerview = [UIImageView new];
        [_headerview setImageURL:@"https://m.xlxt.net/images/Banner/banner3.jpg"];
        [self addSubview:_headerview];
        [ _headerview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self);
            make.height.mas_equalTo(kScreenW*4.7/10);
      }];
    }
    return _headerview;
}
-(void)setTitleArray:(NSMutableArray *)titleArray
{
    _titleArray = titleArray;
    if (_titleArray.count>0) {
        [self BtnArray];
    }

}
- (NSMutableArray *)BtnArray {
    if (!_BtnArray) {

        _BtnArray = [NSMutableArray array];
        for (CataModel*cmodel in self.titleArray) {
            _bannerbtn = [BannerButton new];
            _bannerbtn.mode = 1;
            [_bannerbtn.buttonIV setImageWithURL:[NSURL URLWithString:ImgUrl(cmodel.Img)] placeholder:[UIImage imageNamed:cmodel.Name]];
            _bannerbtn.tag =cmodel.ClassifyID;
            _bannerbtn.nameLB.text = cmodel.Name;
            
            [_bannerbtn addTarget:self action:@selector(catagory:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_bannerbtn];
            [_BtnArray addObject:_bannerbtn];
        }
        
        [_BtnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        
        // 设置array的垂直方向的约束
        [_BtnArray mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(kScreenW*4.7/10);
            make.bottom.mas_equalTo(-25);
        }];
    }

    return _BtnArray;
}


-(ImTxLabel *)titlelb
{
    if (!_titlelb) {
        _titlelb = [[ImTxLabel alloc]initWithFrame:CGRectMake(10, 10, kScreenW, 17)];
        [_titlelb SetImageFont:14 TextFont:14 imageoffset:14 lineSpace:0 color:BlackColor];
        [self addSubview:_titlelb];
        [_titlelb SetImage:@"grennf" setText:@"糖尿病视频课程"];
        [_titlelb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(10);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(15);
        }];
        
    }
    return _titlelb;
}

-(void)catagory:(BannerButton*)btn{
    [_titlelb SetImage:@"grennf" setText:[NSString stringWithFormat:@"%@视频课程",btn.nameLB.text]];
    [self.delegate Refresh:btn.tag];
}
        
@end
