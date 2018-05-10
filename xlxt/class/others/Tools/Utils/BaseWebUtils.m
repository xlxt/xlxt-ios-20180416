//
//

#import "BaseWebUtils.h"
#import <AFNetworking.h>

@implementation BaseWebUtils



+(void)Get:(NSString *)path andParams:(NSDictionary *)dic andCallback:(MyCallback)callback{
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    // 读取账户
    NSString * k= [[NSUserDefaults standardUserDefaults] objectForKey:@"k"];
    //读取密码
    NSString * u = [[NSUserDefaults standardUserDefaults] objectForKey:@"u"];
//      NSLog(@"123123123123   %@       %@",k,u);
//    NSDictionary *paradic = @{
//                              @"k":k,
//                              @"u":u
//                              };
    
    [manager.requestSerializer setValue:k forHTTPHeaderField:@"k"];
    [manager.requestSerializer setValue:u forHTTPHeaderField:@"u"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"image/jpeg", nil];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task,id  _Nullable responseObject) {
       // NSLog(@"%@",operation.request.allHTTPHeaderFields);


        callback(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        callback(nil);
    }];

    
}



+(void)Post:(NSString *)path andParams:(NSDictionary *)dic andCallback:(MyCallback)callback{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
      manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"image/jpeg", nil];
    [manager POST:path parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        callback(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        callback(nil);
        
    }];
}
@end
