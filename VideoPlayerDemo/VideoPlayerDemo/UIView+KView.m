//
//  UIView+KView.m
//  VideoPlayerDemo
//
//  Created by guojun on 11/16/15.
//  Copyright © 2015 guojunxu. All rights reserved.
//

#import "UIView+KView.h"

@implementation UIView (KView)

- (void)setFrameWidth:(CGFloat)newWidth {
    CGRect f = self.frame;
    f.size.width = newWidth;
    self.frame = f;
}

- (void)setFrameHeight:(CGFloat)newHeight {
    CGRect f = self.frame;
    f.size.height = newHeight;
    self.frame = f;
}

- (void)setFrameOriginX:(CGFloat)newX {
    CGRect f = self.frame;
    f.origin.x = newX;
    self.frame = f;
}

- (void)setFrameOriginY:(CGFloat)newY {
    CGRect f = self.frame;
    f.origin.y = newY;
    self.frame = f;
}

@end
