//
//  UITableViewController+Extension.m
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//
#import "UITableViewController+MXExtension.h"
#import <objc/runtime.h>
#import "MXExtension.h"
@implementation UITableViewController (MXExtension)

/*** 替换tableView数据源对象 */
-(void)replacedDataSource{
    MXDataSource *dataSource = [[MXDataSource alloc] init];
    dataSource.style = MXCellStyleDefault;
    self.tableView.dataSource = dataSource;
}
/*** 替换tableView代理对象 */
-(void)replacedDelegate{
    MXDelegate *delegate = [[MXDelegate alloc] init];
    self.tableView.delegate = delegate;
}
/*** 替换tableView数据源对象和代理对象 */
-(void)replacedDataSourceAndDelegate{
    [self replacedDataSource];
    [self replacedDelegate];
}
@end
