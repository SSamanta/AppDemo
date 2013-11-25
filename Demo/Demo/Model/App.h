//
//  App.h
//  Demo
//
//  Created by Susim on 11/25/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject
@property (nonatomic) NSString *appName;
@property (nonatomic) NSString *appCategoryName;
- (id)initWithDictionary:(NSDictionary *)dict;
@end
