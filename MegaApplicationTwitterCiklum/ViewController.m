//
//  ViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)TwitterAPI *twitter;
@property (nonatomic, strong) TweetsParse *tweeterParse;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.twitter = [TwitterAPI new];
    self.tweeterParse = [[TweetsParse alloc]initWithTweetsDictionary:self.twitter];
    
    [self.twitter loginAction];
    
    [self.tweeterParse parseJsonUsertimeline:@"" cout:5];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ButtonAction:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
