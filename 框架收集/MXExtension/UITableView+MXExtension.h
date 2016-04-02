//
//  UITableView+Extension.h
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import "MXSection.h"
#import "MXDataSource.h"
#import "MXDelegate.h"
@interface UITableView (MXExtension)

/**
 *  监听cell按钮回调
 */
- (void)setCellButtonClickBlock:(CellButtonClickBlock)actionBlock;
/**
 *  设置渲染每一行 cell 回调的block
 */
- (void)setCellForRowBlock:(CellForRowBlock)cellForRowBlock;

/**
 *  设置选中每一行 cell 回调的block
 */
- (void)setSelectRowBlock:(SelectRowBlock)selectRowBlock;

/**
 *  设置cell数据的block回调
 */
- (void)setCellDataBlock:(SetCellDataBlock)cellDataBlock;

/**
 *  设置返回行高的 block
 */
- (void)setCellHeightBlock:(CellHeightBlock)cellHeightBlock;

/**
 *  删除行回调（只要设置了deleteRowBlock,tableView 就基本滑动删除功能）
 */
- (void)setDeleteRowBlock:(DeleteRowBlock)deleteRowBlock;

/**
 *  删除行回调
 *  title:删除按钮要显示的文字
 */
- (void)setDeleteRowBlock:(DeleteRowBlock)deleteRowBlock deleteBtnTitle:(NSString *)title;
/**
 *  添加1组数据
 */
- (void)setupSection:(MXSection *)section;
/**
 *  添加多组数据(每一个元素是一个MXSection模型。一个模型代表tableView的一组数据)
 */
- (void)setupSections:(NSArray *)sections;

/**
 *  获得index位置的组模型
 */
-(MXSection *)sectionAtIndex:(NSInteger)index;
- (MXSection *)firstSection;
- (MXSection *)lastSection;
/**
 *  清空所有组数据
 */
- (void)removeAllSection;

/**
 *  插入一条数据到最后一组的最后一行(默认插入最后一组的最后面)
 */
- (void)insertData:(id)data;
/**
 *  添加一条数据到指定的组(section不能为空)
 */
- (void)insertData:(id)data toSection:(MXSection *)section;
/**
 *  添加一个数据到section组的index位置
 *
 *  @param data    要插入的数据
 *  @param index   索引
 *  @param section 组
 */
- (void)insertData:(id)data atIndex:(NSInteger)index toSection:(MXSection *)section;

/**
 *  在指定的 section 组后面插入一组数据
 *
 *  @param data    要插入的数据
 *  @param section 对应的组
 */
- (void)insertDatas:(NSArray *)data toSection:(MXSection *)section;
/**
 *  插入一组数据 data 到最后一组
 */
- (void)insertDatas:(NSArray *)data;

/**
 *  注册cell,只要设置了xib,表明cell是从xib创建的
 *
 *  @param xibName  xib 文件名字
 */
- (void)registerXibName:(NSString *)xibName forCellReuseIdentifier:(NSString *)identifier;
- (void)registerXibName:(NSString *)xibName forCellReuseIdentifier:(NSString *)identifier cellButtonClickBlock:(CellButtonClickBlock)actionBlock;
/**
 *  注册cell
 */
-(void)registerCellClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;

/**
 *  cell 的样式
 */
- (void)cellStyle:(MXCellStyle)style;
/**
 *  初始化方法
 */
+(instancetype)tableViewWithCellClass:(Class)cellClass cellDataBlock:(SetCellDataBlock)cellDataBlock selectRowBlock:(SelectRowBlock)selectRowBlock;
+(instancetype)tableViewWithCellClass:(Class)cellClass cellDataBlock:(SetCellDataBlock)cellDataBlock selectRowBlock:(SelectRowBlock)selectRowBlock cellHeightBlock:(CellHeightBlock)cellHeightBlock;

+(instancetype)tableViewWithXib:(NSString *)xibName cellDataBlock:(SetCellDataBlock)cellDataBlock selectRowBlock:(SelectRowBlock)selectRowBlock;
+(instancetype)tableViewWithXib:(NSString *)xibName cellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock cellHeightBlock:(CellHeightBlock)cellHeightBlock;

+(instancetype)tableViewWithCellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock;

- (void)setCellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock cellHeightBlock:(CellHeightBlock)cellHeightBlock;
- (void)setCellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock;

/**
 *  设置 tableView 顶部工具条(该工具条不会跟随tableView的滚动而滚动)
 *
 *  @param xibName    nib 文件名
 *  @param completion 创建完工具条后的回调
 */
- (void)setTopBarViewWithXib:(NSString *)xibName completion:(MXTableTopBarViewBlock)completion;
@end
