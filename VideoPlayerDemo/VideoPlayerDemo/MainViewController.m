//
//  MainViewController.m
//  VideoPlayerDemo
//
//  Created by guojun on 11/16/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import "MainViewController.h"
#import "KVideoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Main";
}

- (IBAction)toVideoPage:(id)sender{
    KVideoViewController *vc = [[KVideoViewController alloc] init];
    [self.navigationController pushViewController:vc
                                         animated:YES];
}
@end
