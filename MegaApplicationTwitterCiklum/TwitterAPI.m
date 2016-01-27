
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

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.twitter = [Twitter new];
    }
    return self;
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

-(void)getUserHomeTimelineWithCount:(NSString *)count sinceID:(NSString *)tweetId block:(void(^)(id object))success
{
    NSString *url = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
    NSString *type = @"GET";
    NSDictionary *sd = @{@"count":count};
    [self executeQueryRequest:url queryMethod:type withParameters:sd block:^(id object) {
        success(object);
    }];
    
}


// ПЕРЕПРОВЕРИТЬ ВСЕ ID!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SDFGSDFGSDFGSDFsdlkfhvalsdjvkjasdbkj
//skdjfgksljfh
-(void)getTimelineUserWithID:(NSString *)userID
                       count:(NSUInteger)count
                     sinceID:(NSString *)sinceID
                       maxID:(NSString *)maxID
                       block:(void(^)(id object))success
{
    NSDictionary *params = @{@"userdID": userID,
                             @"count":[NSNumber numberWithInteger: count],
                             @"sinceID": sinceID,
                             @"maxID":maxID};
    NSString *url = @"";
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
    NSString *url = @"";
    NSString *type = @"POST";
    
    [self executeQueryRequest:url queryMethod:type withParameters:params block:^(id object) {
        success(object);
    }];
    
}
@end