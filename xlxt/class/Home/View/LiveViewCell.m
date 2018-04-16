//
//  LiveViewCell.m
//  xlxt
//
//  Created by xlky on 2018/4/4.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "LiveViewCell.h"

@implementation LiveViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"LiveViewCell" owner:self options:nil].lastObject;
    }
    return self;
}
@end
