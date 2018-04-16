//
//  FitHeightLabel.m
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "FitHeightLabel.h"

@implementation FitHeightLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        w = frame.size.width;
        h = frame.size.height;
    }
    return self;
}
-(void)SetTextAndGetHeight:(NSString *)mess Font:(CGFloat)font LineSpacing:(CGFloat)space
{
    self.introText = [[NSMutableAttributedString alloc] initWithString:mess];
    self.introText.font =FontSet(font);
    self.introText.color = BlackColor;
    self.introText.lineSpacing = space;
    self.attributedText = self.introText;
    CGSize introSize = CGSizeMake(w-10, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:introSize text:self.introText];
    self.textLayout = layout;
    CGFloat introHeight = layout.textBoundingSize.height;
    
    [self setHeight:introHeight+h];
}

@end
