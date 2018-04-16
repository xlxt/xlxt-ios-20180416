//
//  ArvertisementCell.m
//  xlxt
//
//  Created by xlky on 2018/4/4.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "ArvertisementCell.h"

@implementation ArvertisementCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = WhiteColor;
        [self imageview];
    }
    return self;
}

-(UIImageView *)imageview
{
    if (!_imageview) {
        _imageview = [UIImageView new];
        _imageview.image = [UIImage imageNamed:@"广告位占位图@2x"];
        [self addSubview:_imageview];
        
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.mas_equalTo(0);
        }];
        
    }
    return _imageview;
}
@end
