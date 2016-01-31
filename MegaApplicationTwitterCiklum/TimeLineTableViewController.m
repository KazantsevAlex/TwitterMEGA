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
@property (strong, nonatomic) CoreDataInterface *coreData;

@end

@implementation TimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.userTableView];
    [self.userTableView reloadData];
    NSLog(@"Init dataSourse");
    
}

- (void)setCoreData {

}




@end
