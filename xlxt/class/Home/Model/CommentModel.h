//
//  CommentModel.h
//  xlxt
//
//  Created by xlky on 2018/5/10.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property (nonatomic, copy) NSString *HeadImg;
@property (nonatomic, copy) NSString *AddTime;
@property (nonatomic, copy) NSString *Content;
@property(assign)NSInteger CourseID;
@property (nonatomic, copy) NSString *AppUserID;
@property(assign)NSInteger IsShow;
@property(assign)NSInteger ReviewID;
@property(assign)NSInteger Star;
@property (nonatomic, copy) NSString *Name;
@end
