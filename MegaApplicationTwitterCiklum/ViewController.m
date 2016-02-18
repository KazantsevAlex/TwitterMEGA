//
//  ViewController.m
//  MegaApplicationTwitterCiklum
//
//  Created by Alexandr Lobanov on 1/22/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) TwitterAPI *twitter;
@property (nonatomic, strong) CoreDataInterface *interface;
@property (nonatomic, strong) __block NSString *sinceID;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initObjects];
    self.sinceID = @"";
    [[TwitterAPI sharedManager] loginAction];
}

-(void)initObjects {
    
    self.twitter = [TwitterAPI new];
    self.interface = [CoreDataInterface new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

