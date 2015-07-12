//
//  AccueilTableViewCell.h
//  AllezCine
//
//  Created by LIUYiling on 10/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccueilTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *faceView;
@property (weak, nonatomic) IBOutlet UILabel *cineLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
