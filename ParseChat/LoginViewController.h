//
//  LoginViewController.h
//  ParseChat
//
//  Created by Jessica Shu on 7/8/18.
//  Copyright © 2018 jessicashu7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end
