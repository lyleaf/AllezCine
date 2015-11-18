//
//  RegisterViewController.m
//  AllezCine
//
//  Created by LIUYiling on 20/07/15.
//  Copyright (c) 2015 LIUYiling. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>


@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize txtUsername;
@synthesize txtPassword;
@synthesize txtPhone;
@synthesize txtNickname;
@synthesize txtEmail;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)RegisterPressed:(id)sender {
    PFUser *user = [PFUser user];
    user.username = txtUsername.text;
    user.password = txtPassword.text;
    user.email = txtEmail.text;
    user[@"phone"] = txtPhone.text;
    user[@"nickname"] = txtNickname.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //Hoorray let them use the app now...
            //More for next..
            [self performSegueWithIdentifier:@"back_to_Login" sender:self];

        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *signupError = [[UIAlertView alloc] initWithTitle:@"Problem!" message:[NSString stringWithFormat:@"Encountered the following error: %@",errorString] delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
            [signupError show];
        }
    }];
    
    

}
@end
