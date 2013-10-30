//
//  SSRestManager.h
//  SSRestClient
//
//  Created by Susim Samanta on 15/08/13.
//  Copyright (c) 2013 Susim Samanta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSRestClient.h"
@interface SSRestManager : NSObject

@property (nonatomic) NSString *authorizationValue;
@property (nonatomic) NSString *httpMethod;
@property (nonatomic) NSString *httpBody;
@property (nonatomic) NSString *contentType;
- (void)getHttpResponseWithBaseUrl:(NSString *)url onCompletion:(SSServiceResponseHandler)serviceHandler onError:(SSErrorHandler)errorHandler;
- (void)getServiceResponseWithBaseUrl:(NSString *)baseUrl query:(NSString *)queryString onCompletion:(SSServiceResponseHandler )serviceHandler onError:(SSErrorHandler)errorHandler;
-(void)getJsonResponseFromBaseUrl:(NSString *)baseUrl query:(NSString *)queryString onCompletion:(SSJSONResponseHandler)jsonHandler onError:(SSErrorHandler)errorHandler;
@end
