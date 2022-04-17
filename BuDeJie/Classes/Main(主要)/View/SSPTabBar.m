//
//  SSPTabBar.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/17.
//

#import "SSPTabBar.h"

@interface SSPTabBar ()

@property(nonatomic, weak) UIButton *publishButton;

@end

@implementation SSPTabBar

- (UIButton *)publishButton {
    if (_publishButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [btn sizeToFit];
        [self addSubview:btn];
        _publishButton = btn;
    }
    return _publishButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 跳转tabBarButton位置
    NSInteger count = self.items.count;
    CGFloat btnW = self.ssp_width / (count + 1);
    CGFloat btnH = self.ssp_height;
    CGFloat x = 0;
    int i = 0;
    // NSLog(@"%@", self.subviews);
    // 遍历子控件 调整布局
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:(NSClassFromString(@"UITabBarButton"))]) {
            NSLog(@"");
            if (i == 2) {
                i += 1;
            }
            x = i *btnW;
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            i++;
        }
    }
    
    // 调整发布按钮的位置
    self.publishButton.center = CGPointMake(self.ssp_width * .5, self.ssp_height * .5);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
