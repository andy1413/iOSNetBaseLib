//
//  iOSNetCenter.h
//  iOSNetBaseLib
//
//  Created by 王方帅 on 17/5/2.
//  Copyright © 2017年 wangfangshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

enum HTTPMethodEnum
{
    HTTPMethodEnum_Get,
    HTTPMethodEnum_Post,
};

@interface iOSNetCenter : NSObject

+(instancetype)share;

@property (nonatomic,strong) NSString   *networkURL;

-(void)sendRequestWithSubURL:(NSString *)subURL withParams:(NSDictionary *)params withHTTPMethod:(enum HTTPMethodEnum)httpMethod withHeaderParams:(NSDictionary *)headerParams withCompletion:(void (^)(NSURLResponse *response, id responseObject, NSError *error))completionHandler;

@end
