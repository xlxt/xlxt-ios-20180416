//
//  NSAttributedString+TransHtml.h
//  xlxt
//
//  Created by xlky on 2017/3/15.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (TransHtml)
+(NSAttributedString *)strToAttriWithStr:(NSString *)htmlStr;
+(NSAttributedString*)ChangeColor:(UIColor *)color AtRange:(NSRange)range String:(NSString*)string;
@end
