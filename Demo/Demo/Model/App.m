//
//  App.m
//  Demo
//
//  Created by Susim on 11/25/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "App.h"

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
@end
