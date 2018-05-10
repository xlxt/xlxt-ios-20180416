//
//  NSNumber+date.h
//  xlxt
//
//  Created by xlky on 2018/4/20.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (date)
+(NSString*)transferdate:(NSString *)timeStampString;
+(NSString*)transfersecond:(int)timeStampString;
@end
