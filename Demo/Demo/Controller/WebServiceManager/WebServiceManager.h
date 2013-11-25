//
//  WebServiceManager.h
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^FetchCompletionHandler)(id object, NSError *error);
@interface WebServiceManager : NSObject
+(void)fetchAppsOnCompletion:(FetchCompletionHandler )handler;
+ (void)fetchImageDataWithLink:(NSString *)imageLink OnCompletion:(FetchCompletionHandler)handler;
@end
