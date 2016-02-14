//
//  Parser.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 2/14/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject

-(BOOL)isValidStatusText:(NSString *)statusText;
-(BOOL)isValidUserName:(NSString *)username;
-(BOOL)isValidUserDescription:(NSString *)descriprion;
-(BOOL)isValidUserLocationName:(NSString *)locationName;
-(BOOL)isValidUserUrlt:(NSString *)url;

@end
