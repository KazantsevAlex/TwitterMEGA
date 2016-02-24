//
//  User+CoreDataProperties.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/31/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *contributors_enabled;
@property (nullable, nonatomic, retain) NSString *created_at;
@property (nullable, nonatomic, retain) NSNumber *default_profile;
@property (nullable, nonatomic, retain) NSNumber *default_profile_image;
@property (nullable, nonatomic, retain) NSString *descriptionAccount;
@property (nullable, nonatomic, retain) NSNumber *favourites_count;
@property (nullable, nonatomic, retain) NSNumber *following;
@property (nullable, nonatomic, retain) NSNumber *followers_count;
@property (nullable, nonatomic, retain) NSNumber *friends_count;
@property (nullable, nonatomic, retain) NSNumber *geo_enabled;
@property (nullable, nonatomic, retain) NSNumber *idUser;
@property (nullable, nonatomic, retain) NSString *id_str;
@property (nullable, nonatomic, retain) NSString *lang;
@property (nullable, nonatomic, retain) NSNumber *listed_count;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *profile_background_image_url;
@property (nullable, nonatomic, retain) NSString *profile_image_url;
@property (nullable, nonatomic, retain) NSNumber *protected;
@property (nullable, nonatomic, retain) NSString *screen_name;
@property (nullable, nonatomic, retain) NSNumber *statuses_count;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *profile_banner_url;
@property (nullable, nonatomic, retain) NSSet<Tweet *> *tweets;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addTweetsObject:(Tweet *)value;
- (void)removeTweetsObject:(Tweet *)value;
- (void)addTweets:(NSSet<Tweet *> *)values;
- (void)removeTweets:(NSSet<Tweet *> *)values;

@end

NS_ASSUME_NONNULL_END
