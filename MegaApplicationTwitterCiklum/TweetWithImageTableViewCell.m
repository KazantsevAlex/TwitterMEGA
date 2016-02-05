//
//  TweetWithImageTableViewCell.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetWithImageTableViewCell.h"

@implementation TweetWithImageTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillCellWith:(Tweet *)tweetModel {
    
//    self.nameLabel.text = tweetModel.profileName;
//    self.messageLabel.text = tweetModel.text;
//    self.imageProfilePicture.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:tweetModel.pictureURL]]];
//    self.mediaImageTweet.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:tweetModel.mediaURL]]];
}

@end
