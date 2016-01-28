//
//  UserProfileEditViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/28/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "UserProfileEditViewController.h"

@interface UserProfileEditViewController ()

@property (nonatomic,strong) TwitterAPI *twitterApi;

@end

@implementation UserProfileEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTwitterApi:(TwitterAPI *)twitterApi
{
    self.twitterApi = twitterApi;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
