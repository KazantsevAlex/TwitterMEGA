//
//  Tweet+CoreDataProperties.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/24/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tweet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *createDate;
@property (nullable, nonatomic, retain) NSDecimalNumber *favoriteCount;
@property (nullable, nonatomic, retain) NSString *mediaURL;
@property (nullable, nonatomic, retain) NSString *pictureURL;
@property (nullable, nonatomic, retain) NSString *profileName;
@property (nullable, nonatomic, retain) NSDecimalNumber *retweetCount;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSString *tweetID;

@end

NS_ASSUME_NONNULL_END
