//
//  YYLabel+ImageText.m
//  xlxt
//
//  Created by xlky on 2018/3/22.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "YYLabel+ImageText.h"

@implementation YYLabel (ImageText)
-(NSMutableAttributedString *)insertImage:(NSArray<NSDictionary*>*)imageArr AtFrame:(CGRect)frame String:(NSString*)string
{
    
    
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:string];
    for (NSDictionary *dic in imageArr) {
        
        NSString *ImageName =dic[@"ImName"];
    //    NSInteger integer =[dic[@"Index"] integerValue];
        
        YYAnimatedImageView *imageView1= [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:ImageName]];
        imageView1.frame = frame;
        
        NSMutableAttributedString *attachText1= [NSMutableAttributedString attachmentStringWithContent:imageView1 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView1.frame.size alignToFont:[UIFont systemFontOfSize:24] alignment:YYTextVerticalAlignmentCenter];
        [attri insertAttributedString:attachText1 atIndex:0];
        
    }
    
    return attri;
}
@end
