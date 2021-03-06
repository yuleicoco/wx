//
//  AFHttpClient.m
//  sego2.0
//
//  Created by yulei on 16/11/10.
//  Copyright © 2016年 yulei. All rights reserved.
//

#import "AFHttpClient.h"

@implementation AFHttpClient


singleton_implementation(AFHttpClient)



-(instancetype)init
{
    if (self = [super initWithBaseURL:[NSURL URLWithString:BASE_URL_Test]]) {
        self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", @"application/json", nil];
        [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    NSLog(@"-------3G/4G------");
                    break;
                    
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    NSLog(@"-------WIFI------");
                    break;
                    
                case AFNetworkReachabilityStatusNotReachable:
                    NSLog(@"-------AFNetworkReachabilityStatusNotReachable------");
                    
                    break;
                default:
                    break;
            }
        }];
        [self.reachabilityManager startMonitoring];
    }
    
    return self;

    
}




- (AFHTTPRequestOperation *)POST:(NSString *)URLString parameters:(id)parameters result:(void (^)(BaseModel* model))result {
    
    NSString * langvge = langeC;
    return [super POST:URLString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSError* error = nil;
        BaseModel* model = [[BaseModel alloc] initWithDictionary:responseObject error:&error];
        
        if (error || [model.retCode integerValue] != 0) {
            if ([langvge isEqualToString:@"zh-Hans-CN"]) {
                [[AppUtil appTopViewController] showHint:error ? [error localizedDescription] : model.retCode];
            }else{
              [[AppUtil appTopViewController] showHint:error ? [error localizedDescription] : @"The request failed"];
            }
            
            if (result) {
                result(nil);
            }
           // return ;
        }
        
        if (result) {
            result(model);
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
          NSString * langvge = langeC;
        if ([langvge isEqualToString:@"zh-Hans-CN"]) {
            [[AppUtil appTopViewController] showHint: @"请检查网络连接"];
            
        }else{
            [[AppUtil appTopViewController] showHint: @"Please check network"];
        }
        

        
        
        if (result) {
            result(nil);
        }
    }];
}



@end
    
