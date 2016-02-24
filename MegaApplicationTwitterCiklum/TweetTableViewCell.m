//
//  TweetTableViewCell.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetTableViewCell.h"
#import "ProfileTableViewController.h"
#import "ProfileHeaderViewController.h"



@interface TweetTableViewCell ()

@property (nonatomic, strong) Tweet *tweetM;
@property (nonatomic, strong) NSString *tweetId;

@end

@implementation TweetTableViewCell

- (void)awakeFromNib {
    
    [self configCellViews];
    
}

- (void)configCellViews {
    
    self.imageProfilePicture.layer.cornerRadius = 5;
    self.imageProfilePicture.clipsToBounds = YES;
}

- (void)fillCellWith:(Tweet *)tweetModel {
    
    self.messageLabel.text = tweetModel.text;
    self.nameLabel.text = tweetModel.user.name;
    self.userNameLabel.text = tweetModel.user.screen_name;
    self.likeCountLabel.text = [tweetModel.favorite_count stringValue];
    self.retweetCountLabel.text = [tweetModel.retweet_count stringValue];
    self.likeButton.selected = tweetModel.favorited.boolValue;
    self.retweetButton.selected = tweetModel.retweeted.boolValue;
    self.tweetM = tweetModel;

    
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

- (IBAction)likeUnlikeButton:(id)sender {
    
    TwitterAPI *twitterLikeApi = [TwitterAPI sharedManager];
    CoreDataInterface *coreDataLike = [CoreDataInterface sharedManager];
    
    if (self.likeButton.selected == 0) {
        
        [twitterLikeApi likeTweetwithID:self.tweetM.id_str block:^(id object) {
            [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-on.png"] forState:UIControlStateNormal];
            [coreDataLike tweetWithIDFavorited:self.tweetM.id_str favorited:YES];
            self.likeButton.selected = 1;
        }];
        self.tweetM.favorite_count = [NSNumber numberWithLong:[self.tweetM.favorite_count integerValue] + 1];
        
    }
    else if (self.likeButton.selected == 1) {
        
        [twitterLikeApi unlikeTweetwithID:self.tweetM.id_str block:^(id object) {
            [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-off.png"] forState:UIControlStateNormal];
            [coreDataLike tweetWithIDFavorited:self.tweetM.id_str favorited:NO];
            self.likeButton.selected = 0;
        }];
        self.tweetM.favorite_count = [NSNumber numberWithLong:[self.tweetM.favorite_count integerValue] - 1];
    }
    self.likeCountLabel.text = [NSString stringWithFormat:@"%@", self.tweetM.favorite_count];
}

- (IBAction)retweetButton:(id)sender {
     TwitterAPI *twitterRetweetApi = [TwitterAPI sharedManager];
     
     if (self.retweetButton.selected == 0) {
         
         [twitterRetweetApi retweetStatusWithID:self.tweetM.id_str block:^(id object) {

             [self.retweetButton setImage:[UIImage imageNamed:@"retweet_on.png"] forState:UIControlStateNormal];
             self.retweetButton.selected = 1;
         }];
         self.tweetM.retweet_count = [NSNumber numberWithLong:[self.tweetM.retweet_count integerValue] + 1];
         
     }
     else if (self.retweetButton.selected == 1) {
         
         [twitterRetweetApi unretweetStatusWithID:self.tweetM.id_str block:^(id object) {

             [self.retweetButton setImage:[UIImage imageNamed:@"retweet_default.png"] forState:UIControlStateNormal];
             self.retweetButton.selected = 0;
         }];
         self.tweetM.retweet_count = [NSNumber numberWithLong:[self.tweetM.retweet_count integerValue] - 1];
     }
     self.retweetCountLabel.text = [NSString stringWithFormat:@"%@", self.tweetM.retweet_count];

}

- (IBAction)viewProfile:(id)sender {
    
    [ProfileHeaderViewController setUserID: self.tweetM.user.id_str];
//    [ProfileTableViewController setUserIDTV:self.tweetM.user.id_str];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    ProfileHeaderViewController *vc = [sb instantiateViewControllerWithIdentifier:@"Profile"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    self.window.rootViewController = vc;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}


@end
