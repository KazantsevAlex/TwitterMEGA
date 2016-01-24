
//  TwitterAPI.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TwitterAPI.h"

@interface TwitterAPI()
@property(nonatomic, strong) Twitter *twitter;
@property (nonatomic, strong) TWTRAPIClient *apiClient;

@end

@implementation TwitterAPI

-(void)loginAction
{
    [[Twitter sharedInstance]logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (session)
        {
            [self initApiClient:[session userID]];
            NSLog(@"log in as %@", [session userName]);
            [self getUserHomeTimelineWithParams:nil];
        }
        else
        {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)initApiClient:(NSString *)userID
{
    self.apiClient = [[TWTRAPIClient alloc]initWithUserID:userID];
}

-(void)executeQueryRequest:(NSString *)URLRequest queryMethod:(NSString *)type withParameters:(NSDictionary *)parametrs block:(void(^)( id object))success
{
    NSError *clientError;
    NSURLRequest *request = [self.apiClient
                             URLRequestWithMethod:type
                             URL:URLRequest
                             parameters:parametrs
                             error:&clientError];
    if (request) {
        [self.apiClient sendTwitterRequest:request
                                completion:^(NSURLResponse *response,
                                             NSData *data,
                                             NSError *connectionError) {
             if (data) {
                 NSError *jsonError;
                 NSDictionary *json = [NSJSONSerialization
                                       JSONObjectWithData:data
                                       options:0
                                       error:&jsonError];
                 success(json);
             }
             else {
                 NSLog(@"Error: %@", connectionError);
             }
         }];
    }
    else
    {
        NSLog(@"Error: %@", clientError);
        success(nil);
    }
}

-(void)getUserHomeTimelineWithParams:(NSDictionary *)params
{
    NSString *url = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
    NSString *type = @"GET";
    NSDictionary *sd = @{@"count":@"4"};
    
    [self executeQueryRequest:url queryMethod:type withParameters:sd block:^(id object) {
        
        //self.wtParse = [[TweetsParse alloc]initWithTweetsDictionary:json];
       // [self.wtParse someMagicWithTweets];
        
            NSLog(@"%@ cout %lu", [object valueForKey:@"created_at"], [object count]);

    }];
}


@end
