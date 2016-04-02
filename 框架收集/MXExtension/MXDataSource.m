//
//  MXDataSource.m
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import "MXDataSource.h"
@interface MXDataSource()
@property(nonatomic,strong) NSMutableArray *sections;
@end
@implementation MXDataSource

- (NSMutableArray *)sections {
    if (_sections == nil) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}
/**
 *  返回 cell 的样式
 */
- (UITableViewCellStyle)cellStyle{
    if (self.style == MXCellStyleDefault) {
        return UITableViewCellStyleDefault;
    } else if (self.style == MXCellStyleValue1){
        return UITableViewCellStyleValue1;
    } else if (self.style == MXCellStyleValue2){
        return UITableViewCellStyleValue2;
    } else if (self.style == MXCellStyleSubtitle){
        return UITableViewCellStyleSubtitle;
    }
    return UITableViewCellStyleDefault;
}
#pragma mark -  数据源
/**
 *  返回组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections.count;
}
/**
 *  返回对应组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MXSection *group = self.sections[section];
    return group.dataArray.count;
}

/**
 *  返回每一行展示的内容(cell)
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MXSection *section = self.sections[indexPath.section];
    id data = section.dataArray[indexPath.row];
    UITableViewCell *cell = nil;
    if (self.cellForRowBlock) {
        cell = self.cellForRowBlock(tableView,indexPath,data);
    } else {
        cell = [UITableViewCell cellWithTableView:tableView identifier:self.identifier style:[self cellStyle] ];
    }
    if (self.setCellDataBlock) {
        self.setCellDataBlock(cell,data);
    }
    return cell;
}



/**
 *  返回第 section 组头部要显示的字符串
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (self.sections.count == 0) return nil;
    MXSection *group = self.sections[section];
    return group.headerTitle;
}

/**
 *  返回第 section 尾部部要显示的字符串
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (self.sections.count == 0) return nil;
    MXSection *group = self.sections[section];
    return group.footerTitle;
}

/**
 *  提交一个编辑操作
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) { // 提交的是删除操作
        if (self.deleteRowBlock) {
            MXSection *section = self.sections[indexPath.section];
            id data = section.dataArray[indexPath.row];
            self.deleteRowBlock(tableView,indexPath,data);
        }
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.deleteRowBlock ? YES:NO;
}

@end
