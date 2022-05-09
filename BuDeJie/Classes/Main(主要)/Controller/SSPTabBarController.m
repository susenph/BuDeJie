//
//  SSPTabBarController.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/17.
//

#import "SSPTabBarController.h"
#import "SSPEssenceViewController.h"
#import "SSPMeViewController.h"
#import "SSPNewViewController.h"
#import "SSPPublishViewController.h"
#import "SSPFriendTrendViewController.h"
#import "UIImage+SSPImage.h"
#import "SSPTabBar.h"
#import "SSPUINavigationController.h"

@interface SSPTabBarController ()

@end

@implementation SSPTabBarController

// 只会调用一次
+ (void)load {
    // 获取整个应用程序下的uitabbaritem
    // UITabBarItem *item = [UITabBarItem appearance];
    // 获取那个类中的UITabBarItem appearance:只能在控件显示之前设置才有作用
    NSMutableArray *tabbarArray = [NSMutableArray array];
    [tabbarArray addObject:[self class]];
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:tabbarArray];
    // 设置按钮选中标题的颜色：富文本：描述一个文字颜色、字体、阴影、空心、图文混排
    // 创建一个描述文本熟悉的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸：只有设置正常状态下，才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13 ];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}

// 可能会调用多次
//+ (void)initialize {
//    if (self == [SSPTabBarController class]) {
//
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 2.1 添加子控制器 -》 自定义控制器 -》 划分项目文件结构
    
    // 精华
    [self addCustomChildViewController:[[SSPEssenceViewController alloc] init] withTitle:@"精华" withImage:[UIImage imageNamed:@"tabBar_essence_icon"] withSelectImage:[UIImage imageNamed:@"tabBar_essence_click_icon"]];
    // 新帖
    [self addCustomChildViewController:[[SSPNewViewController alloc] init] withTitle:@"新帖" withImage:[UIImage imageNamed:@"tabBar_new_icon"] withSelectImage:[UIImage imageNamed:@"tabBar_new_click_icon"]];
    // 关注
    [self addCustomChildViewController:[[SSPFriendTrendViewController alloc] init] withTitle:@"关注" withImage:[UIImage imageNamed:@"tabBar_friendTrends_icon"] withSelectImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"]];
    // 我
    [self addCustomChildViewController:[[SSPMeViewController alloc] init] withTitle:@"我" withImage:[UIImage imageNamed:@"tabBar_me_icon"] withSelectImage:[UIImage imageNamed:@"tabBar_me_click_icon"]];
    
    // 2.2 设置tabbar按钮的内容
    
    // 自定义tabBar
    [self setupTabBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // NSLog(@"%@", self.tabBar.subviews);
}

#pragma mark - 自定义tabBar
- (void)setupTabBar {
    SSPTabBar *tabBar = [[SSPTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}

#pragma mark - 添加所有子控制器
- (void)addCustomChildViewController:(UIViewController *) vc withTitle:(NSString *) title withImage:(UIImage *) image withSelectImage:(UIImage *) selectImage {
    SSPUINavigationController *nav = [[SSPUINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
