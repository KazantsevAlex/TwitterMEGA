//
//  SplashScreenViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/31/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController()

@property (weak, nonatomic) IBOutlet UIImageView *splashScreenImageView;

@end

@implementation SplashScreenViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:2.0 delay:0.2 options:0 animations:^{
        CGRect frame = self.splashScreenImageView.frame;
        frame.origin.y = 70.0;
        self.splashScreenImageView.frame = frame;
        
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"LogInTwiiter" sender:self];
    }];
}




@end
