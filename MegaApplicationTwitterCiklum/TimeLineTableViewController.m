//
//  TimeLineTableViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TimeLineTableViewController.h"

@interface TimeLineTableViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TableViewDataSource *dataSource;
@property (strong, nonatomic) CoreDataInterface *coreData;


@end

@implementation TimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.tableView withData:self.coreData];
    [self.tableView reloadData];
}

- (void)setCoreData:(CoreDataInterface *)coreData {
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.tableView withData:self.coreData];
    [self.tableView reloadData];
}






@end
