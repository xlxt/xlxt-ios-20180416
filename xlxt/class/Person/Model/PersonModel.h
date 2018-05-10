//
//  PersonModel.h
//  xlxt
//
//  Created by xlky on 2018/4/20.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface PersonModel : NSObject
@property (nonatomic, copy) NSNumber *ISYK;
@property (nonatomic, copy) NSString *AppUserID;
@property (nonatomic, copy) NSNumber *Type;
@property (nonatomic, copy) NSString *UpType;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *HeadImg;
@property (nonatomic, copy) NSString *LastLoginTime;
@property (nonatomic, copy) NSNumber *cpStudyTime;
@property (nonatomic, copy) NSNumber *ppicpStudyTime;
@property (nonatomic, copy) NSNumber *tcpStudyTime;
@property (nonatomic, copy) NSNumber *tutorStudyTime;
@property (nonatomic) NSArray *DepartmentID;
@property (nonatomic, copy) NSNumber *CoinCount;
@property (nonatomic, copy) NSNumber *StudyCourse;
@property (nonatomic, copy) NSNumber *ExamNum;
@property (nonatomic) NSArray *Role;
@property (nonatomic, copy) NSNumber *FavoritesNum;
@property (nonatomic, copy) NSNumber *OrderNum;
@end
