//
//  TweetsParse.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/23/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetsParse.h"

@interface TweetsParse()

@property TwitterAPI *twAPI;

@end

@implementation TweetsParse


- (instancetype)initWithTwitterApi:(TwitterAPI *)api
{
    self = [super init];
    if (self) {
        self.twAPI = api;
    }
    return self;
}

-(void)madic
{
    
    NSLog(@"MAGIS IS MAGIC");
    
    [self.twAPI getUserHomeTimelineWithCount:@"27" sinceID:@"1"];
}

@end
