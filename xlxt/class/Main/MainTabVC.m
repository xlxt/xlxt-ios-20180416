//
//  MainTabVC.m
//  xlxt
//
//  Created by xlky on 2018/3/21.
//  Copyright © 2018年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "MainTabVC.h"
#import "MainNaviVC.h"
#import "HomeNaviVC.h"
#import "PersonCenterViewController.h"
#import "EnterViewController.h"
#import "LiveViewController.h"
#import "HomeViewController.h"
#import <YYKit/YYKit.h>
@interface MainTabVC ()

@end

@implementation MainTabVC
+ (void)initialize {
    
    // 设置为不透明
    [[UITabBar appearance] setTranslucent:NO];
    // 设置背景颜色
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    
    // 拿到整个导航控制器的外观
    UITabBarItem * item = [UITabBarItem appearance];
    item.titlePositionAdjustment = UIOffsetMake(0, 1.5);
    
    // 普通状态
    NSMutableDictionary * normalAtts = [NSMutableDictionary dictionary];
    normalAtts[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    normalAtts[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#666666"];
    [item setTitleTextAttributes:normalAtts forState:UIControlStateNormal];
    
    // 选中状态
    NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
    selectAtts[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectAtts[NSForegroundColorAttributeName] = navigationbar;
    [item setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewControllerWithClassname:[HomeViewController description] imagename:@"bottom_01" SelectImageName:@"bottom_01_02" title:@"首页"];
    [self addChildViewControllerWithClassname:[LiveViewController description] imagename:@"bottom_02" SelectImageName:@"bottom_02_02" title:@"杏林直播"];
    [self addChildViewControllerWithClassname:[EnterViewController description]imagename:@"bottom_03" SelectImageName:@"bottom_03_02" title:@"企业大学"];
    [self addChildViewControllerWithClassname:[PersonCenterViewController description] imagename:@"bottom_04" SelectImageName:@"bottom_04_02" title:@"个人中心"];
   
}

//添加子控制器
- (void)addChildViewControllerWithClassname:(NSString *)classname
                                  imagename:(NSString *)imagename SelectImageName:(NSString *)Simagename
                                      title:(NSString *)title {
    
    UIViewController *vc = [[NSClassFromString(classname) alloc] init];
    vc.tabBarItem.image = [[UIImage imageNamed:imagename]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:Simagename]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    MainNaviVC *nav;
    if ([title isEqualToString:@"首页"]) {
         nav = [[HomeNaviVC alloc] initWithRootViewController:vc];
    }else{
        nav = [[MainNaviVC alloc] initWithRootViewController:vc];
    }
    
    
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:imagename]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:Simagename]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
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
