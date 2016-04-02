//
//  MXDelegate.m
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import "MXDelegate.h"
#import "MXExtension.h"
@implementation MXDelegate

- (instancetype)init{
    if (self = [super init]) {
        self.headerViewHeight = MXheightForHeader;
        self.footerViewHeight = MXheightForHeader;
    }
    return self;
}

#pragma mark - 代理方法
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.sections.count == 0) return nil;
    if(self.headerViewIdentifier){ // 注册了headerView
        UITableViewHeaderFooterView *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.headerViewIdentifier];
        if (self.headerViewDataBlock) {
            self.headerViewDataBlock(headerFooterView,self.headerViewDatas[section]);
        }
        return headerFooterView;
    }
    MXSection *group = self.sections[section];
    return group.headerView ? group.headerView :nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.sections.count == 0) return 0;
    MXSection *group = self.sections[section];
    if (self.headerViewIdentifier) {
        return self.headerViewHeight;
    }
    return group.headerHeight;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.sections.count == 0) return nil;
    if(self.footerViewIdentifier){ // 注册了footerView
        UITableViewHeaderFooterView *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:self.footerViewIdentifier];
        if (self.footerViewDataBlock) {
            self.footerViewDataBlock(headerFooterView,self.footerViewDatas[section]);
        }
        return headerFooterView;
    }
    MXSection *group = self.sections[section];
    return group.footerView ? group.footerView :nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.sections.count == 0) return 0;
    MXSection *group = self.sections[section];
    if (self.footerViewIdentifier) {
        return self.footerViewHeight;
    }
    return group.footerHeight;
}


/**
 *  返回每一行 cell 的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellHeightBlock) {
        MXSection *section = self.sections[indexPath.section];
        id data = section.dataArray[indexPath.row];
        UITableViewCell *cell = [UITableViewCell cellWithTableView:tableView identifier:self.identifier style:UITableViewCellStyleDefault];
        return self.cellHeightBlock(cell,data);
    } else {
        return tableView.rowHeight > 0 ? tableView.rowHeight:44;
    }
}
/**
 *  估计每一行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"----%s",__func__);
    return tableView.rowHeight > 0 ? tableView.rowHeight:44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sections.count == 0) return;
    MXSection *section = self.sections[indexPath.section];
    id data = section.dataArray[indexPath.row];
    if (self.selectRowBlock) {
        self.selectRowBlock(tableView,indexPath,data);
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.deleteBtnTitle ? self.deleteBtnTitle:@"删除";
}
@end
