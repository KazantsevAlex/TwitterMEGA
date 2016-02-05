//
//  User.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tweet;

NS_ASSUME_NONNULL_BEGIN

@interface User : NSManagedObject

-(void)fillUpUserEntityWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

#import "User+CoreDataProperties.h"
