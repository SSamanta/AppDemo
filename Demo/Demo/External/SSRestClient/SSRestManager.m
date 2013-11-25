//
//  SSRestManager.m
//  SSRestClient
//
//  Created by Susim Samanta on 15/08/13.
//  Copyright (c) 2013 Susim Samanta. All rights reserved.
//

#import "SSRestManager.h"
#import "SSJsonResponseHandler.h"
@interface SSRestManager ()
@end

@implementation SSRestManager

- (void)getHttpResponseWithBaseUrl:(NSString *)url onCompletion:(SSServiceResponseHandler)serviceHandler onError:(SSErrorHandler)errorHandler {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [request setValue:self.authorizationValue? self.authorizationValue :@"" forHTTPHeaderField:@"Authorization"];
    [request addValue:self.contentType? self.contentType :@"" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:self.httpMethod];
    [request setHTTPBody:[self.httpBody? self.httpBody : @"" dataUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection sendAsynchronousRequest:(NSURLRequest *)request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            errorHandler (error);
        }else {
            serviceHandler (data,response);
        }
    }];
}

- (void)getServiceResponseWithBaseUrl:(NSString *)baseUrl query:(NSString *)queryString onCompletion:(SSServiceResponseHandler )serviceHandler onError:(SSErrorHandler)errorHandler {
    NSURL *url =  queryString ? [NSURL URLWithString:queryString relativeToURL:[NSURL URLWithString:baseUrl]] : [NSURL URLWithString:baseUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:(NSURLRequest *)request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (error) {
            errorHandler (error);
        }else {
            serviceHandler (data,response);
        }
    }];
}

-(void)getJsonResponseFromBaseUrl:(NSString *)baseUrl query:(NSString *)queryString onCompletion:(SSJSONResponseHandler)jsonHandler onError:(SSErrorHandler)errorHandler {
    [self getServiceResponseWithBaseUrl:baseUrl query:queryString onCompletion:^(id responseData, NSURLResponse *reponse) {
        SSJsonResponseHandler *jsonResponseHandler = [[SSJsonResponseHandler alloc] init];
        [jsonResponseHandler getJsonResponseFromData:responseData onCompletion:^(NSDictionary *json) {
            jsonHandler(json);
        } onError:^(NSError *error) {
            errorHandler(error);
        }];
    } onError:^(NSError *error) {
        errorHandler (error);
    }];
}
@end
