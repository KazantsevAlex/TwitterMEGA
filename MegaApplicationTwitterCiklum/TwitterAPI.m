
//  TwitterAPI.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TwitterAPI.h"

@interface TwitterAPI()
@property(nonatomic, strong) Twitter *twitter;
@property TweetsParse *wtParse;

@end

@implementation TwitterAPI

-(void)loginAction
{
    [[Twitter sharedInstance]logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (session) {
            NSLog(@"log in as %@", [session userName]);
            [self getUserHomeTimelineWithParams:nil];
             
           
        }
        else
        {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)executeQueryRequest:(NSString *)URLRequest queryMethod:(NSString *)type withParameters:(NSDictionary *)parametrs block:(void(^)(BOOL successOperation, NSDictionary* json))completion
{
//    NSString *statusesShowEndpoint = [NSString stringWithFormat:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
//    NSDictionary *params = @{};
    NSError *clientError;
    NSURLRequest *request = [[[Twitter sharedInstance] APIClient]
                             URLRequestWithMethod:type
                             URL:URLRequest
                             parameters:parametrs
                             error:&clientError];
    if (request) {
        [[[Twitter sharedInstance] APIClient]
         sendTwitterRequest:request
         completion:^(NSURLResponse *response,
                      NSData *data,
                      NSError *connectionError) {
             if (data) {
                 // handle the response data e.g.
                 NSError *jsonError;
                 NSDictionary *json = [NSJSONSerialization
                                       JSONObjectWithData:data
                                       options:0
                                       error:&jsonError];
                 
                 //json dictionary parse json in objects methode
               //  NSLog(@"%@", json);
                 completion(YES, json);
             }
             else {
                 NSLog(@"Error: %@", connectionError);
             }
         }];
    }
    else {
        NSLog(@"Error: %@", clientError);
       completion(NO, nil);
    }

}

-(void)getUserHomeTimelineWithParams:(NSDictionary *)params
{
    NSString *url = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
    NSString *type = @"GET";
    NSDictionary *sd = @{@"count":@"4"};
    
    [self executeQueryRequest:url queryMethod:type withParameters:sd block:^(BOOL successOperation, NSDictionary *json) {
        
        self.wtParse = [[TweetsParse alloc]initWithTweetsDictionary:json];
        [self.wtParse someMagicWithTweets];
        
            NSLog(@"%@ cout %lu", [json valueForKey:@"created_at"], [json count]);

    }];
}


@end
