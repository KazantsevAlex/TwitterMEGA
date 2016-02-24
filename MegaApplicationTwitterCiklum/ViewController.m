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
@property (nonatomic, strong) __block NSString *sinceID;

@end

@implementation ViewController
- (IBAction)action:(id)sender {
    
    __block NSMutableArray *usersID;
    __block NSMutableArray *followersArray;
    [[TwitterAPI sharedManager]getUserFriend:^(id object) {
        usersID = [NSMutableArray arrayWithCapacity:[object[@"ids"] count]];
        NSLog(@"%lu",[object[@"ids"] count]);
        
        for (int i = 0; i < [object[@"ids"] count]; i++ )
        {
            
               // [usersID addObject:[object[@"users"]objectAtIndex:i][@"id_str"]];
            [usersID addObject:[object[@"ids"]objectAtIndex:i]];
           
        }
        [[TwitterAPI sharedManager]usersLookupWithIds:usersID block:^(id object)
         {
             for (NSDictionary *dict in object)
             {
                 [[CoreDataInterface sharedManager]addUserWithDictionary:dict];
                 
             }
             for (int i = 0; i < [usersID count]; i++)
             {
                 User *k =  [[CoreDataInterface sharedManager]getUserWithId:[NSString stringWithFormat:@"%@",[usersID objectAtIndex:i]]];
                 //[followersArray addObject:k];
             }
         }];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    self.sinceID = @"";
    [[TwitterAPI sharedManager] loginAction];
}

-(void)initObjects {
    
    self.twitter = [TwitterAPI new];
    self.interface = [CoreDataInterface new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

