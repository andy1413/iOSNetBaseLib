//
//  iOSNetCenter.m
//  iOSNetBaseLib
//
//  Created by 王方帅 on 17/5/2.
//  Copyright © 2017年 wangfangshuai. All rights reserved.
//

#import "iOSNetCenter.h"
#import <AFNetworking.h>
#import <JSONKit.h>

@implementation iOSNetCenter

+(instancetype)share
{
    static iOSNetCenter *_iOSNetCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _iOSNetCenter = [[iOSNetCenter alloc] init];
    });
    return _iOSNetCenter;
}

-(void)sendRequestWithSubURL:(NSString *)subURL withParams:(NSDictionary *)params withHTTPMethod:(enum HTTPMethodEnum)httpMethod withHeaderParams:(NSDictionary *)headerParams withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    for (int i = 0; i < headerParams.allKeys.count; i++)
    {
        NSString *key = headerParams.allKeys[i];
        NSString *value = headerParams[key];
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
    }
    AFHTTPResponseSerializer *response = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = response;
    response.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@",_networkURL,subURL];
    NSLog(@"requestUrl:%@,\nrequestParams:%@",urlString,[params JSONString]);
    
    NSMutableURLRequest *request;
    switch (httpMethod) {
        case HTTPMethodEnum_Get:
        {
            [manager GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                completionHandler(task.response,[responseObject objectFromJSONData],nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                completionHandler(task.response,nil,error);
            }];
        }
            break;
        case HTTPMethodEnum_Post:
        {
            [manager POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                completionHandler(task.response,[responseObject objectFromJSONData],nil);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                completionHandler(task.response,nil,error);
            }];
        }
            break;
    }
}

@end
