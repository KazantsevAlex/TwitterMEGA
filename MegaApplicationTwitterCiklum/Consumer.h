//
//  Consumer.h
//
//
//  Created by Alexandr Lobanov on 2/26/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Consumer : NSObject

@property (nonatomic, strong, readonly) NSString *key;
@property (nonatomic, strong, readonly) NSString *secret;

+(Consumer *)WithKey:(NSString *)key secret:(NSString *)secret;

@end
