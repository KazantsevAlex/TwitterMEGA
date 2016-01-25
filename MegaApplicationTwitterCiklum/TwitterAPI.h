//
//  TwitterAPI.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TwitterKit/TwitterKit.h>
#import "TweetsParse.h"

@interface TwitterAPI : NSObject

-(void)loginAction;
-(void)executeQueryRequest:(NSString *)URLRequest queryMethod:(NSString *)type withParameters:(NSDictionary *)parametrs block:(void(^)( id object))success;

@end
