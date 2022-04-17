//
//  SSPFriendTrendViewController.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/16.
//

#import "SSPFriendTrendViewController.h"

@interface SSPFriendTrendViewController ()

@end

@implementation SSPFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavBar];
}

#pragma mark - 设置导航条
- (void)setupNavBar {
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] withHightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] addTarget:self action:@selector(friendsRecomment)];
    // titleView
    self.navigationItem.title = @"我的关注";
}

#pragma mark - 监听left button点击事件
- (void)friendsRecomment {
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
