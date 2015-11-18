//
//  LoginViewController.h
//  AllezCine
//
//  Created by LIUYiling on 19/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
- (IBAction)LoginButtonPressed:(id)sender;
- (IBAction)RegisterButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;


@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@end
