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
    [self getLatestLoads];
    [super viewDidLoad];
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.userTableView];
   
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor grayColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(getLatestLoads)
                  forControlEvents:UIControlEventValueChanged];

}


-(void)getLatestLoads
{
    NSLog(@"Pull to refresh");
    
 
//    double delayInSeconds = 1.5;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.dataSource refreshArray];
       
        
//    });

    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}



@end
