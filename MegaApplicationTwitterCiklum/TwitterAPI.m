
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
        if (session) {
            NSLog(@"log in as %@", [session userName]);
            [self initAPIWithUserID:[session userID]];
        }
        else
        {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

- (void)initAPIWithUserID:(NSString *)userId
{
    self.apiClient = [[TWTRAPIClient alloc]initWithUserID:userId];
}
-(void)executeRequestWithMethod:(NSString *)method url:(NSString *)url parameters:(NSDictionary *)parameters
{
    NSError *errorConnection = nil;
    NSURLRequest *request = [self.apiClient URLRequestWithMethod:method URL:url parameters:parameters error:&errorConnection];
    
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
                 
                 NSLog(@"JSON DATA %@ COUTN %lu", json, [json count]);
             }
             else {
                 NSLog(@"Error: %@", connectionError);
             }
         }];
    }
    else
    {
      NSLog(@"Error: %@", [errorConnection localizedDescription]);
    }
}

-(NSDictionary *)getUserHomeTimelineWithParams:(NSDictionary *)params
{
    NSString *url = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
    NSString *type = @"GET";
    [self executeRequestWithMethod:type url:url parameters:params];
    
    
    return nil;
}


@end
