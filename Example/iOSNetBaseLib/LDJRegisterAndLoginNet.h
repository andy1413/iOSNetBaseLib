//
//  LDJRegisterAndLoginNet.h
//  LDJNetBaseLib
//
//  Created by 王方帅 on 17/5/3.
//  Copyright © 2017年 wangfangshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDJRegisterAndLoginNet : NSObject

+(void)netGetCheckCodeWithPhoneNum:(NSString *)phoneNum withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

+(void)netVerifyCheckCodeWithPhoneNum:(NSString *)phoneNum withVeriCode:(NSString *)veriCode withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

+(void)netRegisterWithPhoneNum:(NSString *)phoneNum withPassword:(NSString *)password withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

@end
