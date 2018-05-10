//
//  L_ServiceHeaderReusableView.m
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import "HeaderReusableView.h"

@implementation HeaderReusableView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = COLORA(246,249,250, 1);

        self.lineview = [[UIView alloc]initWithFrame:CGRectMake(12, 5, 4, 20)];
        self.lineview.backgroundColor = COLOR(103, 173, 72);
        [self addSubview:self.lineview];
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(27, 6.5, 120, 18)];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.backgroundColor = ClearColor;
        self.titleLabel.text =@"推荐课程";
        [self addSubview:self.titleLabel];
        
        self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.moreBtn.frame = CGRectMake(kScreenW-60, 8, 56, 13);
        self.moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [self.moreBtn setTitle:@"更多>" forState: UIControlStateNormal];
        [self.moreBtn addTarget:self action:@selector(Btnaction0:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.moreBtn];
        
    }
    return self;
}
-(void)Btnaction0:(UIButton*)btn
{
    [self.delegate push:self.sectiontag];
}


@end
