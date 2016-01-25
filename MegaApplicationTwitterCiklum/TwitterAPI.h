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

- (void)loginAction;
- (void)getUserHomeTimelineWithCount:(NSString *)count sinceID:(NSString *)tweetId block:(void(^)(id object))success;



@end
