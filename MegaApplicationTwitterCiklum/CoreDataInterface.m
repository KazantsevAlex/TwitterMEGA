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
@property(nonatomic, strong) NSManagedObjectContext * context;
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
    // NSLog(@"%@",fecht);
    
    if ([fecht count] == 0) {
        User *uniqUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
        [uniqUser fillUpUserEntityWithDictionary:dict];
        Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
        [tw fillUpTweetEntityWithDictionary:dict];
        [uniqUser addTweetsObject:tw];
    }
    else
    {
        User *user;
        if ([fecht count] > 0)
        {
            user = [fecht objectAtIndex:0];
        }
        Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
        [tw fillUpTweetEntityWithDictionary:dict];
        [user addTweetsObject:tw];
    }
    
    NSError *errorSave = nil;
    if (![self.context save:&errorSave])
    {
        NSLog(@"error save object model");
    }
    else
    {
        NSLog(@"Save complete");
        [self.context save:nil];
    }
}

-(NSArray *)getUserHomeTimeline
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Tweet"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.tweetsArray = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.tweetsArray;
}
-(NSArray *)getUserWithId:(NSString *) userID
{
#warning  use predicate to get user wirh seleccted ID
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"User"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.userArray = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.userArray;
}

- (NSUInteger)usersInStore {
    return [self.userArray count];
}

- (NSUInteger)tweetsInStore {
    return [[self getUserHomeTimeline]count];
}



@end
