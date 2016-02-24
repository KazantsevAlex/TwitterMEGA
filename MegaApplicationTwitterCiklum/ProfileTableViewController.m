//
//  ProfileTableViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 2/5/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ProfileTableViewController.h"


@interface ProfileTableViewController ()

@property (strong, nonatomic) NSMutableArray *tweetArray;
@property (strong, nonatomic) StoreCoordinator *storeCoordinator;
@property (strong, nonatomic) IBOutlet UITableView *tableViewUser;

@end

@implementation ProfileTableViewController

static NSString* _userID;

+ (void)setUserIDTV:(NSString*)value {
    
    _userID = value;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self configure:self.tableViewUser];
    [self configTableviewFrame];
    self.storeCoordinator = [StoreCoordinator new];
    self.tweetArray = (NSMutableArray *)[self.storeCoordinator getUserTimeLine:_userID];
    NSLog(@"%@", self.storeCoordinator);
    
    _userID = nil;
}


- (void)configure:(UITableView *)tableView {
    
    tableView.dataSource  = self;
    tableView.delegate = self;
    
    [tableView registerNib:[UINib nibWithNibName:@"TweetTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TweetTableViewCell class])];
    
    [tableView registerNib:[UINib nibWithNibName:@"TweetWithImageTableViewCell" bundle:nil]
    forCellReuseIdentifier:NSStringFromClass([TweetWithImageTableViewCell class])];
    
}


- (void)configTableviewFrame {
    
    self.headerView = self.tableView.tableHeaderView;
    self.initialFrame = self.headerView.frame;
    self.defaultViewHeight = self.initialFrame.size.height;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:self.initialFrame];
    [self.tableView addSubview:self.headerView];
    self.minimumHeaderViewHeight = self.profileHeaderViewController.minimumViewHeight;
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    _initialFrame.size.width = self.tableView.frame.size.width;
    self.headerView.frame = self.initialFrame;
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(_headerView.frame.size.height, 0, 0, 0);
}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Header"]) {
        self.profileHeaderViewController = segue.destinationViewController;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tweetArray count];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGRect frame = self.headerView.frame;
    frame.size.width = self.tableView.frame.size.width;
    self.headerView.frame = frame;
    
    CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
    _initialFrame.origin.y = offsetY * -1;
    
    CGFloat limit = _defaultViewHeight - _minimumHeaderViewHeight;
    if (scrollView.contentOffset.y < limit) {
        _initialFrame.size.height = self.defaultViewHeight + offsetY;
    } else {
        _initialFrame.size.height = self.defaultViewHeight - limit;
    }
    
    self.headerView.frame = self.initialFrame;
}

@end