//
//  Consumer.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 2/26/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "Consumer.h"

@interface Consumer()

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *secret;

@end

@implementation Consumer

+(Consumer *)WithKey:(NSString *)key secret:(NSString *)secret
{
    return [[[self class]alloc]initWithKey:key secret:secret];
}

- (instancetype)initWithKey:(NSString *) key secret:(NSString *)secret
{
    self = [super init];
    if (self) {
        self.key = key;
        self.secret = secret;
    }
    return self;
}
@end
