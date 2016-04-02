//
//  MXHeadForBlock.h
//  物留客
//
//  Created by pkxing on 15/2/2.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#ifndef ____MXHeadForBlock_h
#define ____MXHeadForBlock_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#define MXTopBarView @"MXTopBarView"
#define MXTopBarViewBlock @"MXTopBarViewBlock"

#define MXActionBlock @"MXActionBlock"
/**
 *  监听cell中的按钮点击
 *  cell: 按钮所在的 cell
 *  button: 点击的按钮
 *  index: 当cell有多个按钮时候,可以用来区分点击的是第几个按钮。
 */
typedef void (^CellButtonClickBlock) (id cell,UIButton *button,NSInteger index);
/**
 *  创建cell的回调(一旦提供了这个block,那么注册的 cell 就会失效)
 */
typedef UITableViewCell* (^CellForRowBlock) (UITableView *tableView, NSIndexPath *indexPath,id data);
/**
 *  选中cell的回调
 */
typedef void (^SelectRowBlock) (UITableView *tableView, NSIndexPath *indexPath,id data);
/**
 *  删除cell的回调
 */
typedef void (^DeleteRowBlock) (UITableView *tableView, NSIndexPath *indexPath,id data);

/**
 *  设置每一行cell的数据
 */
typedef void (^SetCellDataBlock)(id cell,id data);
/**
 *  计算 cell 对应的高度
 */
typedef CGFloat (^CellHeightBlock)(id cell,id data);


typedef void (^MXTableHeaderViewBlock)(id tableHeaderView);
typedef void (^MXTableFooterViewBlock)(id tableFooterView);
typedef void (^MXTableTopBarViewBlock)(id topBarView);
#endif
