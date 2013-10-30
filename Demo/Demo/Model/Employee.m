//
//  Employee.m
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "Employee.h"

@implementation Employee
- (id)initWithDictionary:(NSDictionary *)empDict {
    if (self = [super init]) {
        self.empId = empDict[@"emp_id"];
        self.empName = empDict [@"emp_name"];
    }
    return self;
}
@end
