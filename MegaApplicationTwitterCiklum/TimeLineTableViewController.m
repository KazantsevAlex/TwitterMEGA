//
//  TimeLineTableViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TimeLineTableViewController.h"

@interface TimeLineTableViewController ()

<<<<<<< HEAD
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@property (strong, nonatomic) TableViewDataSource *dataSource;
@property (strong, nonatomic) CoreDataInterface *coreData;

=======
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) CoreDataInterface *interface;
>>>>>>> 13ff556578d54e5dfc72f807d70c39f41fc23a8f

@end

@implementation TimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
<<<<<<< HEAD
//    [self setCoreData:self.coreData];
    
}

- (void)setCoreData:(CoreDataInterface *)coreData {
    self.dataSource = [[TableViewDataSource alloc]initWithTableView:self.userTableView withData:coreData];
    [self.userTableView reloadData];
=======
}

- (void)setCoreData:(CoreDataInterface *)coreData {
    self.interface = coreData;
>>>>>>> 13ff556578d54e5dfc72f807d70c39f41fc23a8f
}






@end
