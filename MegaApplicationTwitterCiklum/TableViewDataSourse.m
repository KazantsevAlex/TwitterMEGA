//
//  TableViewDataSourse.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/26/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TableViewDataSourse.h"

@interface TableViewDataSource ()

@property (strong, nonatomic) CoreDataInterface *interface;
@property (strong, nonatomic) UITableView *tableView;

@end


@implementation TableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView withData:(CoreDataInterface *)interface {
    
    if (self = [super init]) {
        [self configure:tableView];
        self.interface = interface;
    }
    return self;
}

- (void)configure:(UITableView *)tableView {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}




@end

