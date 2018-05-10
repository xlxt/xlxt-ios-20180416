//
//  headmodel.h
//  TextDemo
//
//  Created by xlky on 2016/12/21.
//  Copyright © 2016年 xlky. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface other : NSObject
@property(nonatomic)NSString *ssiog;
@end

@interface headmodel : NSObject
@property(nonatomic,copy)NSString *Img;
@property(nonatomic,copy)NSString *Link;
@property(nonatomic)NSDictionary *dic;
@property(nonatomic)other *imm;
@property(assign)NSInteger ID;
@end


