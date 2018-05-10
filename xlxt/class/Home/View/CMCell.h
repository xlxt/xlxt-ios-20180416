//
//  CMCell.h
//  xlxt
//
//  Created by xlky on 2017/4/10.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *CMIV;
@property (weak, nonatomic) IBOutlet UILabel *CMTitle;
@property (nonatomic,strong)NSDictionary *CDataDic;
@end
