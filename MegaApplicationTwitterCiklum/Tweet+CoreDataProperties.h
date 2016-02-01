//
//  Tweet+CoreDataProperties.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/31/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tweet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *created_at;
@property (nullable, nonatomic, retain) NSNumber *favorite_count;
@property (nullable, nonatomic, retain) NSNumber *favorited;
@property (nullable, nonatomic, retain) NSNumber *idTweet;
@property (nullable, nonatomic, retain) NSString *id_str;
@property (nullable, nonatomic, retain) NSString *lang;
@property (nullable, nonatomic, retain) NSNumber *retweet_count;
@property (nullable, nonatomic, retain) NSNumber *retweeted;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
