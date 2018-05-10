//
//  AudioModel.h
//  xlxt
//
//  Created by xlky on 2018/5/3.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class course;
@interface AudioModel : NSObject
@property(nonatomic)course *course;
@property(nonatomic,copy)NSString *source;
@end

@interface course : NSObject
@property(assign)NSInteger CourseID;
@property(assign)NSInteger Sort;
@property(nonatomic,copy)NSString *TryUrl;
@property(assign)NSInteger CourseTypeID;
@property(nonatomic,copy)NSString *Img;
@property(assign)NSInteger BrowseNum;
@property(assign)NSInteger ReviewAvg;
@property(nonatomic,copy)NSString *Name;
@property(assign)NSInteger IsAudit;
@property(assign)NSInteger IsEnable;
@property(assign)NSInteger IsOpen;
@property(nonatomic,copy)NSString *AuthorName;
@property(nonatomic,copy)NSString *Introduce;
@property(assign)NSInteger Price;
@property(nonatomic,copy)NSString *AppUserID;
@property(nonatomic,copy)NSString *AppUser;
@property(assign)NSInteger TotalTime;
@property(nonatomic,copy)NSString *AddTime;
@property(nonatomic,copy)NSString *BaofengFileName;
@property(nonatomic,copy)NSString *BaofengFileUrl;
@end
