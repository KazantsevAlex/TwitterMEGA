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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    [self.twitter loginAction];
}

-(void)initObjects
{
    self.twitter = [TwitterAPI new];
    self.interface = [CoreDataInterface new];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)ButtonAction:(id)sender {
    
    [self.twitter getUserHomeTimelineWithCount:@"1" sinceID:nil block:^(id object) {
        for (NSDictionary *dict in object) {
           TweetModel *tw = [[TweetModel alloc]initWithDictionary:dict];
            [self.interface addTweet:tw];
        }
    }];
    
    
    [self.twitter setUserProfile:@"ALexander" location:@"Ukraine" description:@"Set up descriotion from own app" userUrl:@"vk.com/user" block:^(id object) {
        NSLog(@"%@", object);
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showUserTimeLine"]) {
        TimeLineTableViewController *viewContr = [segue destinationViewController];
        [viewContr setCoreData:self.interface];
    }
    if([[segue identifier] isEqualToString:@"ChangeUSerInfo"])
    {
        UserProfileEditViewController *vc = [segue destinationViewController];
        [vc setTwitterApi:self.twitter];
    }

}

@end
