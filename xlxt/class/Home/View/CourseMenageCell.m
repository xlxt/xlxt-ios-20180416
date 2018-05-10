//
//  CourseMenageCell.m
//  xlxt
//
//  Created by xlky on 2018/4/27.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CourseMenageCell.h"

@implementation CourseMenageCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self)
    {
        [self vline];
        [self hline];
        [self titleLB];
        
    }
    return self;
}

-(UIView *)vline
{
    if(!_vline){
        _vline = [UIView new];
        _vline.backgroundColor =COLOR(227, 232, 239);
        [self addSubview:_vline];

    }
    [_vline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1);
        make.top.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);

    }];
    return _vline;
}

-(UIView *)hline
{
    if (!_hline) {
        _hline = [UIView new];
        _hline.backgroundColor =COLOR(227, 232, 239);
        [self addSubview:_hline];
        [_hline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(0);
            make.left.right.mas_equalTo(self);
        }];
    }
    


    return _hline;
}

-(ImTxLabel *)titleLB
{
    if (!_titleLB) {
        _titleLB = [[ImTxLabel alloc]initWithFrame:CGRectMake(10, 10, 90, 15)];
        [_titleLB SetImageFont:15 TextFont:13 imageoffset:13 lineSpace:0 color:BlackColor];
        _titleLB.attrifont = 13;
        [self addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(16);
            make.center.mas_equalTo(self);
        }];
    }
    return _titleLB;
}

-(void)setCDataDic:(NSDictionary *)CDataDic
{
    CDataDic = CDataDic;
    
//    self.CMIV.image = [UIImage imageNamed:CDataDic[@"ImageName"]];
//    self.CMTitle.text =CDataDic[@"name"];
    
    [self.titleLB SetImage:CDataDic[@"ImageName"] setText:[NSString stringWithFormat:@"  %@",CDataDic[@"name"]]];
    
}
-(void)setIndex:(NSInteger)index
{
    _index =index;
    if (_index == 0||_index == 1) {
           self.hline.hidden = YES;
    }else{
            self.hline.hidden = NO;
    }
    
    if (_index%2!=0) {
        
         self.vline.hidden = NO;
        
    }else{
        
         self.vline.hidden = YES;
    }
}

@end
