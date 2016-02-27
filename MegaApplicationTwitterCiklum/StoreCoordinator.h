//
//  StoreCoordinator.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 2/13/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwitterAPI.h"
#import "CoreDataInterface.h"
#import "User.h"
#import "Parser.h"

@protocol StoreCoordinatorDelegate <NSObject>

-(NSArray *)getOwnTimeline;
-(NSArray *)gettimelineuserWithId:(NSString *) userId;
-(NSArray *)getFriendsList;
-(NSArray *)getFollowersList;
-(void)setFavoritedTweetWithId:(NSString *)tweetID favorited:(BOOL)favorited;
-(void)setRetweetedTweetWithId:(NSString *)tweetID favorited:(BOOL)favorited;
- (void)postTweetWithText:(NSString *)text;

@end

@interface StoreCoordinator : NSObject

+(id)sharedManager;
-(void)postStatus:(NSString *)text;
-(void)getOwnTimeLine:(void (^)(id objects))handler;



-(void)getTimelineUser:(NSString *)sinceId maxId:(NSString *)maxID completition:(void (^)(id objects))handler;

@end
