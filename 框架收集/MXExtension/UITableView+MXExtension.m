//
//  UITableView+Extension.m
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import "UITableView+MXExtension.h"
#import "UIView+MXExtension.h"
#import <objc/runtime.h>
#define HMDataSource @"HMDataSource"
#define HMDataDelegate @"HMDataDelegate"

@interface UITableView()

@end

@implementation UITableView (MXExtension)
+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod([UITableView class], @selector(setDataSource:)), class_getInstanceMethod([UITableView class], @selector(setMXDataSource:)));
    method_exchangeImplementations(class_getInstanceMethod([UITableView class], @selector(setDelegate:)), class_getInstanceMethod([UITableView class], @selector(setMXDelegate:)));
    method_exchangeImplementations(class_getInstanceMethod([UITableView class], @selector(initWithFrame:)), class_getInstanceMethod([UITableView class], @selector(initWithMXFrame:)));
    method_exchangeImplementations(class_getInstanceMethod([UITableView class], @selector(initWithCoder:)), class_getInstanceMethod([UITableView class], @selector(initWithMXCoder:)));
    method_exchangeImplementations(class_getInstanceMethod([UITableView class], @selector(initWithFrame:style:)), class_getInstanceMethod([UITableView class], @selector(initWithMXFrame:style:)));
    
//    method_exchangeImplementations(class_getInstanceMethod([UITableView class], @selector(reloadData)), class_getInstanceMethod([UITableView class], @selector(reloadMXData)));
//    
    method_exchangeImplementations(class_getInstanceMethod([UITableView class], @selector(setContentOffset:)), class_getInstanceMethod([UITableView class], @selector(setContentMXOffset:)));
    
}

- (void)setContentMXOffset:(CGPoint)offset{
    [self setContentMXOffset:offset];
    if (![self firstSection]) return;
    self.firstSection.contentOffset = offset;
}

#pragma mark - 初始化方法
- (instancetype)initWithMXFrame:(CGRect)frame{
    if (self = [self initWithMXFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithMXCoder:(NSCoder *)aDecoder{
    if (self = [self initWithMXCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithMXFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [self initWithMXFrame:frame style:style]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    MXDataSource *dataSource = [[MXDataSource alloc] init];
    dataSource.style = MXCellStyleDefault;
    self.dataSource = dataSource;
    
    MXDelegate *delegate = [[MXDelegate alloc] init];
    self.delegate = delegate;
    
}
#pragma mark - 注册cell
/**
 *  设置xib的名字,只要设置了xib,表明cell是从xib创建的
 *
 *  @param xibName  xib 文件名字
 */
- (void)registerXibName:(NSString *)xibName forCellReuseIdentifier:(NSString *)identifier{
    MXDataSource *dataSource = (MXDataSource *) self.dataSource;
    if ([dataSource isKindOfClass:[MXDataSource class]]) {
        dataSource.identifier = identifier;
    }
    MXDelegate *delegate = (MXDelegate *) self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]]) {
        delegate.identifier = identifier;
    }
    UINib *nib = [UINib nibWithNibName:xibName bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

- (void)registerXibName:(NSString *)xibName forCellReuseIdentifier:(NSString *)identifier cellButtonClickBlock:(CellButtonClickBlock)actionBlock{
    [self registerXibName:xibName forCellReuseIdentifier:identifier];
    [self setCellButtonClickBlock:actionBlock];
}
/**
 *  注册cell
 */
-(void)registerCellClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier{
    MXDataSource *dataSource = (MXDataSource *) self.dataSource;
    if ([dataSource isKindOfClass:[MXDataSource class]]) {
        dataSource.identifier = identifier;
    }
    MXDelegate *delegate = (MXDelegate *) self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]]) {
        delegate.identifier = identifier;
    }
    [self registerClass:cellClass forCellReuseIdentifier:identifier];
}


/**
 *  cell 的样式
 */
- (void)cellStyle:(MXCellStyle)style{
    if ([self.dataSource respondsToSelector:@selector(style)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        dataSource.style = style;
    }
}
#pragma mark - 添加组数据
/**
 *  添加1组数据
 */
- (void)setupSection:(MXSection *)section{
    if (section == nil) return;
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        [dataSource.sections addObject:section];
    }
    if ([self.delegate respondsToSelector:@selector(sections)]) {
        MXDelegate *delegate = (MXDelegate *) self.delegate;
        [delegate.sections addObject:section];
    }
    CGPoint offset  = self.firstSection.contentOffset;
    [self reloadData];
    if (!CGPointEqualToPoint(offset, CGPointZero)) {
        self.contentOffset = offset;
    }
}
/**
 *  添加多组数据
 */
- (void)setupSections:(NSArray *)sections{
    if (sections == nil) return;
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        [dataSource.sections addObjectsFromArray:sections];
    }
    if ([self.delegate respondsToSelector:@selector(sections)]) {
        MXDelegate *delegate = (MXDelegate *) self.delegate;
        [delegate.sections addObjectsFromArray:sections];
    }
    CGPoint offset  = self.firstSection.contentOffset;
    [self reloadData];
    if (!CGPointEqualToPoint(offset, CGPointZero)) {
        self.contentOffset = offset;
    }
}
/**
 *  清空所有组数据
 */
- (void)removeAllSection{
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        [dataSource.sections removeAllObjects];
    }
    if ([self.delegate respondsToSelector:@selector(sections)]) {
        MXDelegate *delegate = (MXDelegate *) self.delegate;
        [delegate.sections removeAllObjects];
    }
    [self reloadData];
}
#pragma mark - 获取section模型
/**
 *  获得index位置的组模型
 */
-(MXSection *)sectionAtIndex:(NSInteger)index{
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        NSInteger count = dataSource.sections.count;
        return (count > 0 && index < count) ? dataSource.sections[index]:nil;
    }
    return nil;
}
/**
 *  获得第一组组模型
 */
- (MXSection *)firstSection{
    if (self.viewController && [self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        return [dataSource.sections firstObject];
    }
    return nil;
}
/**
 *  获得最后一组组模型
 */
- (MXSection *)lastSection{
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        return [dataSource.sections lastObject];
    }
    return nil;
}

#pragma mark - 设置相关block回调
/**
 *  设置渲染每一行 cell 回调的block
 */
- (void)setCellForRowBlock:(CellForRowBlock)cellForRowBlock{
    MXDataSource *dataSource = (MXDataSource *) self.dataSource;
    if ([dataSource isKindOfClass:[MXDataSource class]]) {
        dataSource.cellForRowBlock = cellForRowBlock;
    }
}
/**
 *  设置选中每一行 cell 回调的block
 */
- (void)setSelectRowBlock:(SelectRowBlock)selectRowBlock{
    MXDataSource *delegate = (MXDataSource *)self.delegate;
    if ([delegate isKindOfClass:[MXDataSource class]]) {
        delegate.selectRowBlock = selectRowBlock;
    }
}

/**
 *  设置cell数据的block回调
 */
- (void)setCellDataBlock:(SetCellDataBlock)cellDataBlock;{
    MXDataSource *dataSource = (MXDataSource *)self.dataSource;
    if ([dataSource isKindOfClass:[MXDataSource class]]) {
        dataSource.setCellDataBlock = cellDataBlock;
    }
}
/**
 *  设置返回行高的 block
 */
- (void)setCellHeightBlock:(CellHeightBlock)cellHeightBlock{
    MXDelegate *delegate = (MXDelegate *)self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]]) {
        delegate.cellHeightBlock = cellHeightBlock;
    }
}
/**
 *  监听cell按钮回调
 */
- (void)setCellButtonClickBlock:(CellButtonClickBlock)actionBlock{
    objc_setAssociatedObject(self,MXActionBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
/**
 *  删除行回调
 */
- (void)setDeleteRowBlock:(DeleteRowBlock)deleteRowBlock{
    MXDataSource *dataSource = (MXDataSource *)self.dataSource;
    if ([dataSource isKindOfClass:[MXDataSource class]]) {
        dataSource.deleteRowBlock = deleteRowBlock;
    }
}

- (void)setDeleteRowBlock:(DeleteRowBlock)deleteRowBlock deleteBtnTitle:(NSString *)title {
    [self setDeleteRowBlock:deleteRowBlock];
    MXDelegate *delegate = (MXDelegate *)self.delegate;
    if ([delegate isKindOfClass:[MXDelegate class]] && title.length > 0 ) {
        delegate.deleteBtnTitle = title;
    }
}
#pragma mark - 设置数据源和代理
/**
 *  设置 tableView 数据源
 */
- (void)setMXDataSource:(id<UITableViewDataSource>)dataSource{
    if (dataSource != nil && [dataSource isKindOfClass:[MXDataSource class]]) {
        objc_setAssociatedObject(self, HMDataSource, dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        objc_setAssociatedObject(self, HMDataSource, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setMXDataSource:dataSource];
}
/**
 *  设置 tableView 代理
 */
- (void)setMXDelegate:(id<UITableViewDelegate>)delegate {
    if (delegate != nil && [delegate isKindOfClass:[MXDelegate class]]) {
        objc_setAssociatedObject(self, HMDataDelegate, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        objc_setAssociatedObject(self, HMDataDelegate, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setMXDelegate:delegate];
}

#pragma mark - 初始化方法
+(instancetype)tableViewWithCellClass:(Class)cellClass cellDataBlock:(SetCellDataBlock)cellDataBlock selectRowBlock:(SelectRowBlock)selectRowBlock{
    UITableView *tableView = [[self alloc] init];
    tableView.cellDataBlock = cellDataBlock;
    tableView.selectRowBlock = selectRowBlock;
    return tableView;
}
+(instancetype)tableViewWithCellClass:(Class)cellClass cellDataBlock:(SetCellDataBlock)cellDataBlock selectRowBlock:(SelectRowBlock)selectRowBlock cellHeightBlock:(CellHeightBlock)cellHeightBlock{
    UITableView *tableView = [self tableViewWithCellClass:cellClass cellDataBlock:cellDataBlock selectRowBlock:selectRowBlock];
    tableView.cellHeightBlock = cellHeightBlock;
    return tableView;
}

+(instancetype)tableViewWithXib:(NSString *)xibName cellDataBlock:(SetCellDataBlock)cellDataBlock selectRowBlock:(SelectRowBlock)selectRowBlock{
    UITableView *tableView = [[self alloc] init];
    tableView.cellDataBlock = cellDataBlock;
    tableView.selectRowBlock = selectRowBlock;
    return tableView;

}
+(instancetype)tableViewWithXib:(NSString *)xibName cellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock cellHeightBlock:(CellHeightBlock)cellHeightBlock{
    UITableView *tableView = [self tableViewWithXib:xibName cellDataBlock:cellDataBlock selectRowBlock:selectRowBlock];
    tableView.cellHeightBlock = cellHeightBlock;
    return tableView;
}

+(instancetype)tableViewWithCellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock{
     UITableView *tableView = [self tableViewWithXib:nil cellDataBlock:cellDataBlock selectRowBlock:selectRowBlock];
    return tableView;
}

#pragma mark - 对象方法
- (void)setCellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock cellHeightBlock:(CellHeightBlock)cellHeightBlock{
    [self setCellHeightBlock:cellHeightBlock];
    [self setCellDataBlock:cellDataBlock];
    [self setSelectRowBlock:selectRowBlock];
}
- (void)setCellDataBlock:(SetCellDataBlock)cellDataBlock  selectRowBlock:(SelectRowBlock)selectRowBlock{
    [self setCellDataBlock:cellDataBlock selectRowBlock:selectRowBlock cellHeightBlock:nil];
}

#pragma mark - 插入数据
/**
 *  插入一条数据到最后一组的最后一行
 */
- (void)insertData:(id)data{
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        MXSection *section = [dataSource.sections lastObject];
        [self insertData:data toSection:section];
    }
}
/**
 *  添加一条数据到指定的组(默认插入到最后)
 */
- (void)insertData:(id)data toSection:(MXSection *)section{
    if (section == nil) return;
    [self insertData:data atIndex:-1 toSection:section];
}
/**
 *  添加一个数据到section组的index位置
 *
 *  @param data    要插入的数据
 *  @param index   索引
 *  @param section 组
 */
- (void)insertData:(id)data atIndex:(NSInteger)index toSection:(MXSection *)section{
    if (section == nil) return;
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        NSInteger sectionIndex  = [dataSource.sections indexOfObject:section];
        if (index < 0 ) { // 索引小于0,则插到最后面
            [data isKindOfClass:[NSArray class]] ? [section.dataArray addObjectsFromArray:data]:[section.dataArray addObject:data];
            index = section.dataArray.count - 1;
        } else {
            [section.dataArray insertObject:data atIndex:index];
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:sectionIndex];
        [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

/**
 *  在指定的 section 组后面插入一组数据
 *
 *  @param data    要插入的数据
 *  @param section 对应的组
 */
- (void)insertDatas:(NSArray *)data toSection:(MXSection *)section{
    if (section == nil || data == nil) return;
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        [section.dataArray addObjectsFromArray:data];
        [self reloadData];
    }
}
/**
 *  插入一组数据 data 到最后一组
 */
- (void)insertDatas:(NSArray *)data{
    if (data == nil) return;
    if ([self.dataSource respondsToSelector:@selector(sections)]) {
        MXDataSource *dataSource = (MXDataSource *) self.dataSource;
        MXSection *section = [dataSource.sections lastObject];
        [section.dataArray addObjectsFromArray:data];
        [self reloadData];
    }
}

/**
 *  设置 tableView 顶部工具条(该工具条不会跟随tableView的滚动而滚动)
 *
 *  @param xibName    nib 文件名
 *  @param completion 创建完工具条后的回调
 */
- (void)setTopBarViewWithXib:(NSString *)xibName completion:(MXTableTopBarViewBlock)completion{
    UIView *topBarView = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
    if (topBarView == nil) return;
    objc_setAssociatedObject(self, MXTopBarView, topBarView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 获得tableView所在的控制器
        UIViewController *controller = [self viewController];
        CGRect frame = topBarView.frame;
        frame.origin.y = self.frame.origin.y;
        frame.size.width = self.frame.size.width;
        topBarView.frame = frame;
        
        CGFloat topBarViewHeight = frame.size.height;
        frame = self.frame;
        frame.origin.y += topBarViewHeight;
        frame.size.height -= topBarViewHeight;
        self.frame = frame;
        [controller.view addSubview:topBarView];
        if ([controller isKindOfClass:[UITableViewController class]]) {
//            self.contentOffset = CGPointMake(0, -topBarViewHeight);
//            self.contentInset = UIEdgeInsetsMake(topBarViewHeight, 0, 0, 0);
        }
        if (completion)completion(topBarView);
    });
    
}

@end
