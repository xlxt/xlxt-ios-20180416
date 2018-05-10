//
//  CircleImageView.h
//  xlxt
//
//  Created by xlky on 2018/3/22.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleImageView : UIImageView
@property(nonatomic,strong)NSString *url;
-(instancetype)initWithFrame:(CGRect)frame AndUrl:(NSString*)imageUrl;
@end
