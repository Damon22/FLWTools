//
//  UITableView+HeaderFooterView.h
//  TableViewDemo
//
//  Created by pkxing on 15/2/1.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (MXHeaderFooterView)
/**
 *  注册组头部headerView的类型
 */
-(void)registerHeaderViewClass:(Class)mClass datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock;
-(void)registerHeaderViewClass:(Class)mClass height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock;

/**
 *  注册组头部headerViewView的xib名称
 */
-(void)registerHeaderViewXibName:(NSString *)xibName datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock;
-(void)registerHeaderViewXibName:(NSString *)xibName height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock;

/**
 *  注册组尾部footerView的类型
 */
-(void)registerFooterViewClass:(Class)mClass datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock;
-(void)registerFooterViewClass:(Class)mClass height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock;

/**
 *  注册组尾部footerView的xib名称
 */
-(void)registerFooterViewXibName:(NSString *)xibName datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock;
-(void)registerFooterViewXibName:(NSString *)xibName height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock;
//-------------------tableHeaderView和tableFooterView-------------------------
/**
 *  根据 nibName 设置 tableHeaderView
 *  @param nibName xib 名字
 *  @param completion 设置完毕回调
 */
- (void)setTableHeaderViewByNibName:(NSString *)nibName;
- (void)setTableHeaderViewByNibName:(NSString *)nibName completion:(MXTableHeaderViewBlock)completion;
/**
 *  根据 nibName 设置 tableFooterView
 *  @param nibName xib 名字
 *  @param completion 设置完毕回调
 */
- (void)setTableFooterViewByNibName:(NSString *)nibName;
- (void)setTableFooterViewByNibName:(NSString *)nibName completion:(MXTableFooterViewBlock)completion;

@end
