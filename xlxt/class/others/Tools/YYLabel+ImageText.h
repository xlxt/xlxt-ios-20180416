//
//  YYLabel+ImageText.h
//  xlxt
//
//  Created by xlky on 2018/3/22.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <YYKit/YYKit.h>

@interface YYLabel (ImageText)
-(NSMutableAttributedString *)insertImage:(NSArray<NSDictionary*>*)imageArr AtFrame:(CGRect)frame String:(NSString*)string;
@end