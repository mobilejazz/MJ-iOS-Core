//
//  ViewController.m
//  Architecture
//
//  Created by Joan Martin on 15/10/15.
//  Copyright © 2015 Mobile Jazz. All rights reserved.
//

#import "ViewController.h"

#import "MJAppManager.h"
#import "MJCurrentUserInteractor.h"

@interface ViewController ()

@end

@implementation ViewController
{
    MJCurrentUserInteractor *_currentUserInteractor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currentUserInteractor = [[MJCurrentUserInteractor alloc] initWithUserDataProvider:[MJAppManager sharedInstance].userDataProvider];
    [_currentUserInteractor execute:^(MJUser *user, NSError *error) {
        NSLog(@"USER: %@", user.description);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
