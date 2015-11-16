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

@property (nonatomic, strong) UIButton *goButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Main";
    [self.view addSubview:self.goButton];
}

- (void)toVideoPage:(id)sender{
    KVideoViewController *vc = [[KVideoViewController alloc] init];
    [self.navigationController pushViewController:vc
                                         animated:YES];
}

#pragma mark - Getters & Setters
- (UIButton *)goButton{
    if (!_goButton) {
        _goButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 240, 220, 40)];
        [_goButton setTitle:@"Go to Video Page" forState:(UIControlStateNormal)];
        [_goButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
        [_goButton addTarget:self
                      action:@selector(toVideoPage:)
            forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _goButton;
}
@end
