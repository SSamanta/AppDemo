//
//  AppDetailsVC.m
//  Demo
//
//  Created by Susim on 11/25/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//

#import "AppDetailsVC.h"
#import "WebServiceManager.h"

@interface AppDetailsVC ()
@property (weak,nonatomic) IBOutlet UILabel *appTitleLbl;
@property (weak,nonatomic) IBOutlet UILabel *appRightsLbl;
@property (weak,nonatomic) IBOutlet UILabel *appDescriptionLbl;
@property (weak,nonatomic) IBOutlet UIImageView *appIconImageView;
@property (nonatomic) App *app;
@end

@implementation AppDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDetailsUI];
}
- (void)setDetailsUI {
    self.title = self.app.appName;
    self.appTitleLbl.text = self.app.appTitle;
    self.appRightsLbl.text = [NSString stringWithFormat:@"By %@", self.app.appRights];
    self.appDescriptionLbl.text = self.app.appDescription;
    [WebServiceManager fetchImageDataWithLink:self.app.appIconLink OnCompletion:^(NSData *data, NSError *error) {
        if (!error) {
            self.appIconImageView.image = [UIImage imageWithData:data];
        }else {
                // show place holder image here
        }
    }];
}
- (void)setDataSource:(App*)app {
    self.app = app;
}
@end
