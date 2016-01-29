//
//  TableViewDataSourse.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/26/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TableViewDataSourse.h"

@interface TableViewDataSource ()

@property (strong, nonatomic) CoreDataInterface *interfaceQ;
@property (strong, nonatomic) UITableView *tableView;

@end


@implementation TableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView withData:(CoreDataInterface *)interface {

    if (self = [super init]) {
        [self configure:tableView];
        self.interfaceQ = interface;

    }
    return self;
}

- (void)configure:(UITableView *)tableView {
    
<<<<<<< HEAD
    tableView.dataSource  = self;
    tableView.delegate = self;
    
//    [tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil]
//    forCellReuseIdentifier:NSStringFromClass([TweetTableViewCell class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"TweetTableViewCell";
    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", self.tweetObjects.text];

        
//    [cell fillCellWith:[[self.interfaceQ getTweet] objectAtIndex:indexPath.row]];
    
//    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TweetTableViewCell class])];
//    cell = [[TweetTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TweetTableViewCell"];
//    [cell fillCellWith:[[self.interface getTweet] objectAtIndex:indexPath.row]];
    
//    [cell fillCellWith:[[self.interface getTweet] objectAtIndex:indexPath.row];

    
    
//    TweetModel *tweetObject = [self.tweetDataObjects objectAtIndex:indexPath.row];
//    NSLog(@"%@", tweetObject);
    
    
    return cell;
=======
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
>>>>>>> 13ff556578d54e5dfc72f807d70c39f41fc23a8f
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
<<<<<<< HEAD
//    NSLog(@"%lu", (unsigned long)[self.interface tweetsInStore]);
    return 5;//[self.interfaceQ tweetsInStore];
=======
    return 0;
>>>>>>> 13ff556578d54e5dfc72f807d70c39f41fc23a8f
}


@end
    
