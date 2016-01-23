//
//  TweetsParse.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/23/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TweetsParse.h"

@interface TweetsParse()

@property(nonatomic, strong)NSDictionary *jsonData;
@property  (nonatomic, strong)NSMutableArray *array;
@end

@implementation TweetsParse

- (instancetype)initWithTweetsDictionary:(NSDictionary *) json
{
    self = [super init];
    if (self) {
        [self initObjects:json];
    }
    return self;
}

-(void)initObjects:(NSDictionary *) json;
{
    self.jsonData = json;
}

-(void)someMagicWithTweets
{
    NSLog(@"VALUE FIR KEY %@", [self.jsonData valueForKey:@"created_at"][0]);
    
}

@end
