//
//  UIView+AddShadow.h
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AddShadow)
-(void)AddShadowWithview:(UIView *)view color:(UIColor *)color shadowOffset :(CGSize)offset shadowRadius:(CGFloat)shadowRadius shadowOpacity:(CGFloat)shadowOpacity;
@end
