//
//  LoginViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/31/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TWTRLogInButton* logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession* session,
    NSError* error) {
        if (session) {
            [[TwitterAPI sharedManager]loginAction];
            [self performSegueWithIdentifier:@"ToProfile" sender:self];
            
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
}


//- (IBAction)loginAction:(id)sender {
//    
//        [[Twitter sharedInstance]logInWithCompletion:^(TWTRSession* session, NSError* error) {
//            if (session) {
//                [self performSegueWithIdentifier:@"ToProfile" sender:self];
//                NSLog(@"signed in as %@", [session userName]);
//            } else {
//                NSLog(@"error: %@", [error localizedDescription]);
//            }
//        }];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
