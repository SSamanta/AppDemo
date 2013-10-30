//
//  Employee.h
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject
@property (nonatomic) NSString *empId;
@property (nonatomic) NSString *empName;
- (id)initWithDictionary:(NSDictionary *)empDict ;
@end
