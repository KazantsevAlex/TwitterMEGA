//
//  CoreDataInterface.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "CoreDataInterface.h"

@interface CoreDataInterface()

@property(nonatomic, strong) CoreDataStack *coreDataStack;
@property(nonatomic, strong) NSManagedObjectContext *context;
@property(nonatomic, strong) NSMutableArray *userArray;
@property(nonatomic, strong) NSMutableArray *tweetsArray;

@end

@implementation CoreDataInterface


+ (id)sharedManager
{
    static CoreDataInterface *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.context = [self getContext];
    }
    return self;
}

-(NSManagedObjectContext *)getContext
{
    self.coreDataStack = [CoreDataStack new];
    return [self.coreDataStack managedObjectContext];
}

-(BOOL)existTweetInStore:(NSDictionary *)dict
{
    BOOL isExist = true;
    NSFetchRequest *requst = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity =[NSEntityDescription entityForName:@"Tweet" inManagedObjectContext:self.context];
    [requst setEntity:entity];
    NSString *tweetId = dict[@"id_str"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"id_str", tweetId];
    [requst setPredicate:predicate];

    NSError *er = nil;
    NSArray *fecht = [self.context executeFetchRequest:requst error:&er];
    
    if([fecht count] == 0)
    {
        isExist = false;
    }
    return isExist;
}

-(void)addTweetWithDictionary:(NSDictionary *)dict
{
    NSFetchRequest *requst = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity =[NSEntityDescription entityForName:@"User" inManagedObjectContext:self.context];
    [requst setEntity:entity];
    NSString *userId = dict[@"user"][@"id_str"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"id_str", userId];
    [requst setPredicate:predicate];
    
    NSError *er = nil;
    NSArray *fecht = [self.context executeFetchRequest:requst error:&er];
    if (![self existTweetInStore:dict]) {
        if ([fecht count] == 0)
        {
            User *uniqUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
            [uniqUser fillUpUserEntityWithDictionary:dict];
            Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
            [tw fillUpTweetEntityWithDictionary:dict];
            [uniqUser addTweetsObject:tw];
        }
        else
        {
            User *user;
            user = [fecht lastObject];
            Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
            [tw fillUpTweetEntityWithDictionary:dict];
            [user addTweetsObject:tw];
        }
    }
    else
    {
        Tweet *tw = [self getUserHomeTimelineTweetWithId:dict[@"id_str"]];
        [tw fillUpTweetEntityWithDictionary:dict];
    }
    NSError *errorSave = nil;
    if (![self.context save:&errorSave])
    {
        NSLog(@"error save object model");
    }
    else
    {
        [self.context save:nil];
    }
}

-(void)addUserWithDictionary:(NSDictionary *)dict
{
    NSFetchRequest *requst = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity =[NSEntityDescription entityForName:@"User" inManagedObjectContext:self.context];
    [requst setEntity:entity];
    
    NSString *userId = dict[@"id_str"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"id_str", userId];
    [requst setPredicate:predicate];
    
    NSError *er = nil;
    NSArray *fecht = [self.context executeFetchRequest:requst error:&er];
    if ([fecht count] == 0)
    {
        User *uniqUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
        [uniqUser fillUpUserEntityWithDictionary:dict];
    }
    else
    {
        
        //if user exist - update his profile
        User *us;
        us = [self getUserWithId:dict[@"user"][@"id_str"]];
        [us fillUpUserEntityWithDictionary:dict];
    }
    
    NSError *errorSave = nil;
    if (![self.context save:&errorSave])
    {
        NSLog(@"error save object model");
    }
    else
    {
        [self.context save:nil];
    }

}

-(void)clearTweetStore
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Tweet"];
    [fetchRequest setIncludesPropertyValues:NO];
    NSError *error;
    NSArray *fetchedObjects = [self.context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *object in fetchedObjects)
    {
        [self.context deleteObject:object];
    }
    error = nil;
    [self.context save:&error];
}

-(NSArray *)getUserHomeTimeline {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Tweet"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.tweetsArray = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.tweetsArray;
}

-(Tweet *)getUserHomeTimelineTweetWithId:(NSString *)tweetId {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Tweet"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"id_str", tweetId];
    [request setPredicate:predicate];
    NSError * er = nil;
    NSArray *array = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return [array lastObject];
}

-(User *)getUserWithId:(NSString *) userID {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"User"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"id_str", userID];
    [request setPredicate:predicate];
    NSError * er = nil;
    NSArray *array = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];

    return [array lastObject];
}
-(void)tweetWithIDFavorited:(NSString *)tweetID favorited:(BOOL)fav
{
    Tweet *tweet = [self getUserHomeTimelineTweetWithId:tweetID];
    tweet.favorited = [NSNumber numberWithBool:[NSNumber numberWithBool:fav]];
    
    NSError *errorSave = nil;
    if (![self.context save:&errorSave])
    {
        NSLog(@"error save object model");
    }
    else
    {
        [self.context save:nil];
    }
}

- (NSUInteger)usersInStore {
    return [self.userArray count];
}

- (NSUInteger)tweetsInStore {
    return [[self getUserHomeTimeline]count];
}



@end
