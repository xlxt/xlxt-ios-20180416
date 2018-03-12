//
//  ViewController.m
//  xlxt
//
//  Created by 赵冠骅 on 14-3-9.
//  Copyright (c) 2014年 Beijing Glaer Network Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Reachability.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import "WXApi.h"
#import <CommonCrypto/CommonDigest.h>


NSString *APPURL = @"http://m.xlxt.net";

//非WIFI网络下需要提示流量的网址
NSString *NOWIFITIP_URL = @"http://m.xlxt.net/product/course_testplayer.aspx|http://m.xlxt.net/product/course_player.aspx";

//游客模式下获取UUID后跳转地址
NSString *GETUUID_URL = @"http://m.xlxt.net/member/guestlogin.aspx?uuid={uuid}";

/******************** 支付宝移动支付开始 ************************/
// 商户PID
NSString *ALIPAY_PARTNER = @"2088021402421437";
// 商户收款账号
NSString *ALIPAY_SELLER = @"admin@xlxt.net";
// 支付宝通知URL
NSString *ALIPAY_NOTIFYURL = @"http://www.xlxt.net/pay/pay_notify_alipayapp.aspx";
// 支付宝支付成功后跳转URL
NSString *ALIPAY_RUSULTURL_SUCCESS = @"http://m.xlxt.net/pay/pay_result.aspx?result=success";
// 支付宝支付后(支付结果确认中)跳转URL
NSString *ALIPAY_RUSULTURL_PENDING = @"http://m.xlxt.net/pay/pay_result.aspx?result=pending";
// 支付宝支付失败后跳转URL
NSString *ALIPAY_RUSULTURL_FAIL = @"http://m.xlxt.net/pay/pay_result.aspx?result=failed";
// 商户私钥，pkcs8格式
NSString *ALIPAY_RSA_PRIVATE = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALCGZo3DlahW2gvJbuejJbzMCRD1/nr12hKId1YjwchUjpYgMZln5HX4eSLW1ZH3f7T7NjieHgKbXH0PsARsKPtqZscm+A73YibmIvkCwFT7Igvu1MCGg8Fb1iDrFq2lZsmKnPZci7fdKLoWXJ4X45qnC0r2QItyaKoOVKanb3iFAgMBAAECgYBcR6ZM7bXKrryF9ON5TBxqOe9zYmWKOgOqNJTN/xtKcomniWTkYR9ZXG9W+x/ikpO8NKb/qgjeLAGJjy3g4fn5tib8M/n7X+Z2Nl+k7wocDVgHXmNag2pgYSF1b7fQ3FON45LdxX4gvOp3ncrRPb3ym33deY5ebVyJIigb2tju8QJBANrkYwGXqD2Lw3AlJKLzI6oPfudrhKObawgo22TRs57suMwY+JXP0Luh7wHSb6KKGsLmoqku87YyPjixEqLl3msCQQDOc1biDM5tTsQWCJ/twH8fPyuDQEd2bvWMuKuG8pFxPM5d99x6KK61H/DjUvvKzv2u/zL9n+y2PhWGTdddmeDPAkBgayHBXdBZ6+qWx4Wv0XHwQwsfXRj8CEXJPlYFvulkI9ny7TzyoKvNOrNRFiTeb/8Bwx37cBciNld6GWWgI6kpAkA6CcLLGb6OjC4j45jSReN27VNWOqPcb6UoQmI2NcsdgnKhiCS7UuSKlsgpoBKZGUfIAoZbNrJdKWbzsr5w2emRAkEAoGoDiMGxYdwzV7IV/R4YXQ+qosuzluygKDl8kjxK65H4j5Kpl98ROJQv9Iq4KHbf3k1o3dfxOe3TEVD2X7lZ/w==";
// 支付宝公钥
NSString *ALIPAY_RSA_PUBLIC = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
// 支付结果通知返回值
int ALIPAY_SDK_PAY_FLAG = 100101;
/******************** 支付宝移动支付结束 ************************/

/******************** 微信登录&支付开始 ************************/
// 微信登录后跳转URL
NSString *WEIXIN_URL_LOGINSUCCESS = @"http://m.xlxt.net/weixin/login.aspx?code={code}";
// 微信支付商户号
NSString *WEIXINPAY_PARTNERID = @"1304122801";
// 微信支付秘钥
NSString *WEIXINPAY_KEY = @"c4yD3TXppyQfOdks7zdDmkVLmne3cVua";
// 支付成功后跳转URL
NSString *WEIXINPAY_RUSULTURL_SUCCESS = @"http://m.xlxt.net/pay/pay_result.aspx?result=success";
// 支付失败后跳转URL
NSString *WEIXINPAY_RUSULTURL_FAIL = @"http://m.xlxt.net/pay/pay_result.aspx?result=failed";
/******************** 微信登录&支付结束 ************************/

/******************** IOS内购 ************************/
NSString *IOS_RUSULTURL_SUCCESS = @"http://m.xlxt.net/member/account_notify.aspx?result=success&member_account={coin}";
NSString *IOS_RUSULTURL_RESTORE = @"http://m.xlxt.net/member/account_notify.aspx?result=failed";
NSString *IOS_RUSULTURL_FAILED = @"http://m.xlxt.net/member/account_notify.aspx?result=failed";
/******************** IOS内购 ************************/


@interface ViewController ()

@end

@implementation ViewController

+ (void)initialize {
    //设置User-Agent
    UIWebView *webViewAgent = [[UIWebView alloc] init];
    NSString *userAgent = [webViewAgent stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    userAgent = [userAgent stringByAppendingString:@";glaer-ios"];
    
    NSDictionary *dictionnary = [[NSDictionary alloc] initWithObjectsAndKeys:userAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionnary];
    
}
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 18, kScreenW, kScreenH-18)];
        _webView.backgroundColor = [UIColor colorWithRed:84/255.0 green:178/255.0 blue:242/255.0 alpha:1];
         _webView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleBottomMargin |UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_webView];
    }
    return _webView;
}
-(UIImageView *)splashView
{
    if (!_splashView) {
        _splashView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        
        [self.view addSubview:_splashView];
    }
    return _splashView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    //IOS内购使用
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    self.splashView.hidden = YES;
    
 //   CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(YES)}]; 
    
    //为了横屏下启动图标正常显示，改为先加载本地文件，通过本地文件跳转到APPURL
    //NSURL *loadingurl = [[NSBundle mainBundle] URLForResource:@"loading" withExtension:@"htm"];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:loadingurl]];
    
    
    NSString *StartAPPURL = @"";
    if ([WXApi isWXAppInstalled]) {
        StartAPPURL = [APPURL stringByAppendingString:@"/?iswxinstall=1"];      //检查是否安装微信
    }
    else {
        StartAPPURL = APPURL;
    }
    
    NSURL *url = [NSURL URLWithString:StartAPPURL];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    self.webView.delegate = self;
    //允许Video标签非全屏播放（需在video标签增加：webkit-playsinline）
    self.webView.allowsInlineMediaPlayback = YES;
     self.webView.mediaPlaybackRequiresUserAction = NO;
  //  [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    [self.webView loadRequest:request];
   
    
    //接收广播
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(recvBcastBPushLoadURL:) name:@"BPushLoadURL" object:nil];
    [nc addObserver:self selector:@selector(recvBcastWEIXINLOGINCODE:) name:@"WEIXINLOGINCODE" object:nil];
    [nc addObserver:self selector:@selector(recvBcastWEIXINPAYCODE:) name:@"WEIXINPAYCODE" object:nil];

}

//响应广播，打开百度云推送网址
- (void) recvBcastBPushLoadURL:(NSNotification *)notify
{
    
    NSDictionary *dict = [notify userInfo];
    NSString *url = [dict objectForKey:@"url"];
    
    if ([url length] > 0) {
        [self loadURL:url];
    }
    
}

//-----------------------------IOS内购开始-----------------------------

-(IBAction)purchaseFunc:(NSString *)productID ProCoin:(NSString *)productCoin {
    NSString *product = productID;
    IOS_PRODUCTID = productID;
    IOS_PRODUCTCOIN = productCoin;
    
    if([SKPaymentQueue canMakePayments]){
        [self requestProductData:product];
    }else{
        //NSLog(@"不允许程序内付费");
        [self showAlertMessage:@"不允许程序内付费"];
    }
}

//请求商品
- (void)requestProductData:(NSString *)type{
    //NSLog(@"-------------请求对应的产品信息----------------");
    NSArray *product = [[NSArray alloc] initWithObjects:type, nil, nil];
    
    NSSet *nsset = [NSSet setWithArray:product];
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:nsset];
    request.delegate = self;
    [request start];
    
}

//收到产品返回信息
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    //NSLog(@"--------------收到产品反馈消息---------------------");
    NSArray *product = response.products;
    if([product count] == 0){
        //NSLog(@"--------------没有商品------------------");
        return;
    }
    
    //NSLog(@"productID:%@", response.invalidProductIdentifiers);
    //NSLog(@"产品付费数量:%d",[product count]);
    
    SKProduct *p = nil;
    for (SKProduct *pro in product) {
        //NSLog(@"%@", [pro description]);
        //NSLog(@"%@", [pro localizedTitle]);
        //NSLog(@"%@", [pro localizedDescription]);
        //NSLog(@"%@", [pro price]);
        //NSLog(@"%@", [pro productIdentifier]);
        
        if([pro.productIdentifier isEqualToString:IOS_PRODUCTID]){
            p = pro;
        }
    }
    
    SKPayment *payment = [SKPayment paymentWithProduct:p];
    
    //IOS内购使用
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    
    //NSLog(@"发送购买请求");
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

//请求失败
- (void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    //NSLog(@"------------------错误-----------------:%@", error);
    [self showAlertMessage: [error localizedDescription]];
}

- (void)requestDidFinish:(SKRequest *)request{
    //NSLog(@"------------反馈信息结束-----------------");
}


//监听购买结果
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transaction{
    for(SKPaymentTransaction *tran in transaction){
        
        switch (tran.transactionState) {
            case SKPaymentTransactionStatePurchased:
                //NSLog(@"交易完成");
                
                [self completeTransaction:tran];

                break;
            case SKPaymentTransactionStatePurchasing:
                //NSLog(@"商品添加进列表");
                
                break;
            case SKPaymentTransactionStateRestored:
                //NSLog(@"已经购买过商品");
                
                [self restoreTransaction:tran];
                
                break;
            case SKPaymentTransactionStateFailed:
                //NSLog(@"交易失败");
                
                [self failedTransaction:tran];
                
                break;
            default:
                break;
        }
    }
}

//交易结束
- (void)completeTransaction:(SKPaymentTransaction *)transaction{

    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    
    if ([IOS_PRODUCTCOIN length] > 0) {
        [self loadURL:[IOS_RUSULTURL_SUCCESS stringByReplacingOccurrencesOfString:@"{coin}" withString: IOS_PRODUCTCOIN]];
    }
    
}

//交易失败
- (void)failedTransaction:(SKPaymentTransaction *)transaction{
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    
    [self loadURL:IOS_RUSULTURL_FAILED];
}

//重复购买
- (void)restoreTransaction:(SKPaymentTransaction *)transaction{
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    
    [self loadURL:IOS_RUSULTURL_RESTORE];
}

- (void)dealloc{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    //[super dealloc];
}

//-----------------------------IOS内购结束-----------------------------


//响应广播，打开微信登录成功后跳转地址
- (void) recvBcastWEIXINLOGINCODE:(NSNotification *)notify
{
    
    NSDictionary *dict = [notify userInfo];
    NSString *code = [dict objectForKey:@"code"];
    
    if ([code length] > 0) {
        [self loadURL:[WEIXIN_URL_LOGINSUCCESS stringByReplacingOccurrencesOfString:@"{code}" withString:code]];
    }
    
}

//响应广播，打开微信支付后跳转地址
- (void) recvBcastWEIXINPAYCODE:(NSNotification *)notify
{
    
    NSDictionary *dict = [notify userInfo];
    NSString *code = [dict objectForKey:@"code"];
    
    if ([code length] > 0) {
        if ([code isEqualToString:@"0"]) {
            [self loadURL:WEIXINPAY_RUSULTURL_SUCCESS];
        }
        else{
            [self loadURL:WEIXINPAY_RUSULTURL_FAIL];
        }
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return YES;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    if(self.splashView.hidden == NO){
        self.splashView.hidden = YES;
    }
    
    // 禁用用户选择
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    
    // 禁用长按弹出框
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    
    NSString*jsToGetHTMLSource =@"document.body.innerHTML";
    
    NSString *HTMLSource = [self.webView
                            stringByEvaluatingJavaScriptFromString:jsToGetHTMLSource];
    
   

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    
    //NSLog(@"Load URL:%@",request.URL.absoluteString);
    NSString *scheme = request.URL.scheme;

    if ([scheme isEqualToString:@"tel"]) {
        return YES;
    }
    else if ([scheme isEqualToString:@"sms"]) {
        return YES;
    }
    else if ([scheme isEqualToString:@"geo"]) {
        return NO;
    }
    else if ([scheme isEqualToString:@"glaer"]) {
        NSString *url = request.URL.absoluteString;
        NSRange range = [url rangeOfString:@"glaer:"];
        NSString *action = [request.URL.absoluteString substringFromIndex:range.location + 6];
        NSLog(@"输出action :%@",action);
        //NSLog(@"Action:%@", action);
        
        @try {
            //退出
            if ([action isEqualToString:@"exit"]) {
                exit(0);
            }
            
            //更新百度云推送Account
            if ([action hasPrefix:@"setmemberid:"]) {
                NSString *account = @"";
                if ([action length] > 13) {
                    account = [action substringFromIndex:[action rangeOfString:@"setmemberid:"].location + 12];
                }
                //NSLog(@"account：\n%@",account);
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:account forKey:@"memberid"];
                [userDefaults synchronize];
                
                /*****百度云推送*****/
                if (IsEnableBPush) {
                    [(AppDelegate*)[UIApplication sharedApplication].delegate BPushBind];
                }
                /*****百度云推送*****/
            }
            
            // 发起支付宝支付
            if ([action hasPrefix:@"alipay:"]) {
                action = [action stringByReplacingOccurrencesOfString:@"%7C" withString:@"|"];
                NSString *ordersn = @"";
                NSString *price = @"";
                if ([action length] > 7) {
                    NSArray *Params = [[action substringFromIndex:[action rangeOfString:@"alipay:"].location + 7] componentsSeparatedByString:@"|"];
                    if ([Params count] == 2) {
                        ordersn = [Params objectAtIndex:0];
                        price = [Params objectAtIndex:1];
                    }
                }
                if ([ordersn length] > 0 && [price length] > 0) {
                    [self AliPayStart:ordersn proname:[@"订单" stringByAppendingString:ordersn] prointro:[[@"为订单"
                                                                                                         stringByAppendingString:ordersn] stringByAppendingString:@"付款"] price:price notifyurl:ALIPAY_NOTIFYURL];
                } else {
                    [self showAlertMessage:@"请求参数错误"];
                }
            }
            
            // 微信登录
            if ([action isEqualToString:@"weixinlogin"]) {
                [self WeiXinLoginStart];
            }
            
            // 发起微信支付
            if ([action hasPrefix:@"weixinpay:"]) {
                NSString *prepayid = @"";
                if ([action length] > 10) {
                    prepayid = [action substringFromIndex:[action rangeOfString:@"weixinpay:"].location + 10];
                }
                if ([prepayid length] > 0) {
                    [self WeiXinPayStart:prepayid];
                } else {
                    [self showAlertMessage:@"请求参数错误"];
                }
            }
            
            // 发起IOS内购
            if ([action hasPrefix:@"iospay:"]) {
                
                action = [action stringByReplacingOccurrencesOfString:@"%7C" withString:@"|"];
                NSString *productId = @"";
                NSString *productCoin = @"";
                if ([action length] > 7) {
                    NSArray *Params = [[action substringFromIndex:[action rangeOfString:@"iospay:"].location + 7] componentsSeparatedByString:@"|"];
                    if ([Params count] == 2) {
                        productId = [Params objectAtIndex:0];
                        productCoin = [Params objectAtIndex:1];
                    }
                }
                if ([productId length] > 0 && [productCoin length] > 0) {
                    [self purchaseFunc:productId ProCoin:productCoin];
                } else {
                    [self showAlertMessage:@"请求参数错误"];
                }
            }
            
            // 获取游客UUID
            if ([action isEqualToString:@"getuuid"]) {
                [self getUUID];
            }
            
        }
        @catch (NSException *ex) {
            
        }
        
        return NO;
    }
    
    else if ([scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"] || [scheme isEqualToString:@"file"]) {
        if (![self isWiFiActive]) {
            for (NSString *TIPURL in [NOWIFITIP_URL componentsSeparatedByString:@"|"]) {
                if([request.URL.absoluteString hasPrefix:TIPURL]){
                    [self NoWifiTip];
                }
            }
        }
        
        return YES;
    }
    else{
        return NO;
    }
}

- (void)WeiXinLoginStart
{
    //构造SendAuthReq结构体
    SendAuthReq* req =[[SendAuthReq alloc ] init ];
    req.scope = @"snsapi_userinfo";
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req];
}

- (void)WeiXinPayStart:(NSString*)prepayid
{
    PayReq *req = [[PayReq alloc] init];
    req.partnerId = WEIXINPAY_PARTNERID;
    req.prepayId = prepayid;
    req.package = @"Sign=WXPay";
    req.nonceStr = [self getRandomString:32];
    req.timeStamp = time(NULL);
    
    NSString *ToSign = [NSString stringWithFormat:@"appid=%@&noncestr=%@&package=%@&partnerid=%@&prepayid=%@&timestamp=%u&key=%@",
                        WEIXIN_APPID, req.nonceStr, req.package, req.partnerId, req.prepayId, (unsigned int)req.timeStamp, WEIXINPAY_KEY];
    
    req.sign = [self MD5:ToSign];
    
    [WXApi sendReq:req];
}

- (void)AliPayStart:(NSString*)ordersn proname:(NSString*)proname prointro:(NSString*)prointro price:(NSString*)price notifyurl:(NSString*)notifyurl
{
    Order *order = [[Order alloc] init];
    order.partner = ALIPAY_PARTNER;
    order.seller = ALIPAY_SELLER;
    order.tradeNO = ordersn; //订单ID（由商家?自?行制定）
    order.productName = proname; //商品标题
    order.productDescription = prointro; //商品描述
    order.amount = price; //商品价格
    order.notifyURL = notifyurl; //回调URL
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"72h";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"wx0b7fdd0f0bd01412";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    //NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(ALIPAY_RSA_PRIVATE);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            //【callback处理支付结果】
            //NSLog(@"reslut = %@",resultDic);
            
            // 判断resultStatus 为“9000”则代表支付成功，具体状态码代表含义可参考接口文档
            NSString *resultStatus = (NSString*)[resultDic objectForKey:@"resultStatus"];
            if ([resultStatus isEqualToString:@"9000"]) {
                [self loadURL:ALIPAY_RUSULTURL_SUCCESS];
            }
            // 判断resultStatus 为非“9000”则代表可能支付失败
            // “8000”代表支付结果因为支付渠道原因或者系统原因还在等待支付结果确认，最终交易是否成功以服务端异步通知为准（小概率状态）
            else if ([resultStatus isEqualToString:@"8000"]) {
                [self loadURL:ALIPAY_RUSULTURL_PENDING];
            }
            // 其他值就可以判断为支付失败，包括用户主动取消支付，或者系统返回的错误
            else {
                [self loadURL:ALIPAY_RUSULTURL_FAIL];
            }
        }];
    }
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Error:%i",error.code);
    
    if ([error code] != NSURLErrorCancelled) {
        NSURL *errorurl = [[NSBundle mainBundle] URLForResource:@"error" withExtension:@"htm"];
        [self.webView loadRequest:[NSURLRequest requestWithURL:errorurl]];
    }
}

- (void)showAlertMessage:(NSString*)msg
{
    mAlert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [mAlert show];
}

- (void)loadURL:(NSString*)url
{
    NSURL *nsurl = [NSURL URLWithString:url];
    NSURLRequest *request =[NSURLRequest requestWithURL:nsurl];
    [self.webView loadRequest:request];
}

- (BOOL)isWiFiActive
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if (status == ReachableViaWWAN)
    {
        //3G
        return false;
    }
    else
    {
        //WIFI or No internet
        return true;
    }
}

- (void)NoWifiTip
{
    mAlert = [[UIAlertView alloc] initWithTitle:@"温馨提醒" message:@"使用2G/3G/4G网络观看视频会消耗较多流量。是否继续播放？" delegate:self cancelButtonTitle:@"继续" otherButtonTitles:@"取消", nil];
    [mAlert show];
}

-(void)getUUID{
    NSString *UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    UUID = [UUID stringByReplacingOccurrencesOfString:@"-" withString: @""];
    [self loadURL:[GETUUID_URL stringByReplacingOccurrencesOfString:@"{uuid}" withString:UUID]];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        //继续
        case 0: {
            break;
        }
        //取消
        case 1: {
            [self.webView goBack];
            break;
        }
    }
}

-(NSString *)getRandomString:(int)StrLength
{
    char data[StrLength];
    for (int x=0;x<StrLength;data[x++] = (char)('A' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:StrLength encoding:NSUTF8StringEncoding];
}

- (NSString *)MD5:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X", result[i]];
    }
    return ret;
}

@end
