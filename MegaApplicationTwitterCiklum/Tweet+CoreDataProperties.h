//
//  Tweet+CoreDataProperties.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Tweet.h"

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
@property (nullable, nonatomic, retain) NSManagedObject *relationship;

@end

NS_ASSUME_NONNULL_END
