//
//  UniModel.h
//  xlxt
//
//  Created by xlky on 2018/4/23.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UniModel : NSObject
@property (nonatomic, assign) NSInteger EnterpriseID;
@property (nonatomic, copy) NSString *BannerImg;
@property (nonatomic, assign) NSInteger EnterpriseType;
@property (nonatomic, assign) NSInteger Type;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, assign) NSInteger LoginMobile;
@property (nonatomic, assign) NSInteger TelePhone;
@property (nonatomic, copy) NSString *LastLoginTime;
@property (nonatomic, copy) NSString *Introduce;
@property (nonatomic, assign) NSInteger City;
@property (nonatomic, assign) NSInteger Area;
@property (nonatomic, assign) NSInteger Province;
@property (nonatomic, copy) NSString *Address;
@property (nonatomic, assign) NSInteger IsAudit;
@property (nonatomic, copy) NSString *Contacts;
@property (nonatomic, copy) NSString *AppUserID;
@property (nonatomic, assign) NSInteger CourseNum;
@property (nonatomic, assign) NSInteger DocumentNum;
@property (nonatomic, assign) NSInteger NoticeNum;
@property (nonatomic, assign) NSInteger StaffNum;
@property (nonatomic, assign) NSInteger LoginNum;
@property (nonatomic, assign) NSInteger OrderNum;
@property (nonatomic, copy) NSString *BusinessLicense;
@property (nonatomic, copy) NSString *SponsorAppUserID;
@property (nonatomic, copy) NSString *SponsorName;
@property (nonatomic, copy) NSString *SponsorLogo;
@property (nonatomic, copy) NSString *IDCard;
@end
