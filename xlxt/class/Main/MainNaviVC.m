//
//  MainNaviVC.m
//  xlxt
//
//  Created by xlky on 2018/3/21.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "MainNaviVC.h"

@interface MainNaviVC ()
{
    UIView *NaviView;
}
@property (nonatomic, strong) UIImageView *navBarHairlineImageView;
@end

@implementation MainNaviVC
//通过一个方法来找到这个黑线(findHairlineImageViewUnder):
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupOutForm];
   
     self.navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationBar];
     self.navBarHairlineImageView.hidden = YES;
    
}
-(void)SetupOutForm
{
    self.navigationBar.barTintColor = navigationbar;
    self.navigationBar.tintColor = WhiteColor;
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:FontSet(19),
       
       NSForegroundColorAttributeName:WhiteColor}];
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
