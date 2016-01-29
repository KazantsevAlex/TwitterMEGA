//
//  CoreDataInterface.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "TweetModel.h"
#import "Tweet.h"
#import <CoreData/CoreData.h>

@interface CoreDataInterface : NSObject

+ (id)sharedManager;
- (void)addTweet:(TweetModel *)tweet;
- (NSArray *)getTweet;
- (NSUInteger)tweetsInStore;

@end
