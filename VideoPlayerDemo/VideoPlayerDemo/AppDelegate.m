//
//  AppDelegate.m
//  VideoPlayerDemo
//
//  Created by guojun on 11/16/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "KNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - Private Methods
- (KNavigationController *)nav{
    
    ViewController *vc = [ViewController new];
    KNavigationController *nav = [[KNavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}
#pragma mark - Application
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.clipsToBounds = YES;
    self.window.rootViewController = [self nav];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
