//
//  RootVC.m
//  Demo
//
//  Created by Susim on 10/30/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "RootVC.h"
#import "WebServiceManager.h"
#import "App.h"
#import "CustomAppCell.h"
@interface RootVC ()
@property (nonatomic) NSArray *apps;
@property (weak,nonatomic) IBOutlet UITableView *tableView;
@end

@implementation RootVC

#pragma mark view methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Free App";
	[self fetchData];
}
#pragma mark UI refreshing data source
- (void)fetchData {
    [WebServiceManager fetchAppsOnCompletion:^(NSArray *fullList, NSError *error) {
        if (error) {
                // show error
            NSLog(@"Error : %@",error);
        }else {
            [self refreshUIWithDataSource:fullList];
        }
    }];
}
- (void)refreshUIWithDataSource:(NSArray *)list {
    self.apps = list;
    [self.tableView reloadData];
}
#pragma mark memory warnings
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark TableView Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.apps.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomAppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomAppCell" forIndexPath:indexPath];
    App *app = self.apps[indexPath.row];
    [cell setUIWithDataSource:app];
    return cell;
}
@end
