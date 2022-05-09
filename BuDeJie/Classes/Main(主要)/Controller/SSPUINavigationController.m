//
//  SSPUINavigationController.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/5/6.
//

#import "SSPUINavigationController.h"

@interface SSPUINavigationController () <UIGestureRecognizerDelegate>

@end

@implementation SSPUINavigationController

+ (void)load {
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    // UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    // 设置导航条标题
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    // 设置导航条的背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 控制手势什么时候触发，只有非根控制器才需要触发手势
    self.interactivePopGestureRecognizer.delegate = nil;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition)];
    [self.view addGestureRecognizer:pan];
    
    pan.delegate = self;
    
    self.interactivePopGestureRecognizer.enabled = NO;
    // 假死状态：程序还在运行，但是界面死了
}

#pragma mark - UIGestureRecognizerDelegate
// 决定是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}

- (void)handleNavigationTransition {
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        // 设置导航条左边按钮,只有非根控制器设置
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] withHightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] addTarget:self action:@selector(back) title:@"返回"];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
