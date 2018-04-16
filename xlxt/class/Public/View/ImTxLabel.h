//
//  ImTxLabel.h
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <YYKit/YYKit.h>

@interface ImTxLabel : YYLabel
{
    CGFloat imagefont;
    CGFloat textfont;
    CGFloat imageoffset;
    CGFloat w;
    CGFloat h;
    CGFloat space;
    UIColor* color;
}
@property (nonatomic,strong)NSMutableAttributedString *attri;
@property (nonatomic,assign)CGFloat fixheight;
-(void)SetImageFont:(CGFloat)imf TextFont:(CGFloat)tf imageoffset:(CGFloat)imagef lineSpace:(CGFloat)spaces color:(UIColor*)colors;
-(void)SetImage:(NSString *)imagename setText:(NSString *)text;
-(void)SetText:(NSString *)text SetImage:(NSString *)imagename;
@end
