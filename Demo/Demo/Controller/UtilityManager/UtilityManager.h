//
//  UtilityManager.h
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityManager : NSObject
+(void)archiveAppToLocalFile:(NSArray *)apps;
+(NSArray *)getAppsFromLocalFile;
+(void)storeImageData:(NSData *)image asName:(NSString *)name;
+(NSData *)getImageDataFromLocalFile:(NSString *)imageFileName;
+(void)addCustomAnimationInView:(UIView *)view;
@end
