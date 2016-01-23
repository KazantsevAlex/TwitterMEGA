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

-(void)addTweet:(Tweet *)tweet
{
    Tweet *tw = [NSEntityDescription insertNewObjectForEntityForName:@"Tweet" inManagedObjectContext:self.context];
    tw.tweetID = tweet.tweetID;
    tw.text = tweet.text;
    tw.pictureURL = tweet.pictureURL;
    tw.profileName = tweet.profileName;
    tw.mediaURL = tweet.mediaURL;
    
    NSError *errorSave = nil;
    if (![self.context save:&errorSave]) {
        //class with alerrt view
    }
    else
    {
        [self.context save:nil];
    }
    
}

@end
