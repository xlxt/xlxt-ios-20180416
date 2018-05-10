//
//  AudioView.m
//  xlxt
//
//  Created by xlky on 2017/4/5.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "AudioView.h"
#import "AudioModel.h"
@implementation AudioView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:(CGRect)frame]) {
        
        // 先添加View
        UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil].firstObject;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
        [self.AudioBanner setImageURL:urlFormat(@"https://m.xlxt.net/images/Banner/banner6.jpg")];
    }
    return self;
    
}

-(void)setAtarray:(NSArray *)Atarray
{
    _Atarray = Atarray;
    NSArray*btnArr = @[self.CellBtn0,self.CellBtn1,self.CellBtn2,self.CellBtn3];
    NSArray<UILabel*> *titleArr = @[self.CellTl0,self.CellTl1,self.CellTl2,self.CellTl3];
    
    int i =0;
    
    for (NSDictionary *dic in _Atarray) {
        AudioModel *am =[AudioModel modelWithDictionary:dic];
        [btnArr[i] setImageURL:[NSURL URLWithString:ImgUrl(am.course.Img)]];
   //     [titleArr[i] setObject:dic[@"Name"] forKeyPath:@"text"];
       [titleArr[i] setText:am.course.Name];
        i++;
    }
    

        
       
}
- (IBAction)tap:(UITapGestureRecognizer *)sender {
 //   NSLog(@"点击图片%ld",sender.view.tag);
    
   NSDictionary *dic = self.Atarray[sender.view.tag];
    NSInteger Aid = [dic[@"ID"] integerValue];
    
    self.block(Aid);
}


-(void)setDataDic:(NSDictionary *)DataDic
{
    _DataDic = DataDic;
}

@end
