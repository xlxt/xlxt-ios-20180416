//
//  SearchView.m
//  xlxt
//
//  Created by xlky on 2018/3/22.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:13];
        self.textColor = [UIColor lightGrayColor];
        self.layer.cornerRadius = 14;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *searchiv = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-26, (frame.size.height-15)/2, 15, 15)];
        
        searchiv.image =[UIImage imageNamed:@"search"];
        [self addSubview:searchiv];
        
    }
    
    return self;
}

@end
