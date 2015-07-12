//
//  ProposerViewController.h
//  AllezCine
//
//  Created by LIUYiling on 10/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProposerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *cine;
@property (weak, nonatomic) IBOutlet UITextField *film;
@property (weak, nonatomic) IBOutlet UITextField *time;

- (IBAction)PublierButtonPressed:(id)sender;


@end
