//
//  ComposerViewController.h
//  
//
//  Created by Alexandr Lobanov on 2/23/16.
//
//

#import <REComposeViewController/REComposeViewController.h>
#import "StoreCoordinator.h"
#import "Parser.h"
#import "AlertViewController.h"

@interface ComposerViewController : REComposeViewController

- (void)postTweet:(id)it;

@end
