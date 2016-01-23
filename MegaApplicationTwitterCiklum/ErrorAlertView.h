//
//  ErrorAlertView.h
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/24/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ErrorAlertView : UIAlertController <UIAlertViewDelegate>

- (instancetype)initWitTitle:(NSString *)title andMessage:(NSString *)message;
- (void)addButtonWithTitle:(NSString *)title;
- (void)showInViewController:(UIViewController *)viewContoller;

@end
