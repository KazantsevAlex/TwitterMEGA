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
            [[TwitterAPI sharedManager]loginAction];
            double delayInSeconds = 2.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                
                [self performSegueWithIdentifier:@"ToProfile" sender:self];
            });
            
        } else
        {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
}
- (IBAction)loginAction:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
