//
//  CustomAppCell.m
//  Demo
//
//  Created by Susim on 11/25/13.
//  Copyright (c) 2013 Susim. All rights reserved.
//
#import "WebServiceManager.h"
#import "CustomAppCell.h"
#import "UtilityManager.h"
@interface CustomAppCell()
@property (weak,nonatomic) IBOutlet UILabel *appNameLbl;
@property (weak,nonatomic) IBOutlet UILabel *appCategoryNameLbl;
@property (weak,nonatomic) IBOutlet UIImageView *appIconImageView;
@end
@implementation CustomAppCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setUIWithDataSource:(App *)app {
    self.appNameLbl.text = app.appName;
    self.appCategoryNameLbl.text = app.appCategoryName;
    NSData *localImageData = [UtilityManager getImageDataFromLocalFile:[NSString stringWithFormat:@"%@.png",app.appName]];
    if (localImageData) {
        self.appIconImageView.image = [UIImage imageWithData:localImageData];
    }else {
        [WebServiceManager fetchImageDataWithLink:app.appIconLink OnCompletion:^(NSData *data, NSError *error) {
            if (!error) {
                [UtilityManager storeImageData:data asName:[NSString stringWithFormat:@"%@.png",app.appName]];
                self.appIconImageView.image = [UIImage imageWithData:data];
            }else {
                    // show place holder image here
            }
        }];
    }
}
@end
