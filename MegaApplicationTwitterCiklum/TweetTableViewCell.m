//
//  TweetTableViewCell.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetTableViewCell.h"

@interface TweetTableViewCell ()

@property (strong, nonatomic) NSString *tweetId;

@end

@implementation TweetTableViewCell



- (void)awakeFromNib {
    
    self.imageProfilePicture.layer.cornerRadius = 5;
    self.imageProfilePicture.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#warning show tweet using twitterObject

- (void)fillCellWith:(Tweet *)tweetModel {
    
    self.messageLabel.text = tweetModel.text;
    self.nameLabel.text = tweetModel.user.name;
    self.userNameLabel.text = tweetModel.user.screen_name;
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@", tweetModel.favorite_count];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%@", tweetModel.retweet_count];
    self.tweetId = tweetModel.id_str;
    self.likeButton.selected = tweetModel.favorited.boolValue;
    self.retweetButton.selected = tweetModel.retweeted.boolValue;

    NSLog(@"%@", tweetModel.retweeted);
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    
    self.timestampLabel.text = [MHPrettyDate prettyDateFromDate:[formatter dateFromString:tweetModel.created_at] withFormat:MHPrettyDateShortRelativeTime];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",tweetModel.user.profile_image_url]];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.imageProfilePicture.image = image;
                });
            }
        }
    }];
    [task resume];
    
    
}

#warning config

- (IBAction)likeUnlikeButton:(id)sender {
    
    TwitterAPI *twitterLikeApi = [TwitterAPI sharedManager];
    
    if (self.likeButton.selected == 0)
    {
        [twitterLikeApi likeTweetwithID:self.tweetId block:^(id object) {
            [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-on.png"] forState:UIControlStateNormal];
            self.likeButton.selected = 1;
        }];
    }
    else if (self.likeButton.selected == 1)
    {
        [twitterLikeApi unlikeTweetwithID:self.tweetId block:^(id object) {
           [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-off.png"] forState:UIControlStateNormal];
            self.likeButton.selected = 0;

    }];
    }
//        self.tweet.favoritesCount = [NSNumber numberWithInt:[self.tweet.favoritesCount intValue]
}


- (IBAction)retweetButton:(id)sender {

    TwitterAPI *twitterRetweetApi = [TwitterAPI sharedManager];
    
    if (self.retweetButton.selected == 0) {
        [twitterRetweetApi retweetStatusStatusWithText:self.tweetId block:^(id object) {
            [self.retweetButton setImage:[UIImage imageNamed:@"retweet_on.png"] forState:UIControlStateNormal];
            self.retweetButton.selected = 1;
        }];
    }
    else if (self.retweetButton.selected == 1)
    {
        [twitterRetweetApi retweetStatusStatusWithText:self.tweetId block:^(id object) {
            [self.retweetButton setImage:[UIImage imageNamed:@"retweet_default.png"] forState:UIControlStateNormal];
            self.retweetButton.selected = 0;
        }];
    }
}



-(void)prepareForReuse
{
    self.imageProfilePicture.image = nil;
}


@end
