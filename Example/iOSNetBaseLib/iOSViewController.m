//
//  iOSViewController.m
//  iOSNetBaseLib
//
//  Created by wangfangshuai on 05/04/2017.
//  Copyright (c) 2017 wangfangshuai. All rights reserved.
//

#import "iOSViewController.h"
#import "LDJRegisterAndLoginNet.h"

@interface iOSViewController ()

@end

@implementation iOSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *phoneNum = @"15116937738";
    [LDJRegisterAndLoginNet netGetCheckCodeWithPhoneNum:phoneNum withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        if (error == nil &&[responseObject[@"status"] intValue] == 0)
        {
            NSString *checkCode = responseObject[@"content"][@"checkCode"];
            [LDJRegisterAndLoginNet netVerifyCheckCodeWithPhoneNum:phoneNum withVeriCode:checkCode withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
                if (error == nil &&[responseObject[@"status"] intValue] == 0) {
                    [LDJRegisterAndLoginNet netRegisterWithPhoneNum:phoneNum withPassword:@"1111" withCompletion:^(NSURLResponse *response, id responseObject, NSError *error) {
                        
                    }];
                }
            }];
        }
        else
        {
            
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
