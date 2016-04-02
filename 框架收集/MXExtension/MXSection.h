//
//  HMSection.h
//  TableViewDemo
//
//  Created by pkxing on 15/1/30.
//  Copyright (c) 2015年 梦醒. All rights reserved.
// 一个 section 模型代表 tableView 的一组

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MXHeadForBlock.h"
@interface MXSection : NSObject

@property(nonatomic,assign) CGPoint  contentOffset;

@property(nonatomic,copy) NSString *xibForHeaderView;
@property(nonatomic,copy) NSString *xibForFooterView;

@property(nonatomic,copy) NSString *headerTitle;
@property(nonatomic,copy) NSString *footerTitle;

@property(nonatomic,strong) UIView *headerView;
@property(nonatomic,strong) UIView *footerView;

@property(nonatomic,assign) CGFloat  headerHeight;
@property(nonatomic,assign) CGFloat  footerHeight;

@property(nonatomic,strong) NSMutableArray *dataArray;

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray;
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray xibForHeaderView:(NSString *)xibName completion:(MXTableHeaderViewBlock)complete;
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerView:(UIView *)headerView;
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerView:(UIView *)headerView headerHeight:(CGFloat)headerHeight;

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray xibForFooterView:(NSString *)xibName completion:(MXTableFooterViewBlock)complete;

+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray footerView:(UIView *)footerView footerHeight:(CGFloat)footerHeight;
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerView:(UIView *)headerView footerView:(UIView *)footerView headerHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight;
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerTitle:(NSString *)headerTitle;
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray footerTitle:(NSString *)footerTitle;
+(instancetype)sectionWithDataArray:(NSMutableArray *)dataArray headerTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle ;

@end
