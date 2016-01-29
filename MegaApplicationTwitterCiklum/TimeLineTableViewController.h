//
//  TimeLineTableViewController.h
//  MegaApplicationTwitterCiklum
//
//  Created by Казанцев Алексей on 1/27/16.
//  Copyright © 2016 Alexandr Lobanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewDataSourse.h"
#import "CoreDataInterface.h"

@interface TimeLineTableViewController : UITableViewController

- (void)setCoreData:(CoreDataInterface *)coreData;

@end
