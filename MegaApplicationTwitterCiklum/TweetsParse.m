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
@property (nonatomic, strong) TwitterAPI *twitterApi;

@property (nonatomic, strong)NSDictionary *userTimelineDictionray;
@property (nonatomic, strong) NSMutableArray *arrayOfTweetts;

@end

@implementation TweetsParse

- (instancetype)initWithTweetsDictionary:(TwitterAPI *)tw
{
    self = [super init];
    if (self) {
        self.twitterApi = tw;
        [self initObjects];
    }
    return self;
}

-(void)initObjects
{
    self.arrayOfTweetts = [NSMutableArray new];
    self.userTimelineDictionray = [NSDictionary new];
    self.twitterApi = [TwitterAPI new];
}

-(void)parseJsonUsertimeline:(NSString *)since_id cout:(NSUInteger)count
{
    NSDictionary *params = @{@"count":[NSString stringWithFormat:@"%lu", count]};
    self.userTimelineDictionray = [self.twitterApi getUserHomeTimelineWithParams:params];

}

@end
