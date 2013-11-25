//
//  UtilityManager.m
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "UtilityManager.h"

@implementation UtilityManager
+(void)archiveAppToLocalFile:(NSArray *)apps {
    NSString *localFilePath = [self localAppFilePath];
    [NSKeyedArchiver archiveRootObject:apps toFile:localFilePath];
}
+(NSArray *)getAppsFromLocalFile {
    NSString *localFilePath = [self localAppFilePath];
    NSArray *dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile:localFilePath];
    return dataArray;
}
+ (NSString *)localAppFilePath {
    NSString *docDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [docDir stringByAppendingPathComponent:@"apps.plist"];
}
@end
