//
//  TweetModel.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetModel : NSObject

@property(nonatomic, strong, readonly) NSString *text;
@property(nonatomic, strong, readonly) NSString *profileName;
@property(nonatomic, strong, readonly) NSString *createData;
@property(nonatomic, strong, readonly) NSString *pictureURL;
@property(nonatomic, strong, readonly) NSString *mediaURL;
@property(nonatomic, strong, readonly) NSString *retweetCount;
@property(nonatomic, strong, readonly) NSString *favoriteCount;
@property(nonatomic, strong, readonly) NSString *tweetID;
@property(nonatomic, strong, readonly) NSString *descriptionTw;


- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
