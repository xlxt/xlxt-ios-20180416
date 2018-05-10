//
//  NSAttributedString+TransHtml.m
//  xlxt
//
//  Created by xlky on 2017/3/15.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "NSAttributedString+TransHtml.h"

@implementation NSAttributedString (TransHtml)
+ (NSAttributedString *)strToAttriWithStr:(NSString *)htmlStr{
    
    NSData *data = [htmlStr dataUsingEncoding:NSUnicodeStringEncoding];
    
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    
    NSAttributedString *html = [[NSAttributedString alloc]initWithData:data
                                
                                                               options:options
                                
                                                    documentAttributes:nil
                                
             
                                                                 error:nil];
    return html;
}

+(NSAttributedString*)ChangeColor:(UIColor *)color AtRange:(NSRange)range String:(NSString*)string
{
    
    
    NSMutableAttributedString *attrDescribeStr = [[NSMutableAttributedString alloc] initWithString:string];
    
    [attrDescribeStr addAttribute:NSForegroundColorAttributeName
     
                            value:color
     
                            range:range];

    return attrDescribeStr;
}
@end
