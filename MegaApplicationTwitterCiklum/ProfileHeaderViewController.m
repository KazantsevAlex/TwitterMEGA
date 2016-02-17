//
//  ProfileHeaderViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 2/5/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ProfileHeaderViewController.h"

@interface ProfileHeaderViewController ()


@property (nonatomic) CGFloat defaultViewHeight;
@property (nonatomic) CGFloat defaultBackgroundImageViewHeight;
@property (nonatomic) CGFloat defaultNavigationTitleViewTop;
@property (nonatomic) CGFloat profileImageBaseMinimumScale;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *profileImageBaseView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileNicknameLabel;
@property (weak, nonatomic) IBOutlet UIView *navigationTitleView;
@property (weak, nonatomic) IBOutlet UIView *navigationBarView;
@property (weak, nonatomic) IBOutlet UIView *segmentBaseView;



@end

@implementation ProfileHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configProfileViewStyle];
    
    [self fillProfileView:[[TwitterAPI sharedManager]ownUserID]];
    
    
}


- (void)fillProfileView:(NSString *)userID {
    
    User *user = [[CoreDataInterface sharedManager]getUserWithId:userID];
    self.profileNicknameLabel.text = user.name;
    self.profileNameLabel.text = user.screen_name;
}



- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    [self layoutBackgroundImageView];
    [self layoutProfileImageBaseView];
    [self layoutNavigationTitleView];
    [self updateNavigationBarAppearance];
    
}

- (void)configProfileViewStyle {
    
    self.defaultViewHeight = self.view.frame.size.height;
    self.defaultBackgroundImageViewHeight = self.backgroundImageView.frame.size.height;
    self.defaultNavigationTitleViewTop = self.navigationTitleView.frame.origin.y;
    
    CGFloat profileImageBaseMinimumHeight = self.profileImageBaseView.frame.origin.y + self.profileImageBaseView.frame.size.height - self.defaultBackgroundImageViewHeight;
    self.profileImageBaseMinimumScale = profileImageBaseMinimumHeight / self.profileImageBaseView.frame.size.height;
    
    self.profileImageBaseView.clipsToBounds = YES;
    self.profileImageBaseView.layer.cornerRadius = 6;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 3;
    
    self.profileImageBaseView.layer.anchorPoint = CGPointMake(0.5, 1);
    CGRect frame = self.profileImageBaseView.frame;
    frame.origin.y += frame.size.height / 2;
    self.profileImageBaseView.frame = frame;
}

- (CGFloat)minimumViewHeight {
    return self.navigationBarView.frame.size.height + self.segmentBaseView.frame.size.height;
}

- (void)layoutBackgroundImageView {
    CGFloat navigationBarHeight = self.navigationBarView.frame.size.height;
    
    CGFloat y = 0;
    CGFloat height = 0;
    
    CGRect frame = self.backgroundImageView.frame;
    
    CGFloat diff = self.view.frame.size.height - self.defaultViewHeight;
    
    if (diff >= 0) {
        height = self.defaultBackgroundImageViewHeight + diff;
        y = 0;
    } else {
        height = self.defaultBackgroundImageViewHeight;
        
        y = MAX(diff, navigationBarHeight - self.defaultBackgroundImageViewHeight);
    }
    
    frame.size.height = height;
    
    frame.origin.y = y;
    
    self.backgroundImageView.frame = frame;
}

- (void)layoutProfileImageBaseView {
    CGFloat navigationBarHeight = self.navigationBarView.frame.size.height;
    
    self.profileImageBaseView.transform = CGAffineTransformIdentity;
    
    CGFloat diff = self.view.frame.size.height - self.defaultViewHeight;
    if (diff < 0) {
        if (diff > navigationBarHeight - self.defaultBackgroundImageViewHeight) {
            CGFloat scale = 1 + ((self.profileImageBaseMinimumScale - 1) * diff / (navigationBarHeight - self.defaultBackgroundImageViewHeight));
            self.profileImageBaseView.transform = CGAffineTransformScale(self.profileImageBaseView.transform, scale, scale);
            [self.view bringSubviewToFront:self.profileImageBaseView];
        } else {
            self.profileImageBaseView.transform = CGAffineTransformScale(self.profileImageBaseView.transform, self.profileImageBaseMinimumScale, self.profileImageBaseMinimumScale);
            [self.view sendSubviewToBack:self.profileImageBaseView];
        }
    }
}

- (void)layoutNavigationTitleView {
    CGRect frame = self.navigationTitleView.frame;
    
    CGFloat y = self.profileNameLabel.frame.origin.y;
    if (y > self.defaultNavigationTitleViewTop) {
        frame.origin.y = self.profileNameLabel.frame.origin.y;
    } else {
        frame.origin.y = self.defaultNavigationTitleViewTop;
    }
    
    self.navigationTitleView.frame = frame;
}

- (void)updateNavigationBarAppearance {
    CGFloat currentTitleY = self.navigationTitleView.frame.origin.y;
    CGFloat navigationBarBottom = self.navigationBarView.frame.size.height;
    
    CGFloat alpha = 0;
    if (currentTitleY < navigationBarBottom) {
        alpha = (navigationBarBottom - currentTitleY) / (navigationBarBottom - self.defaultNavigationTitleViewTop);
    }
    
    self.navigationTitleView.alpha = alpha;
    self.navigationBarView.backgroundColor = [UIColor colorWithWhite:0 alpha:alpha / 2];
}

@end
