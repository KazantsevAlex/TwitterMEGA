//
//  TwitterEngine.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 2/26/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "TwitterEngine.h"

static NSString *key = @"nrq96Exckh06IEpOlpDDqEWte";
static NSString *secret = @"AburHB5U0NerpEOFqEMfhc3RqO15bZpX9bPnQEFW7Pf07WaOVb";
NSString * const kTwittercallback = @"stoned://twitter-callback";
@interface TwitterEngine()

@property(nonatomic, strong) Consumer *consumer;

@end

@implementation TwitterEngine

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initConsumer];
    }
    return self;
}

- (void)initConsumer {
    self.consumer = [Consumer WithKey:key secret:secret];
}

- (NSDictionary *)oauthRequestParametrs {
    NSDictionary *params = @{
                             @"oauth_consumer_key"     : self.consumer.key,
                             @"oauth_nonce"            : [self nonce],
                             @"oauth_signature_method" : @"HMAC-SHA1",
                             @"oauth_timestamp"        : [self timeStamp],
                             @"oauth_version"          : @"1.0",
                             @"oauth_callback"         : kTwittercallback
                             };
    
    return params;
}

- (NSString *)nonce
{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString *uuid = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
    
    if(uuid.length > 32)
        return [uuid substringWithRange:NSMakeRange(0, 32)];
    
    return uuid;
}

- (NSString *)timeStamp
{
    return [NSString stringWithFormat:@"%d",(int)[[NSDate date] timeIntervalSince1970]];
}

@end
