//
//  TweetsParse.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/23/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwitterAPI.h"
#import "Tweet.h"


@class TwitterAPI;

@interface TweetsParse : NSObject


- (instancetype)initWithTwitterApi:(TwitterAPI *)api;
-(void)madic;


@end
