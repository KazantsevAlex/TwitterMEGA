//
//  TweetTableViewCell.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetTableViewCell : UITableViewCell <UIGestureRecognizerDelegate>

//@property(nonatomic, weak) id<TweetTableViewCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *viewTweetContent;
@property (weak, nonatomic) IBOutlet UIImageView *imageProfilePicture;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;



//@property BOOL showingOption;
//@property (strong, nonatomic) IBOutlet UIButton *buttonTop;
//@property (strong, nonatomic) IBOutlet UIButton *buttonBottom;
//@property (strong, nonatomic) IBOutlet UIButton *buttonRemove;
//@property (strong, nonatomic) IBOutlet UIButton *buttonShare;


@end
