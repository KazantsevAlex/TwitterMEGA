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

- (void)fillCellWith:(Tweet *)tweetModel {
    
//    self.nameLabel.text = tweetModel.profileName;
//    self.messageLabel.text = tweetModel.text;
//    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",tweetModel.pictureURL]];
//    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (data) {
//            UIImage *image = [UIImage imageWithData:data];
//            if (image) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    self.imageProfilePicture.image = image;
//                });
//            }
//        }
//    }];
//    [task resume];

}

-(void)prepareForReuse
{
    self.imageProfilePicture = nil;
}


@end
