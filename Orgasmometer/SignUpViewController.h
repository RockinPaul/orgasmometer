//
//  SignUpViewController.h
//  Orgasmometer
//
//  Created by Pavel on 27.03.15.
//  Copyright (c) 2015 Zitech Mobile LLC. All rights reserved.
//

#ifndef Orgasmometer_SignUpViewController_h
#define Orgasmometer_SignUpViewController_h

#endif

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
//#import <ParseUI/ParseUI.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *emailTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) IBOutlet UILabel *errorLabel;
@property (nonatomic, strong) IBOutlet UIButton *signButton;

- (IBAction)newcomer:(UIButton *)sender;
- (IBAction)auth:(UIButton *)sender;
- (IBAction)reset:(UIButton *)sender;

- (void)signUp;
- (void)signIn;
- (void)presentViewController;

@end