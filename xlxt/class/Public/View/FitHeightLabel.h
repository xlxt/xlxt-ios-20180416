//
//  FitHeightLabel.h
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <YYKit/YYKit.h>

@interface FitHeightLabel : YYLabel
{
    CGFloat w;
    CGFloat h;
}
@property(nonatomic,strong)NSMutableAttributedString *introText;
-(void)SetTextAndGetHeight:(NSString *)mess Font:(CGFloat)font LineSpacing:(CGFloat)space;
@end
