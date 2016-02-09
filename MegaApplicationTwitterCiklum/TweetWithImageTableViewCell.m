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
    
    self.imageProfilePicture.layer.cornerRadius = 5;
    self.imageProfilePicture.clipsToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)fillCellWith:(Tweet *)tweetModel {
    
    self.messageLabel.text = tweetModel.text;
    self.timestampLabel.text = tweetModel.created_at;
    self.likeButton.selected = [NSNumber numberWithBool:tweetModel.favorited];
    self.nameLabel.text = tweetModel.user.name;
    self.userNameLabel.text = tweetModel.user.screen_name;
    
    
    [self getImage:tweetModel.user.profile_image_url view:self.imageProfilePicture];
    
    [self getImage:tweetModel.mediaUrl view:self.mediaImageTweet];
    
}

-(void)getImage:(NSString *)imageURl view:(UIImageView *)view{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",imageURl]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    view.image = image;
                });
            }
        }
    }];
    [task resume];

    
}

@end
