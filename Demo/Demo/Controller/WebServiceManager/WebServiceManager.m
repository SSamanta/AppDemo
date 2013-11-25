//
//  WebServiceManager.m
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "WebServiceManager.h"
#import "SSRestManager.h"
#import "App.h"
#import "AppConstants.h"
@implementation WebServiceManager
+(void)fetchAppsOnCompletion:(FetchCompletionHandler )handler {
    SSRestManager *restManager = [[SSRestManager alloc] init];
    [restManager getJsonResponseFromBaseUrl:kBaseURL query:@"/us/rss/topfreeapplications/limit=300/json" onCompletion:^(NSDictionary *json) {
        if (json) {
            NSArray *apps = json[@"feed"][@"entry"];
            NSMutableArray *appsFullList = [[NSMutableArray alloc] init];
            [apps enumerateObjectsUsingBlock:^(NSDictionary *appDict, NSUInteger idx, BOOL *stop) {
                App *app = [[App alloc] initWithDictionary:appDict];
                [appsFullList addObject:app];
            }];
            handler (appsFullList,nil);
        }
    } onError:^(NSError *error) {
        if (error) {
            handler(nil,error);
        }
    }];
}
+ (void)fetchImageDataWithLink:(NSString *)imageLink OnCompletion:(FetchCompletionHandler)handler {
    SSRestManager *restManager = [[SSRestManager alloc] init];
    [restManager getServiceResponseWithBaseUrl:imageLink query:nil onCompletion:^(id responseData, NSURLResponse *reponse) {
        handler (responseData,nil);
    } onError:^(NSError *error) {
        handler (nil,error);
    }];
}
@end
