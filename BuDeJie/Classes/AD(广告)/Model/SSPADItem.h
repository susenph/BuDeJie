//
//  SSPADItem.h
//  BuDeJie
//
//  Created by 苏文建 on 2022/5/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSPADItem : NSObject

// 广告地址
@property(nonatomic, strong) NSString *w_picurl;
// 点击广告跳转的界面
@property(nonatomic, strong) NSString *ori_curl;

@property(nonatomic, assign) CGFloat w;
@property(nonatomic, assign) CGFloat h;

@end

NS_ASSUME_NONNULL_END
