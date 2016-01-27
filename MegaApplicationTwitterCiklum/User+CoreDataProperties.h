//
//  User+CoreDataProperties.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *userID;
@property (nullable, nonatomic, retain) NSString *userName;
@property (nullable, nonatomic, retain) NSString *userDescription;
@property (nullable, nonatomic, retain) NSString *userLocation;
@property (nullable, nonatomic, retain) NSString *userUrl;
@property (nullable, nonatomic, retain) NSString *userFollowers;
@property (nullable, nonatomic, retain) NSString *profilePicture;
@property (nullable, nonatomic, retain) NSString *backgroundProfilePicture;
@property (nullable, nonatomic, retain) NSSet<Tweet *> *relationship;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(Tweet *)value;
- (void)removeRelationshipObject:(Tweet *)value;
- (void)addRelationship:(NSSet<Tweet *> *)values;
- (void)removeRelationship:(NSSet<Tweet *> *)values;

@end

NS_ASSUME_NONNULL_END
