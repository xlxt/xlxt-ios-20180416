//
//  AppDelegate.m
//  xlxt
//
//  Created by 赵冠骅 on 14-3-9.
//  Copyright (c) 2014年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "MTA.h"
#import "MTAConfig.h"
#import "MainTabVC.h"
#import <AlipaySDK/AlipaySDK.h>

/*****百度云推送*****/
#import "BPush.h"
#import "ViewController.h"
#import "BPushMessageAlertDelegate.h"
#define APPID_VALUE           @"58647f17"
@interface AppDelegate ()

@property (nonatomic,strong) ViewController *viewController;
@property (nonatomic,strong) BPushMessageAlertDelegate *myBPushMessageAlertDelegate;

@end

BOOL const IsEnableBPush = true;
NSString* const BPushKey = @"MFcLhwR8ZxmbtfGLh4eaEVRf";
/*****百度云推送*****/

NSString *MTAKey = @"IF269E7AAKFF";

/******************** 微信登录&支付开始 ************************/
#import "WXApi.h"

// 是否启用微信登录&支付
bool const WEIXIN_ISENABLE = true;
// 微信开放平台APPID
NSString const *WEIXIN_APPID = @"wx0b7fdd0f0bd01412";
/******************** 微信登录&支付结束 ************************/

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [MTA startWithAppkey:MTAKey];
    
    /*****百度云推送*****/
    if (IsEnableBPush) {
        
        // iOS8 下需要使⽤用新的 API
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            UIUserNotificationType myTypes = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
            
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:myTypes categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        }else {
            UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound;
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myTypes];
        }
        
        #warning 上线 AppStore 时需要修改 pushMode
        // 在 App 启动时注册百度云推送服务，需要提供 Apikey
        [BPush registerChannel:launchOptions apiKey:BPushKey pushMode:BPushModeProduction withFirstAction:nil withSecondAction:nil withCategory:nil useBehaviorTextInput:NO isDebug:NO];
        
        // App 是用户点击推送消息启动
        NSDictionary *userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (userInfo) {
            //NSLog(@"从消息启动:%@",userInfo);
            [BPush handleNotification:userInfo];
            
        }
        
        //角标清0
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    }
    /*****百度云推送*****/
    
    /******************** 微信登录&支付开始 ************************/
    if (WEIXIN_ISENABLE) {
        [WXApi registerApp:WEIXIN_APPID];
    }
    /******************** 微信登录&支付结束 ************************/
    
    //解决横屏下状态栏不显示问题
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
//科大讯飞初始化
    
    //主界面加载
     [self.window makeKeyWindow];
    //接收百度推送传过来的信息
//    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
//    [nc addObserver:self selector:@selector(recvBcastBPushLoadURL:) name:@"BPushLoadURL" object:nil];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    MainTabVC *tabbar = [[MainTabVC alloc] init];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    return YES;
}

/*****百度云推送*****/

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    completionHandler(UIBackgroundFetchResultNewData);
    
    if (application.applicationState == UIApplicationStateActive || application.applicationState == UIApplicationStateBackground) {
        [self dispalyBPushMessage:userInfo];
        
    }else{
        
        [self dispalymessageBPushMessage:userInfo];
        
    }
}

- (void)dispalymessageBPushMessage:(NSDictionary *)userInfo
{
    //解析userInfo，得到消息和URL
    NSString *msg = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    NSString *url = [userInfo objectForKey:@"url"];
    
    self.myBPushMessageAlertDelegate = [BPushMessageAlertDelegate alloc];
    self.myBPushMessageAlertDelegate.msg = msg;
    self.myBPushMessageAlertDelegate.url = url;
    
    if ([msg length] > 0) {
        UIAlertView* mAlert;
        if ([url length] > 0) {
            NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
            //设置广播内容
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: msg, @"msg", url, @"url", nil];
            //将内容封装到广播中 给ios系统发送广播
            [nc postNotificationName:@"BPushLoadURL" object:self userInfo:dict];
        }
        else {
            mAlert = [[UIAlertView alloc] initWithTitle:@"通知" message:msg delegate:self.myBPushMessageAlertDelegate cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
            
            [mAlert show];
        }
        
    }
}

// 在 iOS8 系统中，还需要添加这个方法。通过新的 API 注册推送服务
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //NSLog(@"开始绑定Push服务，DeviceToken：%@",deviceToken);
    [BPush registerDeviceToken:deviceToken];
    
    [self BPushBind];
}

// 当 DeviceToken 获取失败时，系统会回调此方法
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"DeviceToken获取失败，原因：%@",error);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // App 收到推送的通知
    [BPush handleNotification:userInfo];
    
    //NSLog(@"(点击消息后)接收到通知：\n%@",userInfo);
    
}

- (void)BPushBind
{
    //绑定
    [BPush bindChannelWithCompleteHandler:^(id result, NSError *error) {
        
        //获取标签，如果不为空，则先全部删除，删除成功后再添加新标签；为空则直接添加新标签
        [BPush listTagsWithCompleteHandler:^(id result, NSError *error) {
            if ([[result objectForKey:BPushRequestErrorCodeKey] isEqualToString:@"0"]) {
                NSDictionary *params = [result objectForKey:@"response_params"];
                int tagnum = [[params objectForKey:@"tag_num"] intValue];
                if (tagnum > 0) {
                    NSMutableArray *tags = [NSMutableArray arrayWithCapacity:2];
                    for (NSDictionary *paramstags in [params objectForKey:@"tags"]) {
                        NSString *tag = [paramstags objectForKey:@"name"];
                        [tags addObject:tag];
                    }
                    
                    //NSLog(@"获得Tages成功，Tags：%@",tags);
                    if (tags) {
                        //删除标签，重新添加标签
                        [BPush delTags:tags withCompleteHandler:^(id result, NSError *error) {
                            if ([[result objectForKey:BPushRequestErrorCodeKey] isEqualToString:@"0"]) {
                                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                                NSString *tag = [userDefaults objectForKey:@"memberid"];
                                if ([tag length] > 0) {
                                    //NSLog(@"开始设置标签：%@",tag);
                                    [BPush setTag:tag withCompleteHandler:^(id result, NSError *error) {
                                        
                                    }];
                                }
                            }
                        }];
                    }
                }
                else {
                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                    NSString *tag = [userDefaults objectForKey:@"memberid"];
                    if ([tag length] > 0) {
                        //NSLog(@"开始设置标签：%@",tag);
                        [BPush setTag:tag withCompleteHandler:^(id result, NSError *error) {
                            
                        }];
                    }
                }
            }
        }];
    }];
}

- (void)dispalyBPushMessage:(NSDictionary *)userInfo
{
    //解析userInfo，得到消息和URL
    NSString *msg = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
    NSString *url = [userInfo objectForKey:@"url"];
    
    self.myBPushMessageAlertDelegate = [BPushMessageAlertDelegate alloc];
    self.myBPushMessageAlertDelegate.msg = msg;
    self.myBPushMessageAlertDelegate.url = url;
    
    if ([msg length] > 0) {
        UIAlertView* mAlert;
        if ([url length] > 0) {
            mAlert = [[UIAlertView alloc] initWithTitle:@"通知" message:msg delegate:self.myBPushMessageAlertDelegate cancelButtonTitle:@"关闭" otherButtonTitles:@"查看", nil];
        }
        else {
            mAlert = [[UIAlertView alloc] initWithTitle:@"通知" message:msg delegate:self.myBPushMessageAlertDelegate cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        }
        [mAlert show];
    }
}


/*****百度云推送*****/

/******************** 微信登录&支付开始 ************************/
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{    
    //微信支付
    if ([[url host] isEqualToString:@"pay"]||[[url host] isEqualToString:@"oauth"]) {
        BOOL isSuc = [WXApi handleOpenURL:url delegate:self];
        //NSLog(@"url %@ isSuc %d",url,isSuc == YES ? 1 : 0);
        return  isSuc;
    }
    //支付宝支付
    else if ([[url host] isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //NSLog(@"result = %@",resultDic);
        }];
        
        return YES;
    }
    else{
        return false;
    }
}

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendAuthResp class]]){
        NSString *WEIXINLOGINCODE = @"";
        if(resp.errCode == 0){
            SendAuthResp *authresp = (SendAuthResp*)resp;
            WEIXINLOGINCODE = authresp.code;
            
            if ([WEIXINLOGINCODE length] > 0) {
                // 取得ios系统唯一的全局的广播站 通知中心
                NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
                //设置广播内容
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: WEIXINLOGINCODE, @"code", nil];
                //将内容封装到广播中 给ios系统发送广播
                [nc postNotificationName:@"WEIXINLOGINCODE" object:self userInfo:dict];
            }
        }
    }
    
    if([resp isKindOfClass:[PayResp class]]){
        NSString *WEIXINPAYCODE = @"";
        PayResp *payresp = (PayResp*)resp;
        WEIXINPAYCODE = [NSString stringWithFormat:@"%d", payresp.errCode];
        
        if ([WEIXINPAYCODE length] > 0) {
            // 取得ios系统唯一的全局的广播站 通知中心
            NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
            //设置广播内容
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: WEIXINPAYCODE, @"code", nil];
            //将内容封装到广播中 给ios系统发送广播
            [nc postNotificationName:@"WEIXINPAYCODE" object:self userInfo:dict];
        }
    }
}
/******************** 微信登录&支付结束 ************************/

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
