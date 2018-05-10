//
//  ImTxLabel.m
//  xlxt
//
//  Created by xlky on 2018/4/9.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "ImTxLabel.h"


@implementation ImTxLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        imagefont = 16;
        textfont = 16;
        imageoffset = 16;
        w = frame.size.width;
        h = frame.size.height;
        space = 5;
    }
    return self;
}
-(void)SetImageFont:(CGFloat)imf TextFont:(CGFloat)tf imageoffset:(CGFloat)imagef lineSpace:(CGFloat)spaces color:(UIColor*)colors
{
    imagefont = imf;
    textfont = tf;
    imageoffset = imagef;
    space = spaces;
    color = colors;
    self.attrifont = textfont;
}
-(void)SetImage:(NSString *)imagename setText:(NSString *)text 
{
    self.numberOfLines = 0;
    //这个属性必须设置，多行才有效
  //  self.preferredMaxLayoutWidth = kScreenWidth -32;
    
    self.attri = [[NSMutableAttributedString alloc] initWithString:text];

    self.attri.font =FontSet(self.attrifont);
    self.attri.color = color;
    //可以将要插入的图片作为特殊字符处理
    //需要使用 YYAnimatedImageView 控件，直接使用UIImage添加无效。
    
    YYAnimatedImageView *imageView1= [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:imagename]];
    imageView1.frame = CGRectMake(0, 0, imagefont, imagefont);
    
    // attchmentSize 修改，可以处理内边距
    NSMutableAttributedString *attachText1= [NSMutableAttributedString attachmentStringWithContent:imageView1 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView1.frame.size alignToFont:[UIFont systemFontOfSize:imageoffset] alignment:YYTextVerticalAlignmentCenter];
    
    //插入到开头
    [self.attri insertAttributedString:attachText1 atIndex:0];

    
    //用label的attributedText属性来使用富文本
   // self.attributedText = self.attri;
      [self SetTextAndGetHeight:self.attri Font:imagefont LineSpacing:space];

}

-(void)SetText:(NSString *)text SetImage:(NSString *)imagename
{
       self.attri = [[NSMutableAttributedString alloc] initWithString:text];
    self.attri.font =FontSet(imagefont);
    self.attri.color = color;
    YYAnimatedImageView *imageView2= [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:imagename]];
    imageView2.frame = CGRectMake(0, 0, imagefont, imagefont);
        NSMutableAttributedString *attachText2= [NSMutableAttributedString attachmentStringWithContent:imageView2 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView2.frame.size alignToFont:[UIFont systemFontOfSize:imageoffset] alignment:YYTextVerticalAlignmentCenter];
    //插入到结尾
    [self.attri appendAttributedString:attachText2];
    //用label的attributedText属性来使用富文本
 //   self.attributedText = self.attri;
    
    [self SetTextAndGetHeight:self.attri Font:imagefont LineSpacing:space];
}

-(void)SetTextAndGetHeight:(NSMutableAttributedString *)introText Font:(CGFloat)font LineSpacing:(CGFloat)space
{
    introText.font =FontSet(font);
    introText.lineSpacing = space;
    self.attributedText = introText;
    CGSize introSize = CGSizeMake(w-10, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:introSize text:introText];
    self.textLayout = layout;
    CGFloat introHeight = layout.textBoundingSize.height;
    
    [self setHeight:introHeight+h];
    self.fixheight = introHeight+h;
}

-(void)SetText:(NSString *)text SetImageArr:(NSArray *)imagename
{
    self.attri = [[NSMutableAttributedString alloc] initWithString:text];
    self.attri.font =FontSet(imagefont);
    self.attri.color = color;
    
    for (NSString *image in imagename) {
        YYAnimatedImageView *imageView2= [[YYAnimatedImageView alloc] initWithImage:[UIImage imageNamed:image]];
        imageView2.frame = CGRectMake(0, 0, imagefont, imagefont);
        NSMutableAttributedString *attachText2= [NSMutableAttributedString attachmentStringWithContent:imageView2 contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView2.frame.size alignToFont:[UIFont systemFontOfSize:imageoffset] alignment:YYTextVerticalAlignmentCenter];
        //插入到结尾
        [self.attri appendAttributedString:attachText2];
    }
    //用label的attributedText属性来使用富文本
    //   self.attributedText = self.attri;
    
    [self SetTextAndGetHeight:self.attri Font:imagefont LineSpacing:space];
}

@end
