//
//  CircleImageView.m
//  xlxt
//
//  Created by xlky on 2018/3/22.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView
-(instancetype)initWithFrame:(CGRect)frame AndUrl:(NSString*)imageUrl{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setImageURL:[NSURL URLWithString:imageUrl]];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                       byRoundingCorners:UIRectCornerAllCorners
                                                             cornerRadii:CGSizeMake(self.frame.size.width/2, 1)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
    
    return self;
}



@end
