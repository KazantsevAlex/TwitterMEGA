//
//  TimeLineTableViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TimeLineTableViewController.h"

@interface TimeLineTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@property (strong, nonatomic) TableViewDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UIButton *showPopoverButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *postTweetBarButton;
//@property (strong, nonatomic)REComposeViewController *composeViewController;

@end

@implementation TimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getLatestLoads];
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.userTableView];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor grayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(getLatestLoads)
                  forControlEvents:UIControlEventValueChanged];

}
- (IBAction)showPostTweetPopover:(id)sender {
    ComposerViewController * compose = [ComposerViewController new];
    [compose postTweet:self]; 
}

-(void)getLatestLoads
{
    [self.dataSource refreshArray: self.refreshControl];
}



@end
