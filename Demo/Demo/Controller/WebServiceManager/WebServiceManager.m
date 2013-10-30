//
//  WebServiceManager.m
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "WebServiceManager.h"
#import "SSRestManager.h"
#import "Employee.h"

@implementation WebServiceManager
+(void)fetchEmployeeListOnCompletion:(EmployeeListCompletionHandler )handler {
    SSRestManager *restManager = [[SSRestManager alloc] init];
    [restManager getJsonResponseFromBaseUrl:@"https://dl.dropboxusercontent.com" query:@"/u/90940570/emp.json" onCompletion:^(NSDictionary *json) {
        if (json) {
            NSArray *empList = json[@"list_emp"];
            NSMutableArray *empFullList = [[NSMutableArray alloc] init];
            [empList enumerateObjectsUsingBlock:^(NSDictionary *empDict, NSUInteger idx, BOOL *stop) {
                Employee *emp = [[Employee alloc] initWithDictionary:empDict];
                [empFullList addObject:emp];
            }];
            handler (empFullList,nil);
        }
    } onError:^(NSError *error) {
        if (error) {
            handler(nil,error);
        }
    }];
}
@end
