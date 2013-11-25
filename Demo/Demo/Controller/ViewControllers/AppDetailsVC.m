//
//  AppDetailsVC.m
//  Demo
//
//  Created by Susim on 11/25/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "AppDetailsVC.h"

@interface AppDetailsVC ()
@property (weak,nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) App *app;
@end

@implementation AppDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refershUI];
}
- (void)refershUI {
    self.title =  self.app.appName;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.app.appDetailsLink]]];
}
- (void)setDataSource:(App*)app {
    self.app = app;
}
@end
