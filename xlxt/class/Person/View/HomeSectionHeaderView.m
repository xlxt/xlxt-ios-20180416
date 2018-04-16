//
//  HomeSectionHeaderView.m
//  游戏直播
//
//  Created by tarena on 16/9/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HomeSectionHeaderView.h"
@implementation HomeSectionHeaderView
BOOL login = NO;
- (void)awakeFromNib {
    
    [super awakeFromNib];
    self.HeadIV.layer.masksToBounds = YES;
    self.HeadIV.layer.cornerRadius = self.HeadIV.frame.size.width/2.0;
    self.HeadIV.layer.borderWidth = 2.0;
    self.HeadIV.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.backgroundColor = navigationbar;
    self.HeadIV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction123)];
    
    [self.HeadIV addGestureRecognizer:tap];

    
    self.WV = [[UIWebView alloc]init];
    self.WV.delegate = self;
    [self addSubview:self.WV];
    NSURL *url2 = [NSURL URLWithString:@"http://m.xlxt.net"];
    [self.WV loadRequest:[NSURLRequest requestWithURL:url2]];

 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(webreload) name:@"webreload" object:nil];

}

//登录刷新功能
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    
    NSString *url = [[request URL] absoluteString];
    //把接口转成UTF-8的形式
    NSString *urlString = [url stringByRemovingPercentEncoding];
    
    //    NSString* string = [urlString substringFromIndex:10];//截取掉下标7之前的字符串
    
  //  NSLog(@"输出：%@",urlString);
    
    if ([urlString isEqualToString:@"http://m.xlxt.net/member/index.aspx"]&&(login == NO)) {
        
        login = YES;
        [self sendreloadNoti];
        
    }else if ([urlString containsString:@"您已经退出"]){
        login = NO;
    }
    
    
    return YES;
}
//发出刷新通知
-(void)sendreloadNoti
{
    //创建通知
    self.notification = [NSNotification notificationWithName:@"webreload" object:nil userInfo:nil];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:self.notification];
}


-(void)webreload
{
    [self.WV reload];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    /*
     [PersonalWebUtils requestNickNameAndCoinWithCallback:^(id obj) {
     
     if (obj[@"Msg"]) {
     
     [self.WV reload];
     
     }else{
     
     self.NameLb.text = [NSString stringWithFormat:@"您好，%@",obj[@"NikeName"]];
     NSInteger sc =[obj[@"Coin"] integerValue];
     
     self.ScoreLb.text = [NSString stringWithFormat:@"当前积分：%ld",sc];
     
     }
     }];

     */
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"webreload" object:nil];
}
-(void)tapAction123
{
    self.block();


}

@end
