//
//  TweetsParse.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/23/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetsParse : NSObject


- (instancetype)initWithTweetsDictionary:(NSDictionary *) json;
-(void)someMagicWithTweets;

@end
