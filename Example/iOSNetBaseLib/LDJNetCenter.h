//
//  LDJNetCenter.h
//  iOSNetBaseLib
//
//  Created by 王方帅 on 17/5/8.
//  Copyright © 2017年 wangfangshuai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iOSNetCenter.h"

#define kCurrentNetType NetType_Internet

enum NetType
{
    NetType_Internet,
    NetType_Test,
};

enum EncryptType
{
    EncryptType_None,
    EncryptType_Rsa,
    EncryptType_Des,
};

@interface LDJNetCenter : NSObject

+(instancetype)share;

-(void)sendRequestWithSubURL:(NSString *)subURL withParams:(NSDictionary *)params withHTTPMethod:(enum HTTPMethodEnum)httpMethod withEncryptType:(enum EncryptType)encryptType withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

@end
