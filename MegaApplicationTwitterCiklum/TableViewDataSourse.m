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


@end


@implementation TableViewDataSource

- (instancetype)initWithTableView:(UITableView *)tableView {

    if (self = [super init]) {
        [self configure:tableView];
      //  self.tweetArray = [[StoreCoordinator sharedManager]getOwnTimeLine];
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(refreshArray)
//                                                     name:@"kCLAuthorizationStatusAuthorized" object:nil];
//     
        
        
//        [self refreshArray];

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
  //  self.tweetArray = [[StoreCoordinator sharedManager]getOwnTimeLine];
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
    
    if (indexPath.row == [self.tweetArray count] - 2) {
       // self.tweetArray = [[StoreCoordinator sharedManager]getOwnTimeLineDownloadMore];
        [self.tableView reloadData];
    }
    return tempCell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"%lu",[self.tweetArray count] );
    return  50;
}
         
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    static NSString *CellIdentifier = @"SectionHeader";
//    UITableViewCell *headerView = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (headerView == nil){
//        [NSException raise:@"headerView == nil.." format:@"No cells with matching CellIdentifier loaded from your storyboard"];
//    }
//    return headerView;
//}

@end
    
