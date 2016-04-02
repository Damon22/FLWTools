//
//  UITableView+HeaderFooterView.m
//  TableViewDemo
//
//  Created by pkxing on 15/2/1.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import "MXExtension.h"

@implementation UITableView (MXHeaderFooterView)
/**
 *  注册组头部headerView的类型
 */
-(void)registerHeaderViewClass:(Class)mClass datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock{
    [self registerHeaderViewClass:mClass height:44 datas:datas dataBlock:dataBlock];
}

-(void)registerHeaderViewClass:(Class)mClass height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock{
    MXAssert([mClass isSubclassOfClass:[UITableViewHeaderFooterView class]],@"mClass is not a UITableViewHeaderFooterView - mClass类型参必须是一个UITableViewHeaderFooterView");
    MXDelegate *delegate = (MXDelegate *) self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]]) {
        delegate.headerViewIdentifier = [mClass description];
        delegate.headerViewHeight = height;
        delegate.headerViewDatas = datas;
        delegate.headerViewDataBlock = dataBlock;
    }
    [self registerClass:mClass forHeaderFooterViewReuseIdentifier:[mClass description]];
}

/**
 *  注册组头部headerViewView的xib名称
 */
-(void)registerHeaderViewXibName:(NSString *)xibName datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock{
    [self registerHeaderViewXibName:xibName height:44 datas:datas dataBlock:dataBlock];
}

-(void)registerHeaderViewXibName:(NSString *)xibName height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetHeaderViewDataBlock)dataBlock{
    MXAssert((xibName != nil && xibName.length > 0), @"xib文件不能为空");
    MXDelegate *delegate = (MXDelegate *) self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]]) {
        delegate.headerViewIdentifier = xibName;
        delegate.headerViewHeight = height;
        delegate.headerViewDatas = datas;
        delegate.headerViewDataBlock = dataBlock;
    }
    UINib *nib = [UINib nibWithNibName:xibName bundle:nil];
    [self registerNib:nib forHeaderFooterViewReuseIdentifier:xibName];
}

/**
 *  注册组尾部footerView的类型
 */
-(void)registerFooterViewClass:(Class)mClass datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock{
    [self registerFooterViewClass:mClass height:44 datas:datas dataBlock:dataBlock];
}

-(void)registerFooterViewClass:(Class)mClass height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock{
    MXAssert([mClass isSubclassOfClass:[UITableViewHeaderFooterView class]],@"mClass is not a UITableViewHeaderFooterView - mClass类型参必须是一个UITableViewHeaderFooterView");
    MXDelegate *delegate = (MXDelegate *) self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]]) {
        delegate.footerViewIdentifier = [mClass description];
        delegate.footerViewHeight = height;
        delegate.footerViewDatas = datas;
        delegate.footerViewDataBlock = dataBlock;
    }
    [self registerClass:mClass forHeaderFooterViewReuseIdentifier:[mClass description]];
}

/**
 *  注册组尾部footerView的xib名称
 */
-(void)registerFooterViewXibName:(NSString *)xibName datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock{
    [self registerFooterViewXibName:xibName height:44 datas:datas dataBlock:dataBlock];
}

-(void)registerFooterViewXibName:(NSString *)xibName height:(CGFloat)height datas:(NSArray *)datas dataBlock:(SetFooterViewDataBlock)dataBlock{
    MXAssert((xibName != nil && xibName.length > 0), @"xib文件不能为空");
    MXDelegate *delegate = (MXDelegate *) self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]]) {
        delegate.footerViewIdentifier = xibName;
        delegate.footerViewHeight = height;
        delegate.footerViewDatas = datas;
        delegate.footerViewDataBlock = dataBlock;
    }
    UINib *nib = [UINib nibWithNibName:xibName bundle:nil];
    [self registerNib:nib forHeaderFooterViewReuseIdentifier:xibName];
}


//-------------------tableHeaderView和tableFooterView-------------------------
/**
 *  根据 nibName 设置 tableHeaderView
 *  @param nibName xib 名字
 */
- (void)setTableHeaderViewByNibName:(NSString *)nibName{
    [self setTableHeaderViewByNibName:nibName completion:nil];
}

- (void)setTableHeaderViewByNibName:(NSString *)nibName completion:(MXTableHeaderViewBlock)completion{
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] lastObject];
    if (completion)completion(headerView);
    self.tableHeaderView = headerView;
}

/**
 *  根据 nibName 设置 tableFooterView
 *  @param nibName xib 名字
 */
- (void)setTableFooterViewByNibName:(NSString *)nibName{
    [self setTableFooterViewByNibName:nibName completion:nil];
}

- (void)setTableFooterViewByNibName:(NSString *)nibName completion:(MXTableFooterViewBlock)completion{
    UIView *footerView = [[[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil] lastObject];
    if (completion)completion(footerView);
    self.tableFooterView = footerView;
}

@end
