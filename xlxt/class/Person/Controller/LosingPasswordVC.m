//
//  LosingPasswordVC.m
//  xlxt
//
//  Created by xlky on 2018/4/13.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "LosingPasswordVC.h"

@interface LosingPasswordVC ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;

@end

@implementation LosingPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.usernameTF.layer.borderColor= [UIColor clearColor].CGColor;
    
   self.usernameTF.layer.borderWidth= 1.0f;
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
