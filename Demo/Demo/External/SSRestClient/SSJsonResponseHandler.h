//
//  SSJsonResponseHandler.h
//  SSRestClient
//
//  Created by Susim Samanta on 15/08/13.
//  Copyright (c) 2013 Susim Samanta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSRestClient.h"
@interface SSJsonResponseHandler : NSObject
- (void)getJsonResponseFromData:(NSData *)resposneData onCompletion:(SSJSONResponseHandler)handler onError:(SSErrorHandler)errorHandler;
@end
