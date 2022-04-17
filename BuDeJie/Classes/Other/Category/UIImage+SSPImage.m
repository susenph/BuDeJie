//
//  UIImage+SSPImage.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/17.
//

#import "UIImage+SSPImage.h"

@implementation UIImage (SSPImage)

+ (UIImage *)imageOriginalWithName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
