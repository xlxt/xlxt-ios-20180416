//
//

#import "BaseWebUtils.h"
#import <AFNetworking.h>

@implementation BaseWebUtils



+(void)Get:(NSString *)path andParams:(NSDictionary *)dic andCallback:(MyCallback)callback{
    

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

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
