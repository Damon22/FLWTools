//
//  XMGGudieTool.m
//  小码哥彩票
//
//  Created by xiaomage on 15/7/1.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGGudieTool.h"

#import "XMGTabBarController.h"

#import "XMGNewFeatureViewController.h"

#define XMGVersionKey @"version"

#import "XMGSaveTool.h"


@implementation XMGGudieTool

+ (UIViewController *)chooseRootViewController
{
    // 判断下有没有最新的版本号
    // 获取用户最新的版本号，info.plist
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    // 获取上一次的版本号 =》 先保存版本号 =》 偏好设置保存 =》每次进入新特性界面的时候表示有最新的版本号，这时候才需要保证
    
    // 获取上一次版本号
    NSString *oldVersion = [XMGSaveTool objectForKey:XMGVersionKey];
    
    
    UIViewController *rootVc = nil;
    
    if ([curVersion isEqualToString:oldVersion]) {
        // 没有最新的版本号,进入核心界面
        // 创建窗口跟控制器
        // UITabBarController控制器的view不是懒加载，在创建控制器的时候就会加载。
        rootVc = [[XMGTabBarController alloc] init];
        
    }else{ // 有最新的版本号，进入新特性界面,保存当前的最新版本号
        
        
        // CollectionViewVC必须在初始化的时候设置布局参数
        rootVc = [[XMGNewFeatureViewController alloc] init];
        
        [XMGSaveTool setObject:curVersion forKey:XMGVersionKey];
        
        
    }
    
    return rootVc;

}

@end
