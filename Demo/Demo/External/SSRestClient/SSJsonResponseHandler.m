//
//  SSJsonResponseHandler.m
//  SSRestClient
//
//  Created by Susim Samanta on 15/08/13.
//  Copyright (c) 2013 Susim Samanta. All rights reserved.
//

#import "SSJsonResponseHandler.h"

@implementation SSJsonResponseHandler
- (void)getJsonResponseFromData:(NSData *)resposneData onCompletion:(SSJSONResponseHandler)handler onError:(SSErrorHandler)errorHandler{
    if(resposneData) {
        NSError *jsonParserError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:resposneData options:kNilOptions error:&jsonParserError];
        if (jsonParserError) {
            errorHandler (jsonParserError);
        }else {
            handler(json);
        }
    }else {
        NSError *responseError = [NSError errorWithDomain:@"com.susim.serviceresponsenil" code:2008 userInfo:nil];
        errorHandler(responseError);
    }
}
@end
