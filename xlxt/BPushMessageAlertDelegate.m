//
//  BPushMessageAlertDelegate.m
//  xlxt
//
//  Created by 赵冠骅 on 15/6/27.
//  Copyright (c) 2015年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "BPushMessageAlertDelegate.h"
#import "ViewController.h"

@interface BPushMessageAlertDelegate ()

@property (nonatomic,strong) ViewController *viewController;
    
@end

@implementation BPushMessageAlertDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        if ([self.url length] > 0) {
            // 取得ios系统唯一的全局的广播站 通知中心
            NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
            //设置广播内容
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: self.msg, @"msg", self.url, @"url", nil];
            //将内容封装到广播中 给ios系统发送广播
            [nc postNotificationName:@"BPushLoadURL" object:self userInfo:dict];
        }
    }
}
@end
