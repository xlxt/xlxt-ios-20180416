//
//  CourseHeadView.m
//  xlxt
//
//  Created by xlky on 2017/4/10.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CourseHeadView.h"

@implementation CourseHeadView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self Cline];
        [self Ctitle];
        [self Cmore];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(UIView *)Cline
{
    if (!_Cline) {
        _Cline = [[UIView alloc]initWithFrame:CGRectMake(kMargin, 5, 5, self.frame.size.height-10)];
        _Cline.backgroundColor = HeaderGreen;
        [self addSubview:_Cline];
    }
    return _Cline;
}
-(UILabel *)Ctitle
{
    if (!_Ctitle) {
        
        [self Cmore];
        _Ctitle = [[UILabel alloc]initWithFrame:CGRectMake(15+kMargin, 3, self.frame.size.width/3, self.frame.size.height)];
        _Ctitle.font = [UIFont systemFontOfSize:15];
        [self addSubview:_Ctitle];
    }
    return _Ctitle;
}

-(UIButton *)Cmore
{
    if (!_Cmore) {
        _Cmore = [UIButton buttonWithType:UIButtonTypeCustom];
        _Cmore.frame = CGRectMake(kScreenW*5/6, 3, self.frame.size.width/6, self.frame.size.height-6);
        [self addSubview:_Cmore];
        [_Cmore setTitle:@"更多>>" forState:UIControlStateNormal];
        _Cmore.titleLabel.font = [UIFont systemFontOfSize:14];
        [_Cmore setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_Cmore addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _Cmore;
}

-(void)Click:(UIButton *)more
{
    
    self.block(more.tag);
}

@end
