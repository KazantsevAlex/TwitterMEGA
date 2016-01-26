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
@property (nonatomic, strong) NSManagedObject *context;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    
    [self.twitter loginAction];

    // Do any additional setup after loading the view, typically from a nib.

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
    
    [self.twitter getUserHomeTimelineWithCount:@"20" sinceID:nil block:^(id object) {
        for (NSDictionary *dict in object) {
           TweetModel *tw = [[TweetModel alloc]initWithDictionary:dict];
            [self.interface addTweet:tw];
        }
    }];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                                   message:@"This is an alert."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
   NSLog(@"%@",[[[self.interface getTweet]objectAtIndex:5] valueForKey:@"text"]);
}

@end
