//
//  CoreDataInterface.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "CoreDataInterface.h"

@interface CoreDataInterface()

@property(nonatomic, strong)CoreDataStack *coreDataStack;
@property(nonatomic, strong)NSManagedObjectContext * context;
@property(nonatomic, strong) NSMutableArray *array;

@end

@implementation CoreDataInterface

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

-(void)addTweet:(TweetModel *)tweet
{
    Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
    tw.tweetID = [NSString stringWithFormat:@"%@",tweet.tweetID];
    tw.text = tweet.text;
    tw.pictureURL = tweet.pictureURL;
    tw.profileName = tweet.profileName;
    tw.mediaURL = tweet.mediaURL;
    
    NSError *errorSave = nil;
    if (![self.context save:&errorSave]) {
        NSLog(@"error save object model");
    }
    else
    {
        NSLog(@"Save complete");
        [self.context save:nil];
    }
    
}

-(id)getTweet
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Tweet"
                                                   inManagedObjectContext:self.context];
    [request setEntity:description];
    NSError * er = nil;
    self.array = [[NSMutableArray alloc]initWithArray:[self.context executeFetchRequest:request error:&er]];
    return self.array;
}

- (NSUInteger)tweetsInStore {
    return [[self getTweet ]count];
}

@end
