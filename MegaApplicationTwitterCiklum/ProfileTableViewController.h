//
//  ProfileTableViewController.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 2/5/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataInterface.h"
#import "TweetTableViewCell.h"
#import "TweetWithImageTableViewCell.h"
#import "ProfileHeaderViewController.h"
#import "StoreCoordinator.h"

@interface ProfileTableViewController : UITableViewController

@property (nonatomic, weak) ProfileHeaderViewController* profileHeaderViewController;
@property (nonatomic, weak) UIView* headerView;
@property (nonatomic) CGRect initialFrame;
@property (nonatomic) CGFloat defaultViewHeight;
@property (nonatomic) CGFloat minimumHeaderViewHeight;

+ (void)setUserIDTV:(NSString*)value;

@end
