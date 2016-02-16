//
//  TableViewDataSourse.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/26/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TableViewDataSourse.h"

@interface TableViewDataSource ()

//@property (strong, nonatomic) CoreDataInterface *interfaceQ;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *tweetArray;
@property (nonatomic, strong) __block NSString *sinceID;
@property (nonatomic, strong)StoreCoordinator *storeCoordinator;

@end


@implementation TableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView {

    if (self = [super init]) {
        [self configure:tableView];
//        self.tweetArray = (NSMutableArray *)[[CoreDataInterface sharedManager]getUserHomeTimeline];
        self.storeCoordinator = [StoreCoordinator new];
        self.tweetArray = [self.storeCoordinator getOwnTimeLine];
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

- (void)refreshArray {
    
    [self.storeCoordinator getOwnTimeLinePullToRefresh];

//    NSString *count = @"20";
//    __block NSUInteger i = 0;
//    [[TwitterAPI sharedManager]  getUserHomeTimelineWithCount:count sinceID:@"" maxID:self.sinceID block:^(id object) {
//        for (NSDictionary *dict in object) {
//            [[CoreDataInterface sharedManager]addTweetWithDictionary:dict];
//            i++;
//            if ([object count] == i) {
//                self.sinceID = dict[@"id_str"];
//            }
//        }
//    }];
//    self.tweetArray = (NSMutableArray *)[[CoreDataInterface sharedManager] getUserHomeTimeline];
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
        [cell fillCellWith:tweet];
        tempCell = cell;
    }
    return tempCell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  [[self.storeCoordinator getOwnTimeLine]count];//[[CoreDataInterface sharedManager] tweetsInStore];
}
         
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 185;
//}

- (void)scrollViewDidScroll: (UIScrollView *)scroll {
    // UITableView only moves in one direction, y axis
    CGFloat currentOffset = scroll.contentOffset.y;
    CGFloat maximumOffset = scroll.contentSize.height - scroll.frame.size.height;
    
    if (maximumOffset - currentOffset <= 150.0) {
        //[self.storeCoordinator getOwnTimeLineDownloadMore];
    }
    // Change 10.0 to adjust the distance from bottom
    if (maximumOffset - currentOffset <= 10.0) {
       // NSLog(@"download more");
    }
}


@end
    
