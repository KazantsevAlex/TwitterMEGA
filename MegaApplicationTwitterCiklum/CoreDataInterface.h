//
//  CoreDataInterface.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "Tweet.h"
#import <CoreData/CoreData.h>

@interface CoreDataInterface : NSObject

+ (id)sharedManager;

- (void)addTweetWithDictionary:(NSDictionary *)dict;
- (void)addUserWithDictionary:(NSDictionary *)dict;

- (NSUInteger)tweetsInStore;
- (NSUInteger)usersInStore;

- (NSArray *)getUserHomeTimeline;
- (void)clearTweetStore;

-(User *)getUserWithId:(NSString *) userID;
-(Tweet *)getUserHomeTimelineTweetWithId:(NSString *)tweetId;

-(void)tweetWithIDFavorited:(NSString *)tweetID favorited:(BOOL)fav;
@end
