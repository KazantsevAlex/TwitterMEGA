
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
        self.apiClient = [TWTRAPIClient new];
    }
    return self;
}

-(void)loginAction
{
    [[Twitter sharedInstance]logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (session) {
            NSLog(@"log in as %@", [session userName]);
            [self setupApiClientWithUserId:[session userID]];
            [self getUserHomeTimelineWithParams:nil];
        }
        else
        {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

-(void)setupApiClientWithUserId:(NSString *)userID
{
    self.apiClient = [[TWTRAPIClient alloc]initWithUserID:userID];
}

-(void)executeRequestWithMethod:(NSString *)method url:(NSString *)url parameters:(NSDictionary *)parameters block:(void(^)(BOOL successOperation))completion
{
    NSError *clientError = nil;
    NSURLRequest *request = [self.apiClient URLRequestWithMethod:method
                                                             URL:url
                                                      parameters:parameters
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
                
                NSLog(@"json %@", json);
                completion(YES);
            }
            else {
                NSLog(@"Error : %@", [connectionError localizedDescription]);
            }
        }];
 
    }
    else {
        NSLog(@"Error client: %@", [clientError localizedDescription]);
        completion(NO);
    }
}

-(NSDictionary *)getUserHomeTimelineWithParams:(NSDictionary *)params
{
    NSString *url = @"https://api.twitter.com/1.1/statuses/home_timeline.json";
    NSString *type = @"GET";
    NSDictionary *sd = @{};
    
    [self executeRequestWithMethod:url url:type parameters:sd block:^(BOOL successOperation) {
        NSLog(@"Success %d", successOperation);
    }];
    return nil;
}


@end
