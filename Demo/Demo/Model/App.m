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
#define kAppTitle	@"appTitle"
#define kAppRights	@"appRights"
#define kAppDescription	@"appDescription"

#define kLabelKey @"label"
#define kCategoryKey	@"category"
#define kNameKey	@"im:name"
#define kAttributesKey	@"attributes"
#define kImageKey	@"im:image"
#define kLinkKey	@"link"
#define kHREFKey	@"href"
#define kTitleKey	@"title"
#define kRightsKey	@"rights"
#define kSummaryKey	@"summary"

@implementation App
- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.appName = dict [kNameKey][kLabelKey];
        self.appCategoryName = dict [kCategoryKey][kAttributesKey][kLabelKey];
        self.appTitle = dict [kTitleKey][kLabelKey];
        self.appRights = dict [ kRightsKey][kLabelKey];
        self.appDescription = dict [kSummaryKey] [kLabelKey];
        NSArray *images = dict [kImageKey];
        self.appIconLink = images[0][kLabelKey];
        self.appDetailsLink = dict [kLinkKey][kAttributesKey][kHREFKey];
    }
    return self;
}

#pragma mark NSCoding
- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_appName forKey:kAppName];
    [encoder encodeObject:_appCategoryName forKey:kAppCategoryName];
    [encoder encodeObject:_appIconLink forKey:kAppIconLink];
    [encoder encodeObject:_appDetailsLink forKey:kAppDetailsLink];
    [encoder encodeObject:_appTitle forKey:kAppTitle];
    [encoder encodeObject:_appRights forKey:kAppRights];
    [encoder encodeObject:_appDescription forKey:kAppDescription];

}

- (id)initWithCoder:(NSCoder *)decoder {
    self.appName = [decoder decodeObjectForKey:kAppName];
    self.appCategoryName = [decoder decodeObjectForKey:kAppCategoryName];
    self.appIconLink = [decoder decodeObjectForKey:kAppIconLink];
    self.appDetailsLink = [decoder decodeObjectForKey:kAppDetailsLink];
    self.appTitle = [decoder decodeObjectForKey:kAppTitle];
    self.appRights = [decoder decodeObjectForKey:kAppRights];
    self.appDescription = [decoder decodeObjectForKey:kAppDescription];
    return self;
}
@end
