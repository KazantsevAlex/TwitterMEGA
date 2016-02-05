//
//  LoginViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/31/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TWTRLogInButton* logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession* session,
    NSError* error) {
        if (session) {
            [self performSegueWithIdentifier:@"ToProfile" sender:self];
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
