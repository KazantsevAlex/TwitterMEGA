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

@end

@implementation TimeLineTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.userTableView];
    [self getLatestLoans];
//    [[TwitterAPI sharedManager] loginAction];
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor grayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(getLatestLoans)
                  forControlEvents:UIControlEventValueChanged];

}


-(void)getLatestLoans
{
    NSLog(@"Pull to refresh");
    [self.dataSource refreshArray];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}



@end
