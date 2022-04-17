//
//  SSPEssenceViewController.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/16.
//

#import "SSPEssenceViewController.h"

@interface SSPEssenceViewController ()

@end

@implementation SSPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupNavBar];
}

#pragma mark - 设置导航条
- (void)setupNavBar {
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"nav_item_game_icon"] withHightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] addTarget:self action:@selector(game)];
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    // 右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"navigationButtonRandom"] withHightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] addTarget:nil action:nil];
}

#pragma mark - 监听left button点击事件
- (void)game {
    SSPFunc;
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
