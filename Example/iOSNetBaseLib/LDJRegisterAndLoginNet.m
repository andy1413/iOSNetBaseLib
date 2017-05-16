//
//  LDJRegisterAndLoginNet.m
//  LDJNetBaseLib
//
//  Created by 王方帅 on 17/5/3.
//  Copyright © 2017年 wangfangshuai. All rights reserved.
//

#import "LDJRegisterAndLoginNet.h"
#import "LDJNetCenter.h"
#import <NSString+MD5.h>

@implementation LDJRegisterAndLoginNet

+(void)netGetTimestampWithCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler
{
    NSDictionary *params = @{};
    [[LDJNetCenter share] sendRequestWithSubURL:@"common/n/getTimestamp" withParams:params withHTTPMethod:HTTPMethodEnum_Get withEncryptType:EncryptType_None withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
        completionHandler(response,responseObject,error);
    }];
}

+(void)netGetCheckCodeWithPhoneNum:(NSString *)phoneNum withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler
{
    NSDictionary *params = @{@"userName":phoneNum};
    [[LDJNetCenter share] sendRequestWithSubURL:@"user/n/getCheckCode" withParams:params withHTTPMethod:HTTPMethodEnum_Get withEncryptType:EncryptType_None withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
        completionHandler(response,responseObject,error);
    }];
}

+(void)netVerifyCheckCodeWithPhoneNum:(NSString *)phoneNum withVeriCode:(NSString *)veriCode withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler
{
    NSDictionary *params = @{@"userName":phoneNum,@"checkCode":veriCode};
    [[LDJNetCenter share] sendRequestWithSubURL:@"user/n/verifyCheckCode" withParams:params withHTTPMethod:HTTPMethodEnum_Get withEncryptType:EncryptType_None withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
        completionHandler(response,responseObject,error);
    }];
}

+(void)netRegisterWithPhoneNum:(NSString *)phoneNum withPassword:(NSString *)password withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler
{
    NSDictionary *params = @{@"userName":phoneNum,@"password":[password MD5Digest]};
    [[LDJNetCenter share] sendRequestWithSubURL:@"user/n/register" withParams:params withHTTPMethod:HTTPMethodEnum_Get withEncryptType:EncryptType_None withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
        completionHandler(response,responseObject,error);
    }];
}

@end
