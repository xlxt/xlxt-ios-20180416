//
//  ListCataModel.h
//  xlxt
//
//  Created by xlky on 2018/5/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListCataModel : NSObject
@property (nonatomic,assign)NSInteger ClassifyID;
@property (nonatomic)NSString *Name;
@property (nonatomic,assign)NSInteger ParentID;
@property (nonatomic,assign)NSInteger Sort;
@property (nonatomic)NSString *Img;
@end
