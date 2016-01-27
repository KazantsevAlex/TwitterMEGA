//
//  TweetTableViewCell.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetTableViewCell.h"

@implementation TweetTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)fillCellWith:(TweetModel *)tweetModel {
    
    self.nameLabel.text = tweetModel.profileName;
    self.messageLabel.text = tweetModel.text;
    self.imageProfilePicture.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:tweetModel.pictureURL]]];
}


@end
