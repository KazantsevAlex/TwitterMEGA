//
//  Parser.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 2/14/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "Parser.h"

@implementation Parser

-(BOOL)isValidStatusText:(NSString *)statusText
{
    //lenght 140 symbols
    return true;
}
-(BOOL)isValidUserName:(NSString *)username
{
    //lenght 14 symbols
    return true;
}
-(BOOL)isValidUserDescription:(NSString *)descriprion
{
    //lenght 80 symbols
    return true;
}
-(BOOL)isValidUserLocationName:(NSString *)locationName
{
    //lenght 25 symbols
    return true;
}
-(BOOL)isValidUserUrlt:(NSString *)url
{
    //lenght 140 symbols http:\\ ather 
    return true;
}

@end
