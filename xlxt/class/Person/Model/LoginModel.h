//
//  LoginModel.h
//  xlxt
//
//  Created by xlky on 2018/4/20.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject
@property (nonatomic, copy) NSArray *appList;
@property (nonatomic, copy) NSString *error;
@property (nonatomic, copy) NSString *url;
-(void)TakeUseridAndkeyWithdestring:(NSString*)destring;
@end
