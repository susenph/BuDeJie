//
//  UIBarButtonItem+SSPItem.h
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (SSPItem)

+ (UIBarButtonItem *)itemWithImage:(UIImage *)image withHightImage:(UIImage *)heightImage addTarget:(nullable id)target action:(SEL)action;
+ (UIBarButtonItem *)backItemWithImage:(UIImage *)image withHightImage:(UIImage *)heightImage addTarget:(nullable id)target action:(SEL)action title:(NSString *)title;
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image withSelImage:(UIImage *)selImage addTarget:(nullable id)target action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
