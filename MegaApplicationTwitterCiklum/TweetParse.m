//
//  TweetParse.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetParse.h"

@interface TweetParse()

@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSString *profileName;
@property(nonatomic, strong) NSString *nickname;
@property(nonatomic, strong) NSString *createData;
@property(nonatomic, strong) NSString *pictureURL;
@property(nonatomic, strong) NSString *mediaURL;
@property(nonatomic, strong) NSString *retweetCount;
@property(nonatomic, strong) NSString *favoriteCount;
@property(nonatomic, strong) NSString *tweetID;
@property(nonatomic, strong) NSString *descriptionTw;

@property (nonatomic, strong) NSDictionary *sourceDic;

@end

@implementation TweetParse

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.sourceDic = dict;
    }
    return self;
}

-(void)setupTweetData
{
    self.text = self.sourceDic[@"text"];
    self.profileName = self.sourceDic[@"name"];
    self.createData = self.sourceDic[@"created_at"];
    self.pictureURL = self.sourceDic[@"profile_image_url"];
   // self.mediaURL = [@""];
    self.retweetCount = self.sourceDic[@"retweet_count"];
    self.favoriteCount = self.sourceDic[@"favorited"];
    self.tweetID = self.sourceDic[@"id"];
    //self.nickname = self.sourceDic[@""];
    self.descriptionTw = self.sourceDic[@"description"];
}




@end
