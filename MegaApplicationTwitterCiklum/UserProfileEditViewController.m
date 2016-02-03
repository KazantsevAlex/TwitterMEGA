//
//  UserProfileEditViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/28/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "UserProfileEditViewController.h"

@interface UserProfileEditViewController ()

@property (weak, nonatomic) IBOutlet UITableView *userTweetsTableView;
@property (weak, nonatomic) IBOutlet UIImageView *userBackroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userPictireImageView;
@property (weak, nonatomic) IBOutlet UIButton *posttweetButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (nonatomic,strong) CoreDataInterface *interface;
@property (nonatomic, strong) TableViewDataSource *dataSource;

@end

@implementation UserProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.userTweetsTableView];
    
//    [[TwitterAPI sharedManager] getTimelineUserWithID:@"" count:@"5" sinceID:@"" maxID:@""  block:^(id object) {
//     for (NSDictionary *dict in object) {
//        // TweetModel *tw = [[TweetModel alloc]initWithDictionary:dict];
//         //[[CoreDataInterface sharedManager] addTweet:tw];
//         NSLog(@"USER ID---- %@  ------END OF OBJECT", dict);
//     }
//    }];
    
//    [[TwitterAPI sharedManager]setUserProfile:@"Alexander" location:@"Ukraine" description:@"change description" userUrl:@"vk.com/username" block:^(id object) {
//        NSLog(@"%@", object);
//    }];
//    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
