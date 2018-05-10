//
//  advertmodel.h
//  xlxt
//
//  Created by xlky on 2018/4/23.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface advertmodel : NSObject
@property (nonatomic, copy) NSString *AddTime;
@property (nonatomic, copy) NSString *AppUserID;
@property (nonatomic,assign)NSInteger ArticleClassifyID;
@property (nonatomic, copy) NSString *ArticleID;
@property (nonatomic, copy) NSString *Author;
@property (nonatomic, copy) NSString *Title;
@property (nonatomic,assign)NSInteger IsRecommend;
@end
