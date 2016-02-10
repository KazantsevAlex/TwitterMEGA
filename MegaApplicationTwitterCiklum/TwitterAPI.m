
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


+(id)sharedManager
{
    static TwitterAPI *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.twitter = [Twitter new];
    }
    return self;
}
-(NSString *)getUserSessionName
{
    return [self.apiClient userID];
}
-(void)loginAction
{
    [self.twitter logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (session)
        {
            [self initApiClient:[session userID]];
            NSLog(@"log in as %@", [session userName]);
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

-(void)getUserHomeTimelineWithCount:(NSString *)count
                            sinceID:(NSString *)sinceID
                              maxID:(NSString *)maxID
                              block:(void(^)(id object))success
{
    NSString *url = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
    NSString *type = @"GET";
    NSDictionary *params =  [self setParamByStringLenghtSinceID:sinceID maxID:maxID count:count];
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
    
}

-(NSDictionary *)setParamByStringLenghtSinceID:(NSString *)sinceID maxID:(NSString *)maxID count:(NSString *)count
{
    NSDictionary *params = nil;
    if (([sinceID length] && [maxID length]) == 0)
    {
        params = @{@"count":count};
    }
    if ([sinceID length] > 0) {
        params = @{@"count":count,
                   @"since_id":sinceID};
    }
    if ([maxID length] >0) {
        params = @{@"count":count,
                   @"max_id":maxID};
    }
    
    return params;
}

-(void)getTimelineUserWithID:(NSString *)userID
                       count:(NSString *)count
                     sinceID:(NSString *)sinceID
                       maxID:(NSString *)maxID
                       block:(void(^)(id object))success
{
    NSDictionary *params = @{@"user_id": userID,
                             @"count": count,
                             @"since_id": sinceID,
                             @"max_id":maxID
                             };
    NSString *url = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
    NSString *type = @"GET";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
    
}

-(void)setUserProfile:(NSString *)name
             location:(NSString *)location
          description:(NSString *)description
              userUrl:(NSString *)userUrl
                block:(void(^)(id object))success
{
    NSDictionary *params = @{@"name": name,
                             @"location":location,
                             @"description": description,
                             @"url":userUrl};
    NSString *url = @"https://api.twitter.com/1.1/account/update_profile.json";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
    
}

-(void)getUserFollowers:(NSString *)count block:(void(^)(id object))success
{
    NSDictionary *params = @{@"count": count};
    NSString *url = @"https://api.twitter.com/1.1/followers/list.json";
    NSString *type = @"GET";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
}

-(void)likeTweetwithID:(NSString *)idTweet block:(void(^)(id object))success
{
    NSDictionary *params = @{@"id": idTweet,
                             @"include_entities": @"false"};
    NSString *url = @"https://api.twitter.com/1.1/favorites/create.json";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
}

-(void)unlikeTweetwithID:(NSString *)idTweet block:(void(^)(id object))success
{
    NSDictionary *params = @{@"id": idTweet,
                             @"include_entities": @"false"};
    NSString *url = @"https://api.twitter.com/1.1/favorites/destroy.json";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
}

-(void)postStatusWithText:(NSString *)statusText block:(void(^)(id object))success
{
    NSDictionary *params = @{@"status": statusText};
    NSString *url = @"https://api.twitter.com/1.1/statuses/update.json";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
}

-(void)retweetStatusStatusWithText:(NSString *)statusText block:(void(^)(id object))success
{
    NSDictionary *params = @{@"status": statusText};
    NSString *url = @"https://api.twitter.com/1.1/statuses/retweet/:id.json";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
}

-(void)unretweetStatusStatusWithText:(NSString *)statusText block:(void(^)(id object))success
{
    NSDictionary *params = @{@"status": statusText};
    NSString *url = @"https://api.twitter.com/1.1/statuses/unretweet/:id.json";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
}


-(void)TESTs:(NSString *)statusText block:(void(^)(id object))success
{
    NSDictionary *params = @{@"status": statusText};
    NSString *url = @"https://api.twitter.com/1.1/application/rate_limit_status.json";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
}

@end