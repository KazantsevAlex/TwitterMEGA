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
@property (strong, nonatomic) NSMutableArray *tweetArray;

@end


@implementation TableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView  {

    if (self = [super init]) {
        [self configure:tableView];
        self.tweetArray = (NSMutableArray *)[[CoreDataInterface sharedManager] getTweet];

    }
    return self;
}

-(void)refreshArray
{
    self.tweetArray = (NSMutableArray *)[[CoreDataInterface sharedManager] getTweet];
}

- (void)configure:(UITableView *)tableView {
    
    tableView.dataSource  = self;
    tableView.delegate = self;
    
    [tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TweetTableViewCell class])];
    
    [tableView registerNib:[UINib nibWithNibName:@"TweetWithImageTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TweetWithImageTableViewCell class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    Tweet *tweet = [self.tweetArray objectAtIndex:indexPath.row];
    
    UITableViewCell *tempCell;
    
//    if (tweet.mediaURL) {
//        tempCell = nil;
//        TweetWithImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TweetWithImageTableViewCell class])];
//        [cell fillCellWith:tweet];
//        tempCell = cell;
//        
//    }
//    else {
//        tempCell = nil;
//        TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TweetTableViewCell class])];
//        tempCell = cell;
//        [cell fillCellWith:tweet];
//        NSLog(@"%@", tweet.mediaURL);
//
//    }
    

        
//    [cell fillCellWith:[[self.interfaceQ getTweet] objectAtIndex:indexPath.row]];
    
//    TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TweetTableViewCell class])];
//    cell = [[TweetTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TweetTableViewCell"];
//    [cell fillCellWith:[[self.interface getTweet] objectAtIndex:indexPath.row]];
    
//    [cell fillCellWith:[[self.interface getTweet] objectAtIndex:indexPath.row];

    
    
//    TweetModel *tweetObject = [self.tweetDataObjects objectAtIndex:indexPath.row];
//    NSLog(@"%@", tweetObject);
    
    
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;//[[CoreDataInterface sharedManager] tweetsInStore];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.f;
}


@end
    
