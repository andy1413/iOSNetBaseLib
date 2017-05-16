//
//  LDJNetCenter.m
//  iOSNetBaseLib
//
//  Created by 王方帅 on 17/5/8.
//  Copyright © 2017年 wangfangshuai. All rights reserved.
//

#import "LDJNetCenter.h"
#import "LDJRSAAndDES.h"

@implementation LDJNetCenter

+(instancetype)share
{
    static LDJNetCenter *_ldjNetCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _ldjNetCenter = [[LDJNetCenter alloc] init];
    });
    return _ldjNetCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        switch (kCurrentNetType)
        {
            case NetType_Internet:
            {
                [iOSNetCenter share].networkURL = @"http://soulland.jd.com/";
            }
                break;
            case NetType_Test:
            {
                [iOSNetCenter share].networkURL = @"http://10.182.42.242/";
            }
                break;
                
            default:
                break;
        }
    }
    return self;
}

-(void)sendRequestWithSubURL:(NSString *)subURL withParams:(NSDictionary *)params withHTTPMethod:(enum HTTPMethodEnum)httpMethod withEncryptType:(enum EncryptType)encryptType withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler
{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithDictionary:params];
    [paramsDic setObject:[NSString stringWithFormat:@"%.0f",(([[NSDate date] timeIntervalSince1970])*1000)] forKey:@"timestamp"];
    NSLog(@"paramsDic:%@",paramsDic);
    switch (encryptType) {
        case EncryptType_Rsa:
        {
            params = [LDJRSAAndDES rsaSignAndEncryptionWithParams:paramsDic];
        }
            break;
        case EncryptType_Des:
        {
            params = [LDJRSAAndDES desSignAndEncryptionWithParams:paramsDic];
        }
            break;
            
        default:
            break;
    }
    [[iOSNetCenter share] sendRequestWithSubURL:subURL withParams:params withHTTPMethod:httpMethod withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSDictionary *returnContentDic = nil;
        switch (encryptType) {
            case EncryptType_Rsa:
            {
                returnContentDic = [LDJRSAAndDES rsaDecryptAndVerifySignWithParams:[NSMutableDictionary dictionaryWithDictionary:@{@"ciphertext":responseObject}]];
            }
                break;
            case EncryptType_Des:
            {
                returnContentDic = [LDJRSAAndDES desDecryptAndVerifySignWithParams:[NSMutableDictionary dictionaryWithDictionary:@{@"ciphertext":responseObject}]];
            }
                break;
            case EncryptType_None:
            {
                returnContentDic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            }
                break;
                
            default:
                break;
        }
        completionHandler(response,returnContentDic,error);
    }];
}

@end
