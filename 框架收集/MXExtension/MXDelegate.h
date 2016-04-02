//
//  MXDelegate.h
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import "MXDataSource.h"
#import "MXHeadForBlock.h"
@interface MXDelegate : MXDataSource<UITableViewDelegate>

/** 设置每一行headerView数据的回调 */
typedef void (^SetHeaderViewDataBlock)(id headerView,id data);
/** 设置每一行footerView数据的回调 */
typedef void (^SetFooterViewDataBlock)(id footerView,id data);

/** 删除按钮标题 */
@property(nonatomic,copy) NSString *deleteBtnTitle;

/** headerView 要显示的数据 */
@property(nonatomic,strong) NSArray *headerViewDatas;
/** headerFooterView重用标识 */
@property(nonatomic,copy) NSString *headerViewIdentifier;
/** 每一组头部控件的高度 */
@property(nonatomic,assign) CGFloat  headerViewHeight;
/** 设置headerView数据回调 */
@property(nonatomic,copy) SetHeaderViewDataBlock headerViewDataBlock;

/** footerView 要显示的数据 */
@property(nonatomic,strong) NSArray *footerViewDatas;
/** footerView重用标识 */
@property(nonatomic,copy) NSString *footerViewIdentifier;
/** 每一组尾部控件的高度 */
@property(nonatomic,assign) CGFloat  footerViewHeight;
/** 设置footerView数据回调 */
@property(nonatomic,copy) SetFooterViewDataBlock footerViewDataBlock;


@end
