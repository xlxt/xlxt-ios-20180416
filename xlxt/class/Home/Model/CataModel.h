//
//  CataModel.h
//  xlxt
//
//  Created by xlky on 2018/5/7.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CataModel : NSObject
@property (nonatomic, assign) NSInteger ClassifyID;
@property (nonatomic, copy) NSString *Name;
@property (nonatomic, assign) NSInteger ParentID;
@property (nonatomic, assign) NSInteger Sort;
@property (nonatomic, copy) NSString *Img;
@end
