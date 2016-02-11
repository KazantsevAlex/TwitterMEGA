//
//  TweetWithImageTableViewCell.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetWithImageTableViewCell.h"

@interface TweetWithImageTableViewCell ()

@property (nonatomic, strong) Tweet *tweetM;;

@end

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
    self.likeButton.selected = tweetModel.favorited.boolValue;
    self.retweetButton.selected = tweetModel.retweeted.boolValue;
    self.nameLabel.text = tweetModel.user.name;
    self.userNameLabel.text = tweetModel.user.screen_name;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@", tweetModel.favorite_count];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%@", tweetModel.retweet_count];
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    
    self.timestampLabel.text = [MHPrettyDate prettyDateFromDate:[formatter dateFromString:tweetModel.created_at] withFormat:MHPrettyDateShortRelativeTime];

    
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

- (IBAction)likeUnlikeButton:(id)sender {
    
    TwitterAPI *twitterLikeApi = [TwitterAPI sharedManager];
    CoreDataInterface *coreDataLike = [CoreDataInterface sharedManager];
    
    if (self.likeButton.selected == 0)
    {
        [twitterLikeApi likeTweetwithID:self.tweetM.id_str block:^(id object) {
            [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-on.png"] forState:UIControlStateNormal];
            [coreDataLike tweetWithIDFavorited:self.tweetM.id_str favorited:YES];
//            self.tweetM.favorite_count = [NSNumber numberWithLong:[self.tweetM.favorite_count integerValue] + 1];
            self.likeButton.selected = 1;
        }];
    }
    else if (self.likeButton.selected == 1)
    {
        [twitterLikeApi unlikeTweetwithID:self.tweetM.id_str block:^(id object) {
            [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-off.png"] forState:UIControlStateNormal];
            [coreDataLike tweetWithIDFavorited:self.tweetM.id_str favorited:NO];
            self.likeButton.selected = 0;
        }];
    }
}

- (IBAction)retweetButton:(id)sender {
    
    TwitterAPI *twitterRetweetApi = [TwitterAPI sharedManager];
    
    if (self.retweetButton.selected == 0) {
        [twitterRetweetApi retweetStatusStatusWithText:self.tweetM.id_str block:^(id object) {
            [self.retweetButton setImage:[UIImage imageNamed:@"retweet_on.png"] forState:UIControlStateNormal];
            self.retweetButton.selected = 1;
        }];
    }
    else if (self.retweetButton.selected == 1)
    {
        [twitterRetweetApi retweetStatusStatusWithText:self.tweetM.id_str block:^(id object) {
            [self.retweetButton setImage:[UIImage imageNamed:@"retweet_default.png"] forState:UIControlStateNormal];
            self.retweetButton.selected = 0;
        }];
    }
}

@end
