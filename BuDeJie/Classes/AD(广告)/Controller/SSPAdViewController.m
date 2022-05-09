//
//  SSPAdViewController.m
//  BuDeJie
//
//  Created by 苏文建 on 2022/5/8.
//

#import "SSPAdViewController.h"
#import "SSPADItem.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "SSPTabBarController.h"

@interface SSPAdViewController ()

@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property(nonatomic, weak) UIImageView *adView;
@property(nonatomic, strong) SSPADItem *item;
@property(nonatomic, weak) NSTimer *timer;

@end

@implementation SSPAdViewController

- (UIImageView *)adView {
    if (_adView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.adContainView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        
        _adView = imageView;
    }
    return _adView;
}

// 点击广告界面调用
- (void)tap {
    NSURL *url = [NSURL URLWithString:self.item.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        if (IOSversion >= 10.0) {
            [app openURL:url options:@{} completionHandler:nil];
        } else {
            [app openURL:url];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置启动图片
    [self setupLaunchImage];
    
    // [self loadAdData];
    
    // 创建定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

- (void)timeChange {
    static int i = 3;
    i--;
    if (i == 0) {
        [self clearTimer:nil];
    }
    
    // 设置跳转按钮文字
    [self.jumpBtn setTitle:[NSString stringWithFormat:@"跳过 (%d)", i] forState:UIControlStateNormal];
}

// 点击跳转按钮调用
- (IBAction)clearTimer:(id)sender {
    SSPTabBarController *tabBarVc = [[SSPTabBarController alloc] init];
    // [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
    [self ssp_keyWindow].rootViewController = tabBarVc;
    [self.timer invalidate];
}

- (UIWindow *)ssp_keyWindow {
    UIWindow *keyWindow = nil;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            keyWindow = window;
            break;
        }
    }
    return keyWindow;
}

- (void)loadAdData {
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mg = [AFHTTPSessionManager manager];
    mg.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",  @"text/html", @"text/json", @"text/javascript", @"multipart/form-data"]];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = @"";
    
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    
    // 2.发送请求
    [mg GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        NSDictionary *dict = [responseObject[@"ad"] lastObject];
        
        self.item = [SSPADItem mj_objectWithKeyValues:dict];
        
        CGFloat h = SSPScreenW / self.item.w * self.item.h;
        self.adView.frame = CGRectMake(0, 0, SSPScreenW, h);
        [self.adView sd_setImageWithURL:[NSURL URLWithString:self.item.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)setupLaunchImage {
    // 6p LaunchImage-800-Portrait-736h@3x.png
    // 6 LaunchImage-800-667h@2x.png
    // 5 LaunchImage-700-568h@2x.png
    // 4s LaunchImage@2x.png
    NSString *launchImage = @"";
    if (iphone6P) {
        launchImage = @"LaunchImage-800-Portrait-736h@3x.png";
    } else if (iphone6) {
        launchImage = @"LaunchImage-800-667h@2x.png";
    } else if (iphone5) {
        launchImage = @"LaunchImage-700-568h@2x.png";
    } else if (iphone4) {
        launchImage = @"LaunchImage@2x.png";
    }
    
    self.launchImageView.image = [UIImage imageNamed:launchImage];
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
