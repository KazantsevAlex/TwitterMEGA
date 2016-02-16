//
//  TwitterAPI.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TwitterKit/TwitterKit.h>
#import "TweetsParse.h"

@interface TwitterAPI : NSObject

@property(nonatomic, strong, readonly)NSString *ownUserID;

+ (id)sharedManager;

- (void)loginAction;

-(void)initApiClient:(NSString *)userID;

-(void)usersLookupWithIds:(NSArray *)arrayWithIds block:(void(^)(id object))success;

-(void)getUserFriend:(void(^)(id object))success;

-(void)getUserHomeTimelineWithCount:(NSString *)count
                            sinceID:(NSString *)tweetId
                              maxID:(NSString *)maxID
                              block:(void(^)(id object))success;

- (void)getTimelineUserWithID:(NSString *)userID
                        count:(NSString *)count
                      sinceID:(NSString *)sinceID
                        maxID:(NSString *)maxID
                        block:(void(^)(id object))success;

- (void)setUserProfile:(NSString *)name
              location:(NSString *)location
           description:(NSString *)description
               userUrl:(NSString *)userUrl
                 block:(void(^)(id object))success;

-(void)getUserFollowers:(void(^)(id object))success;

-(void)likeTweetwithID:(NSString *)idTweet
                 block:(void(^)(id object))success;

-(void)unlikeTweetwithID:(NSString *)idTweet
                   block:(void(^)(id object))success;

-(void)postStatusWithText:(NSString *)statusText
                    block:(void(^)(id object))success;

-(void)retweetStatus:(NSString *)statusText
                             block:(void(^)(id object))success;

-(void)unretweetStatus:(NSString *)statusText
                               block:(void(^)(id object))success;



-(void)TESTs:(NSString *)statusText block:(void(^)(id object))success;

@end
