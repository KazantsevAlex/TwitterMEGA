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
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%k == %@", @"userID", 10];
    [requst setPredicate:predicate];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]initWithKey:@"userID" ascending:YES];
    [requst setSortDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    
    NSError *er = nil;
    NSArray *fecht = [self.context executeFetchRequest:requst error:&er];
    
    
    
    
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
    
    [user fillUpUserEntityWithDictionary:dict];
    [tw fillUpTweetEntityWithDictionary:dict];
   
    
    for (User *us in [self getUser]) {
        if (user.idUser == us.idUser) {
              [user addTweetsObject:tw];
            NSLog(@"user %@",user.id_str);
            NSLog(@"us   %@",us.id_str);
        }
    }
    NSLog(@"Tweets %@", user.tweets);
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

-(NSArray *)getTweet
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Tweet"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.tweetsArray = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.tweetsArray;
}
-(NSArray *)getUser
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"User"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.userArray = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.userArray;
}

- (NSUInteger)usersInStore {
    return [[self getUser]count];
}

- (NSUInteger)tweetsInStore {
    return [[self getTweet]count];
}

@end
