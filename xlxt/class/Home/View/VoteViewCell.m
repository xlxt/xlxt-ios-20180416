//
//  VoteViewCell.m
//  xlxt
//
//  Created by xlky on 2018/4/8.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "VoteViewCell.h"

@implementation VoteViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"VoteViewCell" owner:self options:nil].lastObject;

//        self.backgroundView.layer.shadowOffset=CGSizeMake(0,0);//往x方向偏移0，y方向偏移0
//
//        self.backgroundView.layer.shadowOpacity=0.3;//设置阴影透明度
//
//        self.backgroundView.layer.shadowColor= navigationbar.CGColor;//设置阴影颜色
//
//        self.backgroundView.layer.shadowRadius=8;//设置阴影半径
    }
    return self;
}
@end
