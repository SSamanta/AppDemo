//
//  WebServiceManager.h
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^EmployeeListCompletionHandler)(id object, NSError *error);
@interface WebServiceManager : NSObject
+(void)fetchEmployeeListOnCompletion:(EmployeeListCompletionHandler )handler;
@end
