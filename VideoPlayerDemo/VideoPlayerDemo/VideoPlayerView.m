//
//  VideoPlayerView.m
//  VideoPlayerDemo
//
//  Created by guojun on 11/16/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import "VideoPlayerView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIView+KView.h"

@interface VideoPlayerView()

@property (nonatomic, strong) UIImageView *videoCoverImageView;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *fullScreenButton;

@property (nonatomic, assign) BOOL isFullScreen;
@end

@implementation VideoPlayerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadView];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadView];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self configurePlayButton];
    [self configureFullScreenButton];
}

#pragma mark - Private Methods
- (void)loadView{
    [self addSubview:self.videoCoverImageView];
    [self addSubview:self.playButton];
    [self addSubview:self.fullScreenButton];
}

- (void)configurePlayButton{
    
    CGFloat width = 66;
    CGFloat height = 66;
    
    CGFloat x = (self.bounds.size.width - width) / 2;
    CGFloat y = (self.bounds.size.height - height) / 2;
    
    self.playButton.frame = CGRectMake(x, y, width, height);
}

- (void)configureFullScreenButton{
    CGFloat width = 40;
    CGFloat height = 40;
    
    CGFloat x = self.bounds.size.width - width;
    CGFloat y = self.bounds.size.height - height;
    
    self.fullScreenButton.frame = CGRectMake(x, y, width, height);
}

#pragma mark - Action
- (void)playButtonDidPress:(id)sender{
    if ([self.delegate respondsToSelector:@selector(videoPlayerViewDidPressPlayButton:)]) {
        [self.delegate videoPlayerViewDidPressPlayButton:self];
    }
}

- (void)fullScreenButtonDidPress:(id)sender{
    
    self.isFullScreen = !self.isFullScreen;
    self.fullScreenButton.selected = self.isFullScreen;
    if ([self.delegate respondsToSelector:@selector(videoPlayerViewDidPressFullScreenButton:)]) {
        [self.delegate videoPlayerViewDidPressFullScreenButton:self];
    }
}
#pragma mark - Getters & Setters
- (UIImageView *)videoCoverImageView{
    if (!_videoCoverImageView) {
        _videoCoverImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _videoCoverImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    
    return _videoCoverImageView;
}

- (UIButton *)playButton{
    if (!_playButton) {

        _playButton = [[UIButton alloc] init];
        [_playButton setImage:[UIImage imageNamed:@"player_play"] forState:(UIControlStateNormal)];
        [_playButton addTarget:self action:@selector(playButtonDidPress:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _playButton;
}

- (UIButton *)fullScreenButton{
    if (!_fullScreenButton) {
    
        _fullScreenButton = [[UIButton alloc] init];
        
        [_fullScreenButton setImage:[UIImage imageNamed:@"player_zoom_in"] forState:(UIControlStateNormal)];
        [_fullScreenButton setImage:[UIImage imageNamed:@"player_zoom_out"] forState:(UIControlStateSelected)];
        
        [_fullScreenButton addTarget:self action:@selector(fullScreenButtonDidPress:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    return _fullScreenButton;
}

- (void)setVideoCoverImageURL:(NSString *)videoCoverImageURL{
    _videoCoverImageURL = videoCoverImageURL;
    
    [self.videoCoverImageView sd_setImageWithURL:[NSURL URLWithString:videoCoverImageURL]
                                placeholderImage:nil];
}

@end
