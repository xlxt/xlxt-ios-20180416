//
//  BPushMessageAlertDelegate.h
//  xlxt
//
//  Created by 赵冠骅 on 15/6/27.
//  Copyright (c) 2015年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPushMessageAlertDelegate : UIViewController<UIAlertViewDelegate>
    @property (nonatomic) NSString *msg;
    @property (nonatomic) NSString *url;
    @property (strong, nonatomic) UIWindow *window;
@end