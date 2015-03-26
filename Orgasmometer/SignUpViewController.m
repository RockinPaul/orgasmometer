//
//  SignUpViewController.m
//  Orgasmometer
//
//  Created by Pavel on 27.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SignUpViewController.h"
#import "ViewController.h"

@implementation SignUpViewController

- (void)viewDidLoad {
    
}

- (void)auth:(UIButton *)sender {
    if ([[self.signButton.titleLabel text] isEqualToString:@"Sign In"]) {
        [self signIn];
    } else
    if ([[self.signButton.titleLabel text] isEqualToString:@"Sign Up"]) {
        [self signUp];
    } else {
        NSLog(@"Something is wrong.");
    }
    
}

- (void)signUp {
    PFUser *user = [PFUser user];
    user.username = [self.emailTextField text];
    user.password = [self.passwordTextField text];
    user.email = [self.emailTextField text];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            ViewController *viewController = [[ViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
        } else {
            // Show the errorString somewhere and let the user try again.
            if ([error code] == 203) { // email already exists
                [self.errorLabel setText:@"Email already exists"];
            }
            if ([error code] == 125) {
                [self.errorLabel setText:@"Invalid email address"];
            }
        }
    }];
}

- (void)signIn {
    [PFUser logInWithUsernameInBackground:@"myname" password:@"mypass"
                                    block:^(PFUser *user, NSError *error) {
        if (user) {
            // Do stuff after successful login.
            ViewController *viewController = [[ViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
        } else {
            // The login failed. Check error to see why.
            if ([error code] == 101) { // email already exists
                [self.errorLabel setText:@"Wrong password"];
            }
            if ([error code] == 205) {
                [self.errorLabel setText:@"User not found"];
            }
            if ([error code] == 125) {
                [self.errorLabel setText:@"Invalid email address"];
            }
        }
    }];
}

- (void)newcomer:(UIButton *)sender {
    [self.signButton setTitle:@"Sign Up" forState:UIControlStateNormal];
}

@end