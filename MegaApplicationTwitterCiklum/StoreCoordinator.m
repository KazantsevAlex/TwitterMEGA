//
//  StoreCoordinator.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 2/13/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "StoreCoordinator.h"


static NSString *tweetsCount = @"100";

@interface StoreCoordinator()

@property(nonatomic, strong) NSString *sinceId;
@property(nonatomic, strong) NSString *maxId;


@property(nonatomic, strong) NSString *userSinceId;
@property(nonatomic, strong) NSString *userMaxId;

@property(nonatomic, strong)NSString *ownUserID;
@property (nonatomic, strong) __block NSArray *array;

@end

@implementation StoreCoordinator

+(id)sharedManager
{
    static StoreCoordinator *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(NSArray *)getOwnTimeLinePullToRefresh
{
    return [self getTimelineUser:@"" maxId:self.maxId];
}

-(NSArray *)getOwnTimeLineDownloadMore
{
    return [self getTimelineUser:self.sinceId maxId:@""];
}

-(NSArray *)getOwnTimeLine
{
    self.ownUserID = [[TwitterAPI sharedManager]ownUserID];
    return [self getTimelineUser:@"" maxId:@""];
}

-(NSArray *)getTimelineUser:(NSString *)sinceId maxId:(NSString *)maxID
{
    __block NSInteger i = 0;

    
    [[TwitterAPI sharedManager] getUserHomeTimelineWithCount:tweetsCount sinceID:sinceId maxID:maxID block:^(id object) {
        for(NSDictionary *dict in object) {
            
            //check result for error limit of requests!
            if (dict[@"error"])
            {
                break;
                //claas name for cheking error code
            }
            [[CoreDataInterface sharedManager]addTweetWithDictionary:dict];
            i++;
            if ([maxID length] != 0)
            {
                if (i == 0)
                {
                    self.maxId = dict[@"id_str"];
                }
            }
            if ([object count] == i)
            {
                self.sinceId = dict[@"id_str"];
            }
        }
        self.array = [[CoreDataInterface sharedManager]getUserHomeTimeline];
    }];
    return self.array;
}

-(User *)getUserTimeLinePullToRefresh:(NSString *) UserId
{
    return [self getTimelineUserWithId:UserId sinceID:@"" maxId:self.userMaxId];
}

-(User *)getUserTimeLineDownloadMore:(NSString *) UserId
{
    return [self getTimelineUserWithId:UserId sinceID:self.userSinceId maxId:@""];
}

-(User *)getUserTimeLine:(NSString *) UserId
{
    return [self getTimelineUserWithId:UserId sinceID:@"" maxId:@""];
    
    // to get array use convertation from nsset [user.tweets allobject];
}

-(User *)getTimelineUserWithId:(NSString *)userId sinceID:(NSString *)sinceId maxId:(NSString *)maxID
{
    __block NSInteger i = 0;
    __block User *uniqUser;
    
    [[TwitterAPI sharedManager] getTimelineUserWithID:userId count:tweetsCount sinceID:sinceId maxID:maxID block:^(id object)
    {
        for(NSDictionary *dict in object) {
            
            //check result for error limit of requests!
            if (dict[@"error"])
            {
                break;
                //claas name for cheking error code
            }
            [[CoreDataInterface sharedManager]addTweetWithDictionary:dict];
            i++;
            if ([sinceId length] != 0)
            {
                if (i == 0)
                {
                    self.userMaxId = dict[@"id_str"];
                }
            }
            if ([object count] == i)
            {
                self.userSinceId = dict[@"id_str"];
            }
        }
        uniqUser = [[CoreDataInterface sharedManager]getUserWithId:userId ];
    }];
    return uniqUser;

}
-(void)setFavoritedTweetWithId:(NSString *)tweetID favorited:(BOOL)favorited
{
    if (favorited == true) {
        [[TwitterAPI sharedManager]likeTweetwithID:tweetID block:^(id object) {
            
            //check error code
            if (!object[@"error"]) {
                [[CoreDataInterface sharedManager]tweetWithIDFavorited:tweetID favorited:favorited];
            }
        }];
    }
    else
    {
        [[TwitterAPI sharedManager]unlikeTweetwithID:tweetID block:^(id object) {
            //check error code
            if (!object[@"error"]) {
                [[CoreDataInterface sharedManager]tweetWithIDFavorited:tweetID favorited:favorited];
            }
        }];
    }
}
-(void)setRetweetedTweetWithId:(NSString *)tweetID retweted:(BOOL)retweeted
{
    if (retweeted == true) {
        [[TwitterAPI sharedManager]retweetStatusWithID:tweetID block:^(id object) {
            //some code
        }];
    }
    else
    {
        [[TwitterAPI sharedManager]unretweetStatusWithID:tweetID block:^(id object) {
            //code in core data to decrise varible
        }];
    }
    
    
}
-(void)postStatus:(NSString *)text
{
    
}
-(NSArray *)getFriendsList
{
    __block NSMutableArray *usersID;
    __block NSMutableArray *friendsArray;
    [[TwitterAPI sharedManager]getUserFriend:^(id object) {
        usersID = [NSMutableArray arrayWithCapacity:[object count]];
        for (int i = 0; i < [object[@"ids"] count]; i++ )
        {
            if (usersID != nil)
            {
                //[usersID addObject:[object[@"users"]objectAtIndex:i][@"id_str"]];
                [usersID addObject:[object[@"ids"]objectAtIndex:i]];
            }
            else
            {
                NSLog(@"user is NIL");
            }
        }
        [[TwitterAPI sharedManager]usersLookupWithIds:usersID block:^(id object)
        {
            for (NSDictionary *dict in object)
            {
                [[CoreDataInterface sharedManager]addUserWithDictionary:dict];
                
            }
            for (int i = 0; i < [usersID count]; i++)
            {
                User *k =  [[CoreDataInterface sharedManager]getUserWithId:[NSString stringWithFormat:@"%@",[usersID objectAtIndex:i]]];
                [friendsArray addObject:k];
              //  NSLog(@"%@", k.name);
            }
        }];
    }];
    return friendsArray;
}

-(NSArray *)getFollowersList
{
    __block NSMutableArray *usersID;
    __block NSMutableArray *followersArray;
    [[TwitterAPI sharedManager]getUserFriend:^(id object) {
        usersID = [NSMutableArray arrayWithCapacity:[object count]];
        for (int i = 0; i < [object[@"ids"] count]; i++ )
        {
            if (usersID != nil)
            {
                [usersID addObject:[object[@"users"]objectAtIndex:i][@"id_str"]];
                //[usersID addObject:[object[@"ids"]objectAtIndex:i]];
            }
            else
            {
                NSLog(@"user is NIL");
            }
        }
        [[TwitterAPI sharedManager]usersLookupWithIds:usersID block:^(id object)
         {
             for (NSDictionary *dict in object)
             {
                 [[CoreDataInterface sharedManager]addUserWithDictionary:dict];
                 
             }
             for (int i = 0; i < [usersID count]; i++)
             {
                 User *k =  [[CoreDataInterface sharedManager]getUserWithId:[NSString stringWithFormat:@"%@",[usersID objectAtIndex:i]]];
                 [followersArray addObject:k];
             }
         }];
    }];
    return followersArray;
}
-(void)setuOwnProfile:(NSString *)name location:(NSString *)location description:(NSString *)description userUrl:(NSString *)userUrl
{
    
}

@end
