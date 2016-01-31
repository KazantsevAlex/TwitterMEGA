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

@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSString *profileName;
@property (nullable, nonatomic, retain) NSString *createData;
@property (nullable, nonatomic, retain) NSString *pictureURL;
@property (nullable, nonatomic, retain) NSString *mediaURL;
@property (nullable, nonatomic, retain) NSString *retweetCount;
@property (nullable, nonatomic, retain) NSString *favoriteCount;
@property (nullable, nonatomic, retain) NSString *tweetID;
@property (nullable, nonatomic, retain) NSString *descriptionTw;
@property (nullable, nonatomic, retain) NSData *pictureData;

@end

NS_ASSUME_NONNULL_END

#import "Tweet+CoreDataProperties.h"
