//
//  Tweet.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSManagedObject

-(void)fillUpTweetEntityWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

#import "Tweet+CoreDataProperties.h"
