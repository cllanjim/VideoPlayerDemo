//
//  UINavigationController+KNavigationController.m
//  VideoPlayerDemo
//
//  Created by guojun on 11/16/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import "UINavigationController+KNavigationController.h"

@implementation UINavigationController (KNavigationController)

- (void)setNavigationBarAsTransparent{
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
}

- (void)setNavigationBarAsNormal{
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = nil;
    self.navigationBar.translucent = YES;
}

@end
