//
//  ajouterViewController.h
//  AllezCine
//
//  Created by LIUYiling on 11/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ajouterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *time;
@property (weak, nonatomic) IBOutlet UITextField *cine;
@property (weak, nonatomic) IBOutlet UITextField *film;
- (IBAction)PublierButtonPressed:(id)sender;

@end
