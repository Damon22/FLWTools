//
//  UITableViewController+Extension.h
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewController (MXExtension)
/*** 替换tableView数据源对象 */
-(void)replacedDataSource;
/*** 替换tableView代理对象 */
-(void)replacedDelegate;
/*** 替换tableView数据源对象和代理对象 */
-(void)replacedDataSourceAndDelegate;
@end
