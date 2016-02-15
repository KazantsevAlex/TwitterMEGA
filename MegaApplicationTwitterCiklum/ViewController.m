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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    self.sinceID = @"";
    [[TwitterAPI sharedManager] loginAction];
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

- (IBAction)postStatusAction:(id)sender {
    
    //    [[TwitterAPI sharedManager]postStatusWithText:@"Do you know 'tweet' in  REST API called 'status'?" block:^(id object) {
    //        NSLog(@"object %@", object);
    //    }];
}
- (IBAction)likeButtonAction:(id)sender {
    
    [ [TwitterAPI sharedManager]TESTs:@"s" block:^(id object) {
        NSLog(@"%@",object[@"id"]);
    }];
}


- (IBAction)ButtonAction:(id)sender {
    
    
//    
//  [[TwitterAPI sharedManager]getTimelineUserWithID:@"2941100471" count:@"20" sinceID:@"" maxID:@"" block:^(id object) {
//      for (NSDictionary *dict in object) {
//          NSLog(@"count %lu --- twxt %@", [object count], [dict valueForKey:@"text"]) ;
//      }
//      
//  }];
    
    __block NSMutableArray *usersID;
[[TwitterAPI sharedManager]getUserFriend:^(id object) {
    
    usersID = [NSMutableArray arrayWithCapacity:[object count]];
    for (int i = 0; i < [object[@"ids"] count]; i++ )
    {
        if (usersID != nil) {
        //[usersID addObject:[object[@"users"]objectAtIndex:i][@"id_str"]];
        [usersID addObject:[object[@"ids"]objectAtIndex:i]];
        }
        else
        {
            NSLog(@"user is NIL");
        }
    }
//    
    NSLog(@"%@", usersID);
//
    
        [[TwitterAPI sharedManager]usersLookupWithIds:usersID block:^(id object) {
            for (NSDictionary *dict in object) {
                [[CoreDataInterface sharedManager]addTweetWithDictionary:dict];
            }
        }];
    
    for (int i = 0; i < [usersID count]; i++) {
     User *k =  [[CoreDataInterface sharedManager]getUserWithId:[NSString stringWithFormat:@"%@",[usersID objectAtIndex:i]]];
        NSLog(@"name = %@",k.name );
    }
}];
    
    
    //    StoreCoordinator *store = [StoreCoordinator new];
//    
//    [store setFavoritedTweetWithId:@"698989521728356352" favorited:false];
    
//    NSString *count = @"70";
//    __block NSUInteger i = 0;
//    [[TwitterAPI sharedManager]  getUserHomeTimelineWithCount:count sinceID:@"" maxID:@"" block:^(id object) {
//        for (NSDictionary *dict in object) {
//            [[CoreDataInterface sharedManager]addTweetWithDictionary:dict];
//            i++;
//            if ([object count] == i) {
//                self.sinceID = dict[@"id_str"];
//            }
//            
//            // NSLog(@"IMAGE SEARCH %@",dict );
//        }
//    }];
    
    
    //    [[TwitterAPI sharedManager]  getUserFollowers:@"20"block:^(id object) {
    //        for (NSArray *dict in object) {
    //            NSLog(@"Start of tweet OBJECT---- %@  ------END OF OBJECT",[dict objectAtIndex:1][@"users"]);
    //        }
    //    }];
    
    
    //[[dict valueForKey:@"user"]valueForKey:@"description"]
    //   NSLog(@"%@",[[[self.interface getTweet]objectAtIndex:5] valueForKey:@"text"]);
    
    //    [self.twitter setUserProfile:@"ALexander" location:@"Ukraine" description:@"Set up descriotion from own app" userUrl:@"vk.com/user" block:^(id object) {
    //        NSLog(@"%@", object);
    //    }];
    
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    if ([[segue identifier] isEqualToString:@"showUserTimeLine"]) {
//        TimeLineTableViewController *viewContr = [segue destinationViewController];
//        [viewContr setCoreData:self.interface];
//    }
//    if([[segue identifier] isEqualToString:@"ChangeUSerInfo"])
//    {
//        UserProfileEditViewController *vc = [segue destinationViewController];
//       
//    }
//
//}

@end

