typedef void (^SSJSONResponseHandler)(NSDictionary *json);
typedef void (^SSErrorHandler)( NSError *error);
typedef void (^SSServiceResponseHandler)(id responseData,NSURLResponse *reponse);