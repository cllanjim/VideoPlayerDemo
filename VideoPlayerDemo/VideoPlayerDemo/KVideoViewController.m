//
//  ViewController.m
//  VideoPlayerDemo
//
//  Created by guojun on 11/16/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import "KVideoViewController.h"
#import "UINavigationController+KNavigationController.h"
#import "VideoPlayerView.h"
#import "UIView+KView.h"

#define ImageURL @"http://video.kk8.cdn.bj.xs3cnc.com/2c/s/covers/wyopen_35.jpg"
#define degreesToRadians(x) (M_PI * x / 180.0f)

@interface KVideoViewController ()<VideoPlayerViewDelegate>

@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) UIBarButtonItem *shareButton;
@property (nonatomic, strong) VideoPlayerView *playerView;

@end

@implementation KVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.backButton;
    self.navigationItem.rightBarButtonItem = self.shareButton;

    [self.view addSubview:self.playerView];
    self.playerView.videoCoverImageURL = ImageURL;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarAsTransparent];
    [self addDeviceOrientationChangeNotification];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarAsNormal];
    [self removeDeviceOrientationChangeNotification];
}

#pragma mark - Private Method
- (CGSize)screenSize{
    return [UIScreen mainScreen].bounds.size;
}

- (CGRect)videoPlayerViewLandscapeFrame{
    CGFloat height = MIN([self screenSize].width, [self screenSize].height);
    CGFloat width = MAX([self screenSize].width, [self screenSize].height);
    
    return CGRectMake(0, 0, width, height);
}

- (CGRect)videoPlayerViewPortraitFrame{
    CGFloat width = MIN([self screenSize].width, [self screenSize].height);
    CGFloat height = width * 9 / 16;// width : height = 16 : 9
    
    return CGRectMake(0, 0, width, height);
}

- (void)addDeviceOrientationChangeNotification{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self
                      selector:@selector(orientationChanged:)
                          name:UIDeviceOrientationDidChangeNotification
                        object:[UIDevice currentDevice]];
}

- (void)removeDeviceOrientationChangeNotification{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter removeObserver:self
                             name:UIDeviceOrientationDidChangeNotification
                           object:[UIDevice currentDevice]];
}

- (CGFloat)degreesForOrientation:(UIInterfaceOrientation)deviceOrientation {
    switch (deviceOrientation) {
        case UIInterfaceOrientationUnknown:
        case UIInterfaceOrientationPortrait:
            return 0;
            break;
        case UIInterfaceOrientationLandscapeRight:
            return 90;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            return -90;
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            return 180;
            break;
    }
}

- (void)orientationChanged:(NSNotification *)note {
    UIDevice * device = note.object;
    
    UIInterfaceOrientation rotateToOrientation;
    switch(device.orientation) {
        case UIDeviceOrientationPortrait:
            NSLog(@"ORIENTATION: Portrait");
            rotateToOrientation = UIInterfaceOrientationPortrait;
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"ORIENTATION: PortraitDown");
            rotateToOrientation = UIInterfaceOrientationPortraitUpsideDown;
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"ORIENTATION: LandscapeRight");
            rotateToOrientation = UIInterfaceOrientationLandscapeRight;
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"ORIENTATION: LandscapeLeft");
            rotateToOrientation = UIInterfaceOrientationLandscapeLeft;
            break;
        default:
            rotateToOrientation = UIInterfaceOrientationUnknown;
            break;
    }
    
    [self performOrientationChange:rotateToOrientation];
}

- (void)performOrientationChange:(UIInterfaceOrientation)deviceOrientation{
    
    CGFloat degrees = [self degreesForOrientation:deviceOrientation];
    
    if (UIInterfaceOrientationIsLandscape(deviceOrientation)) {
        
        [self.navigationController setNavigationBarHidden:YES];
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:(UIStatusBarAnimationNone)];
        
        [UIView animateWithDuration:0.3f animations:^{
            self.playerView.transform = CGAffineTransformMakeRotation(degreesToRadians(degrees));
            self.playerView.bounds = [self videoPlayerViewLandscapeFrame];
            [self.playerView setFrameOriginX:0.0f];
            [self.playerView setFrameOriginY:0.0f];
            
            [self.view layoutIfNeeded];
        }];
        
        [self.playerView setValue:@"YES" forKeyPath:@"fullScreenButton.selected"];
    }
    
    else if (UIInterfaceOrientationIsPortrait(deviceOrientation)) {
        
        [self.navigationController setNavigationBarHidden:NO];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:(UIStatusBarAnimationNone)];
        
        [UIView animateWithDuration:0.3f animations:^{
            self.playerView.transform = CGAffineTransformMakeRotation(degreesToRadians(degrees));
            self.playerView.bounds = [self videoPlayerViewPortraitFrame];
            [self.playerView setFrameOriginX:0.0f];
            [self.playerView setFrameOriginY:0.0f];
            
            [self.view layoutIfNeeded];
        }];
        
        [self.playerView setValue:@"NO" forKeyPath:@"fullScreenButton.selected"];
    }
}

#pragma mark - VideoPlayerViewDelegate
- (void)videoPlayerViewDidPressPlayButton:(VideoPlayerView *)playerView{
    
}

- (void)videoPlayerViewDidPressFullScreenButton:(VideoPlayerView *)playerView{
    if (playerView.isFullScreen) {
        [self performOrientationChange:UIInterfaceOrientationLandscapeLeft];
    } else {
        [self performOrientationChange:UIInterfaceOrientationPortrait];
    }
}

#pragma mark - IBAction
- (void)backButtonDidPress:(UIBarButtonItem *)sender{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)shareButtonDidPress:(UIBarButtonItem *)sender{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - Delegate
- (BOOL)shouldAutorotate{
    return NO;
}

#pragma mark - Getters & Setters
- (UIBarButtonItem *)backButton{
    if (!_backButton) {
        _backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back_nor"]
                                         landscapeImagePhone:[UIImage imageNamed:@"nav_back_nor"]
                                                       style:(UIBarButtonItemStylePlain)
                                                      target:self
                                                      action:@selector(backButtonDidPress:)];
    }
    
    return _backButton;
}

- (UIBarButtonItem *)shareButton{
    if (!_shareButton) {
        _shareButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_share_nor"]
                                          landscapeImagePhone:[UIImage imageNamed:@"nav_share_nor"]
                                                        style:(UIBarButtonItemStylePlain)
                                                       target:self
                                                       action:@selector(shareButtonDidPress:)];
    }
    
    return _shareButton;
}

- (VideoPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [[VideoPlayerView alloc] initWithFrame:[self videoPlayerViewPortraitFrame]];
        _playerView.delegate = self;
    }
    
    return _playerView;
}

@end
