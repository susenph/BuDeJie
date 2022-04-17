//
//  UIView+SSPFrame.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/17.
//

#import "UIView+SSPFrame.h"

@implementation UIView (SSPFrame)

- (void)setSsp_width:(CGFloat)ssp_width {
    CGRect rect = self.frame;
    rect.size.width = ssp_width;
    self.frame = rect;
}

- (CGFloat)ssp_width {
    return self.frame.size.width;
}

- (void)setSsp_height:(CGFloat)ssp_height {
    CGRect rect = self.frame;
    rect.size.height = ssp_height;
    self.frame = rect;
}

- (CGFloat)ssp_height {
    return self.frame.size.height;
}

- (void)setSsp_x:(CGFloat)ssp_x {
    CGRect rect = self.frame;
    rect.origin.x = ssp_x;
    self.frame = rect;
}

- (CGFloat)ssp_x {
    return self.frame.origin.x;
}

- (void)setSsp_y:(CGFloat)ssp_y {
    CGRect rect = self.frame;
    rect.origin.y = ssp_y;
    self.frame = rect;
}

- (CGFloat)ssp_y {
    return self.frame.origin.y;
}

@end
