//
//  Tweet.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

-(void)fillUpTweetEntityWithDictionary:(NSDictionary *)dict
{
    self.text = dict[@"text"];
    self.created_at =  dict[@"created_at"];
    self.favorite_count = dict[@"favorite_count"];
    self.favorited =  dict[@"favorited"];
    self.idTweet = dict[@"id"];
    self.id_str =  dict[@"id_str"];
    self.retweet_count =  dict[@"retweet_count"];
    self.retweeted = dict[@"retweeted"];
    self.lang = dict[@"lang"];
}

@end
