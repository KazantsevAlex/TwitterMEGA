//
//  TweetModel.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetModel.h"

@interface TweetModel()

@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSString *profileName;
@property(nonatomic, strong) NSString *createData;
@property(nonatomic, strong) NSString *pictureURL;
@property(nonatomic, strong) NSString *mediaURL;
@property(nonatomic, strong) NSString *retweetCount;
@property(nonatomic, strong) NSString *favoriteCount;
@property(nonatomic, strong) NSString *tweetID;
@property(nonatomic, strong) NSString *descriptionTw;
@property(nonatomic, strong) NSDictionary *sourceDic;

@end

@implementation TweetModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.text = dict[@"text"];
        self.profileName = dict[@"name"];
        self.createData = dict[@"created_at"];
        self.pictureURL = dict[@"profile_image_url"];
        self.mediaURL = dict[@"media_url"];
        self.retweetCount = dict[@"retweet_count"];
        self.favoriteCount = dict[@"favorited"];
        self.tweetID = dict[@"id"];
        self.descriptionTw = dict[@"description"];
    }
    return self;
}

@end
