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


+ (id)sharedManager;
- (void)loginAction;
- (void)getUserHomeTimelineWithCount:(NSString *)count sinceID:(NSString *)tweetId block:(void(^)(id object))success;

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

-(void)getUserFollowers:(NSString *)count
                  block:(void(^)(id object))success;
-(void)likeTweetwithID:(NSString *)idTweet
                 block:(void(^)(id object))success;

-(void)unlikeTweetwithID:(NSString *)idTweet
                   block:(void(^)(id object))success;

-(void)postStatusWithText:(NSString *)statusText
                    block:(void(^)(id object))success;

-(void)retweetStatusStatusWithText:(NSString *)statusText
                             block:(void(^)(id object))success;

-(void)unretweetStatusStatusWithText:(NSString *)statusText
                               block:(void(^)(id object))success;

-(void)TESTs:(NSString *)statusText block:(void(^)(id object))success;
@end
