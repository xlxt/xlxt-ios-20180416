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
#import "LoginModel.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBTN;
@property (weak, nonatomic) IBOutlet UIButton *FoundPSBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) NSUserDefaults *defaults;
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
    
//    self.defaults = [NSUserDefaults standardUserDefaults];

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
        
        self.view.frame = CGRectMake(0, -y+120, self.view.frame.size.width, self.view.frame.size.height);
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
    
    
    NSDictionary *paradic = @{
                              @"UserName":self.usernameTF.text,
                              @"Password":self.passwordTF.text
                              };
    
    
    NSString *str = @"/UserSSO/UserSSOAppLogin";
    [BaseWebUtils Post:SSOUrl(str) andParams:paradic andCallback:^(id obj) {
        

        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:obj options:NSJSONReadingAllowFragments error:nil];
//     NSLog(@"输出登录后的信息：%@ ",dic);
     LoginModel *loginModel = [LoginModel modelWithDictionary:dic];
        if ([loginModel.error isEqualToString:@""]) {

            [loginModel TakeUseridAndkeyWithdestring:loginModel.url];
            [self addAlertWithTitle:@"登录成功"];
      }else
      {
          [self addAlertWithTitle:loginModel.error];
      }
        
    }];
}


-(void)addAlertWithTitle:(NSString*)title
    {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if([title isEqualToString:@"登录成功"]){
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        }];
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
