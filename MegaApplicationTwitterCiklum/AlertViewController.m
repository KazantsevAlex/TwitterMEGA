//
//  AlertViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 2/25/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alert:(id)view messageText:(NSString *)text tittleText:(NSString *)textTittle {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:textTittle
                                  message:text
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    [view presentViewController:alert animated:YES completion:nil];
}

@end
