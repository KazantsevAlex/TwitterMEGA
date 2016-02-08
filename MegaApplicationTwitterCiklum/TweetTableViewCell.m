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
    
    self.imageProfilePicture.layer.cornerRadius = 5;
    self.imageProfilePicture.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)fillCellWith:(Tweet *)tweetModel {
    
    self.messageLabel.text = tweetModel.text;
    self.timestampLabel.text = tweetModel.created_at;
    self.likeButton.selected = [NSNumber numberWithBool:tweetModel.favorited];
    self.nameLabel.text = tweetModel.user.screen_name;
    self.userNameLabel.text = tweetModel.user.name;
    
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
    
    self.likeButton.selected = ![self.likeButton isSelected];
    if (self.likeButton.selected)
    {
        [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-on.png"] forState:UIControlStateNormal];
        NSLog(@"Selected");
    }
    else
    {
        [self.likeButton setImage:[UIImage imageNamed:@"twtr-icn-heart-off.png"] forState:UIControlStateNormal];
        NSLog(@"Un Selected");    
    }
}


-(void)prepareForReuse
{
    self.imageProfilePicture = nil;
}


@end
