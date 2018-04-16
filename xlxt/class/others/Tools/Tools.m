//
//  Tools.m
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(void)SWitchCallbackTrues:(trueCallBack)tcallback Falses:(falseCallBack)fcallback
{
  static int tag = 0;

    if (tag == 0) {
        tcallback();
        tag = 1;
    }else{
        fcallback();
        tag = 0;
    }
}
@end
