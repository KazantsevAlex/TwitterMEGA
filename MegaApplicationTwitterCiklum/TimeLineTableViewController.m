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
@property (nonatomic,strong) CoreDataInterface *interface;

@end

@implementation TimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setCoreData:(CoreDataInterface *)coreData {
    self.interface = coreData;
}






@end
