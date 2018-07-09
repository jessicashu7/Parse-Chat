//
//  LoginViewController.m
//  ParseChat
//
//  Created by Jessica Shu on 7/8/18.
//  Copyright © 2018 jessicashu7. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(id)sender {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameTextField.text;
    // newUser.email = self.emailField.text;
    newUser.password = self.passwordTextField.text;
    
    // make sure password and username set
    if ([self.usernameTextField.text isEqual:@""] || [self.passwordTextField.text isEqual:@""] ){
        [self alertControlWithTitleAndMessage:@"Sign Up Error" message:@"Please make sure you entered a username and password"];
    }
    else {
        // call sign up function on the object
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
            if (error != nil){
                NSLog(@"Error: %@", error.localizedDescription);
                [self alertControlWithTitleAndMessage:@"Sign Up Error" message:@"Username may have been taken. Please try again"];
            }
            else {
                NSLog(@"User registered successfully");
                // manually segue to logged in view
                
            }
        }];
    }


}


- (IBAction)loginuser:(id)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
        if (error != nil){
            NSLog(@"User log in failed: %@", error.localizedDescription);
        [self alertControlWithTitleAndMessage:@"Login Error" message:@"Username and password does not match"];
        }
        else {
            NSLog(@"User logged in successfully");
            
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
            // display view controller that needs to shown after successful login

        }
    }];
    
}

-(void)alertControlWithTitleAndMessage:(NSString*)title message:(NSString*)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // create OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // handle response here
    }];
    
    // add the OK action to the alert controller
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:^{
        // optional code for what happens after the alert controller has finished presenting
    }];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
