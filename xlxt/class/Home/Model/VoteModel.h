//
//  VoteModel.h
//  xlxt
//
//  Created by xlky on 2018/5/3.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoteModel : NSObject
@property (nonatomic,assign)NSInteger VoteID;
@property (nonatomic)NSString *Title;
@property (nonatomic)NSString *Introduce;
@property (nonatomic)NSString *HearderImg;
@property (nonatomic)NSString *AddDate;
@property (nonatomic)NSString *BeginDate;
@property (nonatomic)NSString *EndDate;
@property (nonatomic,assign)NSInteger EnableCount;
@property (nonatomic,assign)NSInteger State;
@property (nonatomic,assign)NSInteger ReadNum;
@property (nonatomic,assign)NSInteger TotalPerson;
@property (nonatomic,assign)NSInteger AttentionNum;
@property (nonatomic)NSString *UserID;
@property (nonatomic)NSString *User;
@property (nonatomic)NSString *IsComment;
@property (nonatomic)NSString *Weight;
@property (nonatomic)NSString *Sort;
@end
