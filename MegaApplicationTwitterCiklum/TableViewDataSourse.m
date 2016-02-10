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
@property (nonatomic, strong) __block NSString *sinceID;

@end


@implementation TableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView {

    if (self = [super init]) {
        [self configure:tableView];
        self.tweetArray = (NSMutableArray *)[[CoreDataInterface sharedManager]getUserHomeTimeline];

        [self refreshArray];

    }
    return self;
}

- (void)configure:(UITableView *)tableView {
    
    tableView.dataSource  = self;
    tableView.delegate = self;
    [tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TweetTableViewCell class])];
    [tableView registerNib:[UINib nibWithNibName:@"TweetWithImageTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TweetWithImageTableViewCell class])];
}

-(void)refreshArray
{
    
    NSString *count = @"20";
    __block NSUInteger i = 0;
    [[TwitterAPI sharedManager]  getUserHomeTimelineWithCount:count sinceID:@"" maxID:self.sinceID block:^(id object) {
        for (NSDictionary *dict in object) {
            [[CoreDataInterface sharedManager]addTweetWithDictionary:dict];
            i++;
            if ([object count] == i) {
                self.sinceID = dict[@"id_str"];
            }
        }
    }];
    self.tweetArray = (NSMutableArray *)[[CoreDataInterface sharedManager] getUserHomeTimeline];
    //[[CoreDataInterface sharedManager]clearTweetStore];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Tweet *tweet = [self.tweetArray objectAtIndex:indexPath.row];
    
    UITableViewCell *tempCell;
    
    if (tweet.mediaUrl) {
        tempCell = nil;
        TweetWithImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TweetWithImageTableViewCell class])];
        [cell fillCellWith:tweet];
        tempCell = cell;
        
    }
    else {
        tempCell = nil;
        TweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TweetTableViewCell class])];
        tempCell = cell;
        [cell fillCellWith:tweet];
        
    }
    
    
    return tempCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[CoreDataInterface sharedManager] tweetsInStore];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 300;
//    if ( [[[tableView cellForRowAtIndexPath:indexPath]reuseIdentifier]isEqualToString:NSStringFromClass([TweetTableViewCell class])]) {
//        NSLog(@"tweet");
//        height = 185;
//    }
//    if ([[[tableView cellForRowAtIndexPath:indexPath]reuseIdentifier]isEqualToString:NSStringFromClass([TweetWithImageTableViewCell class])]) {
//        NSLog(@"media");
//        height =300;
//    }
//   
    return height;
}

- (void)scrollViewDidScroll: (UIScrollView *)scroll {
    // UITableView only moves in one direction, y axis
    CGFloat currentOffset = scroll.contentOffset.y;
    CGFloat maximumOffset = scroll.contentSize.height - scroll.frame.size.height;
    
    if (maximumOffset - currentOffset <= 150.0) {
       // NSLog(@"Endpoint more");
    }
    // Change 10.0 to adjust the distance from bottom
    if (maximumOffset - currentOffset <= 10.0) {
       // NSLog(@"download more");
    }
}


@end
    
