//
//  UIView+AddShadow.m
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "UIView+AddShadow.h"

@implementation UIView (AddShadow)
-(void)AddShadowWithview:(UIView *)view color:(UIColor *)color shadowOffset :(CGSize)offset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity
{
    view.layer.shadowColor =color.CGColor;//设置阴影颜色;
    view.layer.shadowOffset = offset;
    view.layer.shadowRadius = shadowRadius;
    view.layer.shadowOpacity = shadowOpacity;
    view.layer.masksToBounds = NO;
    view.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:view.layer.cornerRadius].CGPath;
}
@end
