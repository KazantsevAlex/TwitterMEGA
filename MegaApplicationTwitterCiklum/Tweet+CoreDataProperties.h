//
//  Tweet+CoreDataProperties.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/30/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tweet.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tweet (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *createData;
@property (nullable, nonatomic, retain) NSString *descriptionTw;
@property (nullable, nonatomic, retain) NSString *favoriteCount;
@property (nullable, nonatomic, retain) NSString *mediaURL;
@property (nullable, nonatomic, retain) NSString *pictureURL;
@property (nullable, nonatomic, retain) NSString *profileName;
@property (nullable, nonatomic, retain) NSString *retweetCount;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSString *tweetID;
@property (nullable, nonatomic, retain) NSData *pictureData;
@property (nullable, nonatomic, retain) User *relationship;

@end

NS_ASSUME_NONNULL_END
