//
//  SSConnectionManager.m
//  SSRestClient
//
//  Created by Susim on 9/18/13.
//  Copyright (c) 2013 Susim Samanta. All rights reserved.
//

#import "SSConnectionManager.h"

@implementation SSConnectionManager
- (void)getHttpResponseWithBaseUrl:(NSString *)url onCompletion:(SSServiceResponseHandler)serviceHandler onError:(SSErrorHandler)errorHandler {
    serviceResponseHandlr  = serviceHandler;
    errorHandlr = errorHandler;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.0];
    [request setValue:self.authorizationValue? self.authorizationValue :@"" forHTTPHeaderField:@"Authorization"];
    [request addValue:self.contentType? self.contentType :@"" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:self.httpMethod];
    [request setHTTPBody:[self.httpBody? self.httpBody : @"" dataUsingEncoding:NSUTF8StringEncoding]];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.receivedData = nil;
}
#pragma mark NSURLConnection Delegates
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.receivedData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
 	serviceResponseHandlr (self.receivedData,nil);
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [connection cancel];
    errorHandlr (error);
}
- (void)cancel {
    [self.connection cancel];
}
@end
