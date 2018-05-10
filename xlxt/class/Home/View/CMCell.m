//
//  CMCell.m
//  xlxt
//
//  Created by xlky on 2017/4/10.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "CMCell.h"

@implementation CMCell

- (void)awakeFromNib {
    [super awakeFromNib];

}
-(void)setCDataDic:(NSDictionary *)CDataDic
{
    _CDataDic = CDataDic;
    
    self.CMIV.image = [UIImage imageNamed:CDataDic[@"ImageName"]];
    self.CMTitle.text =CDataDic[@"name"];
    
}

@end
