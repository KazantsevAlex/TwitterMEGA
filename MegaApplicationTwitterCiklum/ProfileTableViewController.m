//
//  ProfileTableViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 2/5/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ProfileTableViewController.h"


@interface ProfileTableViewController ()

@property (nonatomic, weak) ProfileHeaderViewController* profileHeaderViewController;
@property (nonatomic, weak) UIView* headerView;
@property (nonatomic) CGRect initialFrame;
@property (nonatomic) CGFloat defaultViewHeight;
@property (nonatomic) CGFloat minimumHeaderViewHeight;

@property (nonatomic, strong) NSMutableArray *tweetArray;

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tweetArray = (NSMutableArray *)[[CoreDataInterface sharedManager]getUserHomeTimeline];
    
}

- (void)setHeaderFrame {
    
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
    _headerView.frame = self.initialFrame;    
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(self.headerView.frame.size.height, 0, 0, 0);
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Header"]) {
        self.profileHeaderViewController = segue.destinationViewController;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGRect frame = self.headerView.frame;
    frame.size.width = self.tableView.frame.size.width;
    self.headerView.frame = frame;
    
    CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
    _initialFrame.origin.y = offsetY * -1;
    
    CGFloat limit = self.defaultViewHeight - self.minimumHeaderViewHeight;
    if (scrollView.contentOffset.y < limit) {
        _initialFrame.size.height = self.defaultViewHeight + offsetY;
    } else {
        _initialFrame.size.height = self.defaultViewHeight - limit;
    }
    
    _headerView.frame = _initialFrame;
}

@end
