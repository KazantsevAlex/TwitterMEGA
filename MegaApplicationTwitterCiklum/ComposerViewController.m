//
//  ComposerViewController.m
//  
//
//  Created by Alexandr Lobanov on 2/23/16.
//
//

#import "ComposerViewController.h"

@interface ComposerViewController ()

@property (strong, nonatomic)REComposeViewController *composeViewController;
@property (strong, nonatomic)Parser *parser;

@end

@implementation ComposerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)postTweet:(id)it {
    self.parser = [[Parser alloc]init];
    self.composeViewController = [[REComposeViewController alloc] init];
    self.composeViewController.title = @"Post Tweet";
    self.composeViewController.hasAttachment = NO;
    [self.composeViewController presentFromRootViewController];

    self.composeViewController.completionHandler = ^(REComposeViewController *composeViewController, REComposeResult result) {
        [composeViewController dismissViewControllerAnimated:YES completion:nil];
        

        
        if (result == REComposeResultCancelled) {
            NSLog(@"Cancelled");
        }

        if (result == REComposeResultPosted) {
            if ([[Parser sharedManager]isValidStatusText:composeViewController.text]) {
                [[StoreCoordinator sharedManager]postStatus:composeViewController.text];
                NSLog(@"If text: %@", composeViewController.text);
            }
            else
            {
                AlertViewController *aler = [AlertViewController new];
                [aler alert:it];
            }
   
        }
    };
}
@end
