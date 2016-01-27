//
//  ErrorAlertView.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/24/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ErrorAlertView.h"

@interface ErrorAlertView()

@property (copy, nonatomic) NSString *alertTtitle;
@property (copy, nonatomic) NSString *alertMessage;

@end

@implementation ErrorAlertView

- (instancetype)initWitTitle:(NSString *)title andMessage:(NSString *)message
{
    if (self = [super init]) {
        self.title = title;
        self.message = message;
    }
    
    return self;    
}
- (void)addButtonWithTitle:(NSString *)title
{
    
}
- (void)showInViewController:(UIViewController *)viewContoller
{
    
}

@end
