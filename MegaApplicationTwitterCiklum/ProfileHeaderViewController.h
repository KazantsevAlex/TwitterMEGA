//
//  ProfileHeaderViewController.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 2/5/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataInterface.h"
#import "TwitterAPI.h"
#import "User.h"

@interface ProfileHeaderViewController : UIViewController

@property (nonatomic) CGFloat minimumViewHeight;
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
@property (weak, nonatomic) IBOutlet UILabel *userTweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileBarNameLabel;

/*
 * Static methods
 */

+ (void)setUserID:(NSString*)value;

/*
 * Instance methods
 */

- (void)setUserId:(NSString *)userId;

@end
