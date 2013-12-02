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
+ (void)storeImageData:(NSData *)image asName:(NSString *)name {
    NSString *imageFilePath = [[self localAppFilePath] stringByAppendingString:name];
    [image writeToFile:imageFilePath atomically:YES];
}
+(NSData *)getImageDataFromLocalFile:(NSString *)imageFileName {
    NSString *imageFilePath = [[self localAppFilePath] stringByAppendingString:imageFileName];
    NSData *imageData = [NSData dataWithContentsOfFile:imageFilePath];
    return imageData;
}
+(void)addCustomAnimationInView:(UIView *)view {
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    view.layer.shadowColor = [[UIColor blackColor]CGColor];
    view.layer.shadowOffset = CGSizeMake(10, 10);
    view.alpha = 0;
    view.layer.transform = rotation;
    view.layer.anchorPoint = CGPointMake(0, 0.5);
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    view.layer.transform = CATransform3DIdentity;
    view.alpha = 1;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}
@end
