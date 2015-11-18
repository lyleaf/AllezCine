//
//  LoginViewController.m
//  AllezCine
//
//  Created by LIUYiling on 19/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//
#import <Parse/Parse.h>
#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize txtUsername;
@synthesize txtPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [txtUsername setAutocorrectionType:UITextAutocorrectionTypeNo];
    [txtPassword setSecureTextEntry:YES];
    [txtPassword setAutocorrectionType:UITextAutocorrectionTypeNo];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"purple_bubbles.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginButtonPressed:(id)sender {
    
    [PFUser logInWithUsernameInBackground:txtUsername.text password:txtPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"Login SUCCESS");

                                            
                                            [self performSegueWithIdentifier:@"login_success" sender:self];

                                        } else {
                                            // The login failed. Check error to see why.
                                            [self alertStatus:@"Connection Failed" :@"Username or Password doesn't exist." :0];
                                        }
                                    }];
}

- (IBAction)RegisterButtonPressed:(id)sender {
     [self performSegueWithIdentifier:@"register_chosen" sender:self];
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

@end
