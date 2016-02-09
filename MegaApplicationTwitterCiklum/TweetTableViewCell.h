//
//  TweetTableViewCell.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataInterface.h"

@interface TweetTableViewCell : UITableViewCell <UIGestureRecognizerDelegate>


@property (weak, nonatomic) IBOutlet UIView *viewTweetContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageProfilePicture;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;



- (void)fillCellWith:(Tweet *)tweetModel;

@end
