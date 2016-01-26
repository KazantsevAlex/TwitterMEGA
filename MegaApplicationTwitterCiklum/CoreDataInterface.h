//
//  CoreDataInterface.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "TweetModel.h"
#import "Tweet.h"

@interface CoreDataInterface : NSObject

-(void)addTweet:(TweetModel *)tweet;
-(id)getTweet;
- (NSUInteger)tweetsInStore;
@end
