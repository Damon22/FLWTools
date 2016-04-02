//
//  HMSection.m
//  TableViewDemo
//
//  Created by pkxing on 15/1/30.
//  Copyright (c) 2015年 梦醒. All rights reserved.


#import "MXSection.h"
#import "MXExtension.h"
@interface MXSection()

@end
@implementation MXSection

- (void)setHeaderTitle:(NSString *)headerTitle {
    _headerTitle = [headerTitle copy];
    _headerHeight = MXHeaderFooterTitleHeight;
}

- (void)setFooterTitle:(NSString *)footerTitle {
    _footerTitle = [footerTitle copy];
    _footerHeight = MXHeaderFooterTitleHeight;
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = [dataArray mutableCopy];
}
#pragma mark - 构造方法
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray{
    MXSection *section = [[self alloc] init];
    section.dataArray = dataArray;
    return section;
}

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray xibForHeaderView:(NSString *)xibName completion:(MXTableHeaderViewBlock)complete{
    MXSection *section = [self sectionWithDataArray:dataArray];
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    if (complete) {
        complete(headerView);
    }
    section.headerHeight = headerView.frame.size.height;
    section.headerView = headerView;
    return section;
}

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerView:(UIView *)headerView{
    MXSection *section = [self sectionWithDataArray:dataArray];
    section.headerView = headerView;
    return section;
}
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerView:(UIView *)headerView headerHeight:(CGFloat)headerHeight{
    MXSection *section = [self sectionWithDataArray:dataArray headerView:headerView];
    section.headerHeight = headerHeight;
    return section;
}

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray xibForFooterView:(NSString *)xibName completion:(MXTableFooterViewBlock)complete{
    MXSection *section = [self sectionWithDataArray:dataArray];
    UIView *footerView = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    if (complete) {
        complete(footerView);
    }
    section.footerHeight = footerView.frame.size.height;
    section.footerView = footerView;
    return section;
}
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray footerView:(UIView *)footerView footerHeight:(CGFloat)footerHeight{
    MXSection *section = [self sectionWithDataArray:dataArray];
    section.footerView = footerView;
    section.footerHeight = footerHeight;
    return section;
}

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerView:(UIView *)headerView footerView:(UIView *)footerView headerHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight{
    MXSection *section = [self sectionWithDataArray:dataArray footerView:footerView footerHeight:footerHeight];
    section.headerView = headerView;
    section.headerHeight = headerHeight;
    return section;
}

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerTitle:(NSString *)headerTitle{
    MXSection *section = [self sectionWithDataArray:dataArray];
    section.headerTitle = headerTitle;
    return section;
}

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray footerTitle:(NSString *)footerTitle{
    MXSection *section = [self sectionWithDataArray:dataArray];
    section.footerTitle = footerTitle;
    return section;
}

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle{
    MXSection *section = [self sectionWithDataArray:dataArray headerTitle:headerTitle];
    section.footerTitle = footerTitle;
    return section;
}

@end
