//
//  HomeNaviVC.m
//  xlxt
//
//  Created by xlky on 2018/3/22.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "HomeNaviVC.h"

@interface HomeNaviVC ()
@property (nonatomic, strong) UIImageView *lineView;
@end

@implementation HomeNaviVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)SetupOutForm
{
    
  [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];


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
