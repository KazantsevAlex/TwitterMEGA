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
- (NSArray *)getUserHomeTimeline;
- (NSUInteger)tweetsInStore;
- (NSUInteger)usersInStore;
- (void)clearTweetStore;

@end
