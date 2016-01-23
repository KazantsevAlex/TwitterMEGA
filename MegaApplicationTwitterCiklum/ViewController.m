//
//  ViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong)TwitterAPI *twitter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.twitter = [TwitterAPI new];
    
    [self.twitter loginAction];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
