//
//  LoginViewController.m
//  xlxt
//
//  Created by xlky on 2017/5/15.
//  Copyright © 2017年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "LoginViewController.h"
#import "LosingPasswordVC.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBTN;
@property (weak, nonatomic) IBOutlet UIButton *FoundPSBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@end

@implementation LoginViewController
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.scrollview.frame = CGRectMake(0, 0, kScreenW, kScreenH-64);
    [self.scrollview setContentSize:CGSizeMake(kScreenW, 600)];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //注册键盘弹出通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow1:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide1:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.usernameTF isExclusiveTouch]) {
        [self.usernameTF resignFirstResponder];
    }
    if (![self.passwordTF isExclusiveTouch]){
           [self.passwordTF resignFirstResponder];
    }
}
//键盘弹出后将视图向上移动
-(void)keyboardWillShow1:(NSNotification *)note
{

        NSDictionary *info = [note userInfo];
        CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
        //目标视图UITextField
        
        int y = keyboardSize.height-60;
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeView" context:nil];
        [UIView setAnimationDuration:animationDuration];
        
        self.view.frame = CGRectMake(0, -y+64, self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];

}
- (IBAction)beginend:(id)sender {
    
    self.passwordTF.secureTextEntry = YES;
}

//键盘隐藏后将视图恢复到原始状态
-(void)keyboardWillHide1:(NSNotification *)note
{

        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeView" context:nil];
        [UIView setAnimationDuration:animationDuration];
        self.view.frame =CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);;
        [UIView commitAnimations];

   
}
- (IBAction)loginBtn:(id)sender {
    
         [self loginMethod];
    
}
- (IBAction)registeraction:(id)sender {
    RegisterViewController *rgister = [RegisterViewController new];
    [self.navigationController pushViewController:rgister animated:YES];
    
}
- (IBAction)passwordforget:(id)sender {
    LosingPasswordVC *pwvc = [LosingPasswordVC new];
    [self.navigationController pushViewController:pwvc animated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loginMethod
{
    
    
//    NSDictionary *paradic = @{
//                              @"UserName":self.usernameTF.text,
//                              @"Password":self.passwordTF.text
//                              };
//    
//    [BaseWebUtils Post:@"http://sso.xlxt.net/UserSSO/UserSSOAppLogin" andParams:paradic andCallback:^(id obj) {
//        
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];
//        
//
//        NSString * base64String = dic[@"Key"];
//
//        if (base64String) {
//            
//    
//        NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:0];
//        
//      NSString *destring = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//     //   NSLog(@"%@", decodedString); // foo
//      //  NSLog(@"输出登录后的信息：%@",destring);
//            
//            NSArray *StrArr = [destring componentsSeparatedByString:@"-"];
//        //    NSLog(@"输出key:%@",StrArr[0]);
//            [self saveCookiesWithKey:StrArr[0]];
//            [self addAlertWithTitle:@"登录成功"];
//      }else
//      {
//        //NSString *errorstr = dic;
//      //    NSLog(@"输出错误信息：%@",dic[@"error"]);
//          [self addAlertWithTitle:dic[@"error"]];
//      }
//        
//    }];
}
-(void)saveCookiesWithKey:(NSString*)loginkey {
    // 创建一个可变字典存放cookie
    NSMutableDictionary *fromappDict = [NSMutableDictionary dictionary];
    [fromappDict setObject:@"Key" forKey:NSHTTPCookieName];
    [fromappDict setObject:loginkey forKey:NSHTTPCookieValue];
    // kDomain是公司app网址
  //  [fromappDict setObject:kDomain forKey:NSHTTPCookieDomain];
   // [fromappDict setObject:kDomain forKey:NSHTTPCookieOriginURL];
    [fromappDict setObject:@"/" forKey:NSHTTPCookiePath];
    [fromappDict setObject:@"0" forKey:NSHTTPCookieVersion];
    
    // 将可变字典转化为cookie
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:fromappDict];
    
    // 获取cookieStorage
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    // 存储cookie
    [cookieStorage setCookie:cookie];
}

-(void)addAlertWithTitle:(NSString*)title
    {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    


- (IBAction)wechatlogin:(id)sender {
}
- (IBAction)tourlogin:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
