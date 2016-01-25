//
//  ViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) TwitterAPI *twitter;
@property (nonatomic, strong) CoreDataInterface *interface;

@end

@implementation ViewController


-(void)initObjects
{
    self.interface = [CoreDataInterface new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.twitter = [[TwitterAPI alloc]init];
    [self.twitter loginAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)ButtonAction:(id)sender {
    
    
    
    [self.twitter getUserHomeTimelineWithCount:@"3" sinceID:nil block:^(id object) {
        //NSLog(@"%@", object);
        for (NSDictionary *dict in object) {
            TweetParse *wtwet = [[TweetParse alloc]initWithDictionary:dict];
            [wtwet setupTweetData];
            NSLog(@"dict %@", wtwet.text );
        }
        
    }];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
