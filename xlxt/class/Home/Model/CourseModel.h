//
//  CourseModel.h
//  xlxt
//
//  Created by xlky on 2018/5/2.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseModel : NSObject
@property (nonatomic, assign) NSInteger CourseID;
@property (nonatomic, assign) NSInteger Sort;
@property (nonatomic, copy) NSString *TryUrl;
@property (nonatomic, assign) NSInteger CourseTypeID;
@property (nonatomic, copy) NSString *Img;
@property (nonatomic, assign) NSInteger BrowseNum;
@property (nonatomic, assign) NSInteger ReviewAvg;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, assign) NSInteger IsAudit;
@property (nonatomic, assign) NSInteger IsEnable;
@property (nonatomic, assign) NSInteger IsOpen;
@property (nonatomic, copy) NSString *AuthorName;
@property (nonatomic, copy) NSString *Introduce;
@property (nonatomic, assign) NSInteger Price;
@property (nonatomic, copy) NSString *AppUserID;
@property (nonatomic, copy) NSString *AppUser;
@property (nonatomic, assign) NSInteger TotalTime;
@property (nonatomic, copy) NSString *BaofengFileName;
@property (nonatomic, copy) NSString *BaofengFileUrl;
@end
