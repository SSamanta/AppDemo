//
//  SSConnectionManager.h
//  SSRestClient
//
//  Created by Susim on 9/18/13.
//  Copyright (c) 2013 Susim Samanta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSRestClient.h"

/* this class is intended to make asynchronous url connection wtih cancelling functiolaties request object */

@interface SSConnectionManager : NSObject {
    SSServiceResponseHandler serviceResponseHandlr;
    SSErrorHandler errorHandlr;
}
@property (nonatomic) NSURLConnection *connection;
@property (nonatomic) NSString *authorizationValue;
@property (nonatomic) NSString *httpMethod;
@property (nonatomic) NSString *httpBody;
@property (nonatomic) NSString *contentType;
@property (nonatomic) NSMutableData *receivedData;
- (void)getHttpResponseWithBaseUrl:(NSString *)url onCompletion:(SSServiceResponseHandler)serviceHandler onError:(SSErrorHandler)errorHandler;
- (void)cancel;
@end
