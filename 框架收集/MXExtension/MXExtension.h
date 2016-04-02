//
//  MXExtension.h
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//
#ifndef __MJConst__H__
#define __MJConst__H__

#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define MXLog(...) NSLog(__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define MXLog(...)
#endif

/**
 *  每一组头部和尾部的默认高度(只有当每一组头部和尾部是字符串的时候有效)
 */
#define MXHeaderFooterTitleHeight 30

#define MXheightForHeader 44

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#import "UIView+MXExtension.h"
#import "UITableView+MXExtension.h"
#import "UITableView+MXHeaderFooterView.h"
#import "UITableViewController+MXExtension.h"
#import "MXSection.h"
// 断言
#define MXAssert(condition, desc) \
if ((condition) == NO) { \
NSString *file = [NSString stringWithUTF8String:__FILE__]; \
MXLog(@"\n警告文件：%@\n警告行数：第%d行\n警告方法：%s\n警告描述：%@", file, __LINE__,  __FUNCTION__, desc); \
}
/**
 该框架的好处:
 1> 使用tableView不需要设置数据源和代理,通过MXSection提供数据即可。一个MXSection模型代表tableView的一组。(由于UITableViewController的tableView数据源和代理默认都是控制器本身,所以要 UITableViewController 要使用以下功能需要先执行一句代码。请查看UITableViewController+MXExtension的方法声明)
 
 2> 关联cell和监听cell内部按钮的点击事件一句代码搞定。抛弃通过代理监听cell内部按钮点击模式。
 
 3> 一行代码实现滑动删除功能，并设置删除按钮的显示的标题
 
 4> 一句代码设置tableHeaderView和tableFooterView。
 
 5> 一句代码设置每一组的tableHeaderFooterView。
 
 6> 一句代码实现在tableView顶部添加工具条,并且工具条不会跟随tableView的滚动而滚动。
 
 
 */
#endif




