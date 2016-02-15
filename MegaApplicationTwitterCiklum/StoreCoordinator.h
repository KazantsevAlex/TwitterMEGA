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

@interface StoreCoordinator : NSObject

-(NSArray *)getOwnTimeLinePullToRefresh;
-(NSArray *)getOwnTimeLineDownloadMore;
-(NSArray *)getOwnTimeLine;

-(User *)getUserTimeLinePullToRefresh:(NSString *) UserId;
-(User *)getUserTimeLineDownloadMore:(NSString *) UserId;
-(User *)getUserTimeLine:(NSString *) UserId;

-(void)setFavoritedTweetWithId:(NSString *)tweetID favorited:(BOOL)favorited;
-(void)setRetweetedTweetWithId:(NSString *)tweetID favorited:(BOOL)favorited;

-(void)postStatus:(NSString *)text;
-(NSArray *)getFriendsList;
-(NSArray *)getFollowersList;
-(void)setuOwnProfile:(NSString *)name location:(NSString *)location description:(NSString *)description userUrl:(NSString *)userUrl;
-(Tweet *)getTweetWithId:(NSString *)tweetId;

@end
