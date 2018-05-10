//
//  bannerModel.h
//  xlxt
//
//  Created by xlky on 2018/4/23.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ADPosition;
@interface bannerModel : NSObject
@property (nonatomic, assign) NSInteger ADID;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, assign) NSInteger ADPositionID;
@property (nonatomic) ADPosition *ADPosition;
@property (nonatomic, copy) NSString *ImgUrl;
@property (nonatomic, copy) NSString *ADUrl;
@property (nonatomic, copy) NSString *StartDate;
@property (nonatomic, copy) NSString *EndDate;
@property (nonatomic, assign) NSInteger Sort;
@property (nonatomic, assign) NSInteger IsEnable;
@property (nonatomic, assign) NSInteger BrowseNum;
@property (nonatomic, assign) NSInteger ClickNum;
@end
@interface ADPosition : NSObject
@property (nonatomic, assign) NSInteger ADPositionID;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, copy) NSString *PositionCode;
@property (nonatomic, assign) NSInteger ADChannelID;
@property (nonatomic, copy) NSString *ADChannel;
@property (nonatomic, assign) NSInteger IsEnable;
@property (nonatomic, assign) NSInteger Width;
@property (nonatomic, assign) NSInteger Height;
@end
