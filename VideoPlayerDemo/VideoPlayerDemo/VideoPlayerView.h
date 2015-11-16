//
//  VideoPlayerView.h
//  VideoPlayerDemo
//
//  Created by guojun on 11/16/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoPlayerView;
@protocol VideoPlayerViewDelegate <NSObject>

@required
- (void)videoPlayerViewDidPressPlayButton:(VideoPlayerView *)playerView;
- (void)videoPlayerViewDidPressFullScreenButton:(VideoPlayerView *)playerView;

@end
@interface VideoPlayerView : UIView

@property (nonatomic, assign, readonly) BOOL isFullScreen;
@property (nonatomic, copy) NSString *videoCoverImageURL;
@property (nonatomic, weak) IBOutlet id<VideoPlayerViewDelegate> delegate;

@end
