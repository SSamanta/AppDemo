//
//  RootVC.m
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "RootVC.h"
#import "WebServiceManager.h"
#import "Employee.h"

@interface RootVC ()
@property (nonatomic) NSArray *empList;
@property (weak,nonatomic) IBOutlet UITableView *tableView;
@end

@implementation RootVC

#pragma mark view methods
- (void)viewDidLoad {
    [super viewDidLoad];
	[self fetchData];
}
#pragma mark UI refreshing data source
- (void)fetchData {
    [WebServiceManager fetchEmployeeListOnCompletion:^(NSArray *fullList, NSError *error) {
        if (error) {
                // show error
            NSLog(@"Error : %@",error);
        }else {
            [self refreshUIWithDataSource:fullList];
        }
    }];
}
- (void)refreshUIWithDataSource:(NSArray *)list {
    self.empList = list;
    [self.tableView reloadData];
}
#pragma mark memory warnings
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark TableView Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.empList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmpCell" forIndexPath:indexPath];
    Employee *emp = self.empList[indexPath.row];
    cell.textLabel.text = emp.empName;
    cell.detailTextLabel.text = emp.empId;
    return cell;
}
@end
