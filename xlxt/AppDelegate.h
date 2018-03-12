//
//  AppDelegate.h
//  xlxt
//
//  Created by 赵冠骅 on 14-3-9.
//  Copyright (c) 2014年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPushMessageAlertDelegate.h"
#import "WXApi.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)BPushBind;

@end

extern BOOL const IsEnableBPush;
extern NSString* const BPushKey;

extern bool const WEIXIN_ISENABLE;
extern NSString const *WEIXIN_APPID;