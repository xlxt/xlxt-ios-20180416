//
//  DetailModel.h
//  xlxt
//
//  Created by xlky on 2018/4/24.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject
@property (nonatomic,assign)NSInteger Average;
@property (nonatomic)NSString *Img;
@property (nonatomic)NSString *MemberPrice;
@property (nonatomic)NSString *Name;
@property (nonatomic)NSInteger Price;
@property (nonatomic,assign)NSInteger SaleAmount;
@property (nonatomic,assign)NSInteger state;
@property (nonatomic,assign)NSInteger Hits;
@property (nonatomic,copy)NSString *Intro;
@end
