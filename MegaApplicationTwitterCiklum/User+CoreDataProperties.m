//
//  User+CoreDataProperties.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

@dynamic userID;
@dynamic userName;
@dynamic userDescription;
@dynamic userLocation;
@dynamic userUrl;
@dynamic userFollowers;
@dynamic profilePicture;
@dynamic backgroundProfilePicture;
@dynamic relationship;

@end
