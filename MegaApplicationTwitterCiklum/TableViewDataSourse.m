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
    
    tableView.dataSource  = self;
    tableView.delegate = self;
    
    [tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TweetTableViewCell class])];
    
//    [tableView registerNib:[UINib nibWithNibName:@"TweetWithImageTableViewCell" bundle:nil]
//    forCellReuseIdentifier:NSStringFromClass([TweetWithImageTableViewCell class])];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TweetTableViewCell class])];
    
    TweetModel *tweetObject = [self.tweetDataObjects objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", tweetObject.text];

//    [cell fillCellWith:[[self.interface getTweet] objectAtIndex:indexPath.row]];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", (unsigned long)[self.interface tweetsInStore]);
    return [self.interface tweetsInStore];
}




@end

