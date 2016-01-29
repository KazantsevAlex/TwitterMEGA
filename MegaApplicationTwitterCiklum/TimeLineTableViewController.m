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
//    [self setCoreData:self.coreData];
    
}

- (void)setCoreData:(CoreDataInterface *)coreData {
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.userTableView withData:coreData];
    [self.userTableView reloadData];
}






@end
