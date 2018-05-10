//
//  LoginModel.m
//  xlxt
//
//  Created by xlky on 2018/4/20.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
-(void)TakeUseridAndkeyWithdestring:(NSString*)destring
{
    NSArray *StrArr = [destring componentsSeparatedByString:@"&"];
    NSArray *StrArr1 = [StrArr[0] componentsSeparatedByString:@"="];
    NSArray *StrArr2 = [StrArr[1] componentsSeparatedByString:@"="];
    NSLog(@"输出key:%@",StrArr[0]);
//    [self saveCookiesWithKey:StrArr[0]];
//    [self addAlertWithTitle:@"登录成功"];
    
    
    NSData *data = [[NSData alloc]initWithBase64EncodedString:StrArr1[1] options:0];
    
    NSString *estring = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    
    NSArray *StrArr3 = [estring componentsSeparatedByString:@"-"];
    [[NSUserDefaults standardUserDefaults] setObject:StrArr3[0] forKey:@"k"];
    [[NSUserDefaults standardUserDefaults] setObject:StrArr2[1] forKey:@"u"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//-(void)saveCookiesWithKey:(NSString*)loginkey {
//    // 创建一个可变字典存放cookie
//    NSMutableDictionary *fromappDict = [NSMutableDictionary dictionary];
//    [fromappDict setObject:@"Key" forKey:NSHTTPCookieName];
//    [fromappDict setObject:loginkey forKey:NSHTTPCookieValue];
//    // kDomain是公司app网址
//  //  [fromappDict setObject:kDomain forKey:NSHTTPCookieDomain];
//   // [fromappDict setObject:kDomain forKey:NSHTTPCookieOriginURL];
//    [fromappDict setObject:@"/" forKey:NSHTTPCookiePath];
//    [fromappDict setObject:@"0" forKey:NSHTTPCookieVersion];
//
//    // 将可变字典转化为cookie
//    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:fromappDict];
//
//    // 获取cookieStorage
//    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//
//    // 存储cookie
//    [cookieStorage setCookie:cookie];
//}
@end
