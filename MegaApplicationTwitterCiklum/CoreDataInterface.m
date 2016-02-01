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
@property(nonatomic, strong) NSMutableArray *array;

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
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
    Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
    
    [tw setupValuesWithDictionary:dict];
    [user setupValuesWithDictionary:dict];
    
    for (User *us in [self getUser]) {
        if (user.idUser == us.idUser) {
              [user addTweetsObject:tw];
        }
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

-(NSArray *)getTweet
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Tweet"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.array = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.array;
}
-(NSArray *)getUser
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"User"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.array = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.array;
}
- (NSUInteger)usersInStore {
    return [[self getUser]count];
}

- (NSUInteger)tweetsInStore {
    return [[self getTweet]count];
}

@end
