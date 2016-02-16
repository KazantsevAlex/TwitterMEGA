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
@property(nonatomic, strong)NSString *currernUserID;
@property (nonatomic, strong) TWTRAPIClient *apiClient;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TWTRLogInButton* logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession* session,
                                                                                NSError* error) {
        if (session) {
            [[TwitterAPI sharedManager]loginAction];
            self.currernUserID = session.userID;
            self.apiClient = [[TWTRAPIClient alloc]initWithUserID:self.currernUserID];
            [self performSegueWithIdentifier:@"ToProfile" sender:self];
    
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
    
    
//        TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
//
//        if (session) {
//            [self performSegueWithIdentifier:@"ToProfile" sender:self];
//            NSLog(@"Twitter signed in as - name = %@", [session userName]);
//            
//            [[[Twitter sharedInstance] APIClient] loadUserWithID:[session userID]
//                                                      completion:^(TWTRUser *user,
//                                                                   NSError *error)
//            
//             {
//                 if (![error isEqual:nil]) {
//                     self.apiClient = [[TWTRAPIClient alloc]initWithUserID:self.currernUserID];
//                     NSLog(@"Twitter info - user = %@ ",user);
//                
//                 } else {
//                     NSLog(@"Twitter error getting profile : %@", [error localizedDescription]);
//                 }
//             }];
//            
//        } else {
//            NSLog(@"Twitter error signed in : %@", [error localizedDescription]);
//        }
//    }];
//    logInButton.center = self.view.center;
//    [self.view addSubview:logInButton];

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
