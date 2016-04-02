//
//  MXDataSource.h
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MXSection.h"
#import "UITableViewCell+MXExtension.h"
#import "MXHeadForBlock.h"
typedef enum {
    MXCellStyleDefault,
    MXCellStyleValue1,
    MXCellStyleValue2,
    MXCellStyleSubtitle,
}MXCellStyle;

@interface MXDataSource : NSObject<UITableViewDataSource>
/**
 *  数据源(每一个元素是一个MXSection模型。一个模型代表tableView的一组数据)
 */
@property(nonatomic,strong,readonly) NSMutableArray *sections;
/**
 *  回调block
 */
@property(nonatomic,copy) CellForRowBlock cellForRowBlock;
@property(nonatomic,copy) SelectRowBlock selectRowBlock;
@property(nonatomic,copy) SetCellDataBlock setCellDataBlock;
@property(nonatomic,copy) CellHeightBlock cellHeightBlock;
@property(nonatomic,copy) DeleteRowBlock deleteRowBlock;

/**
 *  cell重用标识
 */
@property(nonatomic,copy) NSString *identifier;
/**
 *  cell 的样式
 */
@property(nonatomic,assign) MXCellStyle  style;

@end
