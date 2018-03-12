//
//  ViewController.h
//  xlxt
//
//  Created by 赵冠骅 on 14-3-9.
//  Copyright (c) 2014年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <StoreKit/StoreKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate,SKPaymentTransactionObserver,SKProductsRequestDelegate>
{
    UIAlertView* mAlert;
    
    //IOS内购使用
    NSString* IOS_PRODUCTID;
    NSString* IOS_PRODUCTCOIN;
}

@property (strong, nonatomic) UIWebView *webView;
@property (strong, nonatomic) UIImageView *splashView;

//IOS内购使用
//- (IBAction)purchaseFunc:(id)sender;
- (IBAction)purchaseFunc:(NSString *)productID ProCoin:(NSString *)productCoin;

@end
