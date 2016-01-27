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
    
    [self.twitter getUserHomeTimelineWithCount:@"5" sinceID:nil block:^(id object) {
        for (NSDictionary *dict in object) {
           TweetModel *tw = [[TweetModel alloc]initWithDictionary:dict];
            [self.interface addTweet:tw];            
        }
    }];
    
    
  // NSLog(@"%@",[[[self.interface getTweet]objectAtIndex:5] valueForKey:@"text"]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"showUserTimeLine"]) {
        TimeLineTableViewController *viewContr = [segue destinationViewController];
        [viewContr setCoreData:self.interface];
    }
    
<<<<<<< HEAD
   //NSLog(@"%@",[[[self.interface getTweet]objectAtIndex:2] valueForKey:@"text"]);
=======
>>>>>>> 0263b8690f2687abeeda4220273a232639c2494f
}

@end
