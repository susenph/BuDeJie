//
//  SSPNewViewController.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/4/16.
//

#import "SSPNewViewController.h"

@interface SSPNewViewController ()

@end

@implementation SSPNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    [self setupNavBar];
}

#pragma mark - 设置导航条
- (void)setupNavBar {
    // 左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] withHightImage:[UIImage imageNamed:@"MainTagSubIconClick"] addTarget:self action:@selector(tagClick)];
    // titleView
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

#pragma mark - 监听left button点击事件
- (void)tagClick {
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
