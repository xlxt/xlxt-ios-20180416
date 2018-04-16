//
//  Tools.h
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^trueCallBack)();
typedef void (^falseCallBack)();
@interface Tools : NSObject

+(void)SWitchCallbackTrues:(trueCallBack)tcallback Falses:(falseCallBack)fcallback;
@end
