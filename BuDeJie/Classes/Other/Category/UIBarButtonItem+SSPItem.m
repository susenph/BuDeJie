//
//  UIBarButtonItem+SSPItem.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/17.
//

#import "UIBarButtonItem+SSPItem.h"

@implementation UIBarButtonItem (SSPItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image withHightImage:(UIImage *)heightImage addTarget:(nullable id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:heightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image withSelImage:(UIImage *)selImage addTarget:(nullable id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage  forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containView = [[UIView alloc] initWithFrame:btn.bounds];
    [containView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:containView];
}

@end
