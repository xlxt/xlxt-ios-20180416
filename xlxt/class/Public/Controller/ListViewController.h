//
//  ListViewController.h
//  xlxt
//
//  Created by xlky on 2017/3/3.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController
@property (nonatomic)NSString *Navititle;
@property (assign)NSInteger cateid;
-(instancetype)initWithId:(NSInteger)cateid;
@end
