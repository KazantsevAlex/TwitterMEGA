//
//  User.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "User.h"
#import "Tweet.h"

@implementation User

-(void)fillUpUserEntityWithDictionary:(NSDictionary *)dict
{
    if (dict[@"user"]) {
    self.contributors_enabled = dict[@"user"][@"contributors_enabled"];
    self.created_at =  dict[@"user"][@"created_at"];
    self.default_profile = dict[@"user"][@"default_profile"];
    self.name = dict[@"user"][@"name"];
    self.descriptionAccount = dict[@"user"][@"description"];
    self.default_profile = dict[@"user"][@"default_profile"];
    self.default_profile_image = dict[@"user"][@"default_profile_image"];
    self.favourites_count = dict[@"user"][@"favourites_count"];
    self.followers_count = dict[@"user"][@"followers_count"];
    self.following = dict[@"user"][@"following"];
    self.friends_count = dict[@"user"][@"friends_count"];
    self.geo_enabled = dict[@"user"][@"geo_enabled"];
    self.id_str = dict[@"user"][@"id_str"];
    self.idUser = dict[@"user"][@"id"];
    self.lang = dict[@"user"][@"lang"];
    self.listed_count = dict[@"user"][@"listed_count"];
    self.location = dict[@"user"][@"location"];
    self.profile_background_image_url = dict[@"user"][@"profile_background_image_url"];
    self.profile_image_url = dict[@"user"][@"profile_image_url"];
    self.protected = dict[@"user"][@"protected"];
    self.screen_name = dict[@"user"][@"screen_name"];
    self.statuses_count = dict[@"user"][@"statuses_count"];
//    if (dict[@"user"][@"url"] != nil) {
//         self.url = dict[@"user"][@"url"];
//    }
    }
    else
    {
        self.contributors_enabled = dict[@"contributors_enabled"];
        self.created_at =  dict[@"created_at"];
        self.default_profile = dict[@"default_profile"];
        self.name = dict[@"name"];
        self.descriptionAccount = dict[@"description"];
        self.default_profile = dict[@"default_profile"];
        self.default_profile_image = dict[@"default_profile_image"];
        self.favourites_count = dict[@"favourites_count"];
        self.followers_count = dict[@"followers_count"];
        self.following = dict[@"following"];
        self.friends_count = dict[@"friends_count"];
        self.geo_enabled = dict[@"geo_enabled"];
        self.id_str = dict[@"id_str"];
        self.idUser = dict[@"id"];
        self.lang = dict[@"lang"];
        self.listed_count = dict[@"user"][@"listed_count"];
        self.location = dict[@"location"];
        self.profile_background_image_url = dict[@"profile_background_image_url"];
        self.profile_image_url = dict[@"profile_image_url"];
        self.protected = dict[@"protected"];
        self.screen_name = dict[@"screen_name"];
        self.statuses_count = dict[@"statuses_count"];
        //    if (dict[@"user"][@"url"] != nil) {
        //         self.url = dict[@"user"][@"url"];
        //    }
    }
   
}

@end
