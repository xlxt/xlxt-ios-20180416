//
//  ListModel.h
//  xlxt
//
//  Created by xlky on 2018/5/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject
@property (nonatomic)NSString *AppUserID;
@property (nonatomic)NSString *AddTime;
@property (nonatomic,assign)NSInteger CourseID;
@property (nonatomic)NSString *Img;
@property (nonatomic)NSString *Name;
@property (nonatomic,assign)NSInteger BrowseNum;
@property (nonatomic,assign)NSInteger ReviewAvg;
@property (nonatomic,assign)NSInteger Price;
@property (nonatomic)NSString *Source;
@end
