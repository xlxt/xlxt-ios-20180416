//
//  NSNumber+date.m
//  xlxt
//
//  Created by xlky on 2018/4/20.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "NSNumber+date.h"

@implementation NSNumber (date)
+(NSString*)transferdate:(NSString *)timeStampString
{
    // timeStampString 是服务器返回的13位时间戳
    
    // iOS 生成的时间戳是10位
    NSTimeInterval interval=[timeStampString doubleValue] / 1000.0;
    NSDate *date= [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate: date];
  
    return dateString;
}

+(NSString*)transfersecond:(int)timeStampString
{
    int hour = timeStampString/3600;
    int minute = (timeStampString/60) % 60;
    int second = timeStampString%60;
    NSString *timestring = [NSString stringWithFormat:@"%02d:%02d:%02d",hour,minute,second];
    return timestring;
}
@end
