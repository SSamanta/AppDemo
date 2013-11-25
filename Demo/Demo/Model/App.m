//
//  App.m
//  Demo
//
//  Created by Susim on 11/25/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "App.h"
#define kAppName	@"appName"
#define kAppCategoryName	@"appCategoryName"
#define kAppIconLink	@"appIconLink"
#define kAppDetailsLink	@"appDetailsLink"
@implementation App
- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.appName = dict [@"im:name"][@"label"];
        self.appCategoryName = dict [@"category"][@"attributes"][@"label"];
        NSArray *images = dict [@"im:image"];
        self.appIconLink = images[0][@"label"];
        self.appDetailsLink = dict [@"link"][@"attributes"][@"href"];
    }
    return self;
}

#pragma mark NSCoding
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_appName forKey:kAppName];
    [encoder encodeObject:_appCategoryName forKey:kAppCategoryName];
    [encoder encodeObject:_appIconLink forKey:kAppIconLink];
    [encoder encodeObject:_appDetailsLink forKey:kAppDetailsLink];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self.appName = [decoder decodeObjectForKey:kAppName];
    self.appCategoryName = [decoder decodeObjectForKey:kAppCategoryName];
    self.appIconLink = [decoder decodeObjectForKey:kAppIconLink];
    self.appDetailsLink = [decoder decodeObjectForKey:kAppDetailsLink];
    return self;
}
@end
