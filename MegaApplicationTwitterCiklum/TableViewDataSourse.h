//
//  TableViewDataSourse.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/26/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TwitterAPI.h"
#import "CoreDataInterface.h"
#import "TweetTableViewCell.h"
#import "TweetWithImageTableViewCell.h"

@interface TableViewDataSource : NSObject <UITableViewDataSource,UITableViewDelegate>

//@property (nonatomic, strong) TweetModel *tweetObjects;

- (instancetype)initWithTableView:(UITableView *)tableView;
- (void)refreshArray;

@end
