//
//  HMLoopView.m
//  01-网易新闻
//
//  Created by shenzhenIOS on 16/3/13.
//  Copyright © 2016年 shenzhenIOS. All rights reserved.
//

#import "HMLoopView.h"
#import "HMLoopViewCell.h"
#import "HMLoopViewFlowLayout.h"
#import "HMWeakTimerTarget.h"
@interface HMLoopView() <UICollectionViewDataSource,UICollectionViewDelegate>
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// 分页指示器
@property (nonatomic, strong) UIPageControl *pageControl;
// 录播器
@property (nonatomic, strong) UICollectionView *collectionView;
// 图片数组
@property (nonatomic, strong) NSArray *URLStrs;
// 标题数组
@property (nonatomic, strong) NSArray *titles;
// 定时器
@property (nonatomic, strong) NSTimer *timer;
// 选中回调block
@property (nonatomic, copy) void (^didSelected)(NSInteger index);
@end

@implementation HMLoopView
#pragma mark - 初始化方法
/**
 *  创建图片轮播器
 *
 *  @param URLStrs 图片URL数组
 *  @param titles  标题数组
 */
- (instancetype)initWithURLStrs:(NSArray <NSString *> *)URLStrs titles:(NSArray <NSString *> *)titles didSelected:(void (^)(NSInteger index))didSelected{
    if (self = [super init]) {
        // 记录属性
        self.URLStrs = URLStrs;
        self.titles = titles;
        self.didSelected = didSelected;
        
        // 设置页数
        self.pageControl.numberOfPages = URLStrs.count;
        self.titleLabel.text = self.titles[0];
        // 滚动到 URLStrs.count 位置 3
        // 主队列异步执行：在主线程空闲时才能执行block代码
        // 在执行block代码时，已经调用了collectionView数据源方法
        dispatch_async(dispatch_get_main_queue(), ^{
//             NSLog(@"%s", "dispatch_get_main_queue"); 、
            if (self.URLStrs.count > 1) {
                // scrollToItemAtIndexPath
//                UITableView *tableView;
                [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:URLStrs.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
                
                // 添加定时器
//                [self addTimer];
            }
        });
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self= [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[HMLoopViewFlowLayout alloc] init]];
    // 注册cell
    [collectionView registerClass:[HMLoopViewCell class] forCellWithReuseIdentifier:@"loopCell"];
    // 设置代理和数据源
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
    // 创建标题
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = [UIColor grayColor];
    [self addSubview:self.titleLabel];

    // 分页指示器
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    // 如果只有一页 则隐藏分页指示器
    self.pageControl.hidesForSinglePage = YES;

//    [self addSubview:self.pageControl];
    
    // 设置默认时间 默认值2
    self.timerInterval = 2;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置标题的高度
    CGFloat titleH = 30;
    // 设置collectionView的frame
    CGRect frame = self.bounds;
    if (self.titlePosition == HMTitlePositionBlowImage) {
        frame.size.height -= titleH;
    }
    self.collectionView.frame = frame;
    
    CGFloat marginX = 10;
    
    // 设置pageControl frame
    CGFloat pageY = self.bounds.size.height - titleH;
    CGFloat pageW = self.URLStrs.count * 15;
    CGFloat pageX = self.bounds.size.width - pageW - marginX;
    CGFloat pageH = titleH;
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    // 设置标题的frame
    CGFloat titleW = self.bounds.size.width - 3 * marginX - pageW;
    self.titleLabel.frame = CGRectMake(marginX, pageY, titleW, titleH);
}

#pragma mark - 定时器相关方法
/**
 *  创建定时器
 */
-(void)addTimer {
   self.timer =  [HMWeakTimerTarget scheduledTimerWithTimeInterval:self.timerInterval target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/**
 *  移除定时器
 */
- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

/**
 *  定时器回调方法
 */
- (void)nextImage {
    // 获得当前显示的页号
    NSInteger page = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
    // 计算偏移量
    CGFloat offsetX = (page + 1) * self.collectionView.bounds.size.width;
    // 设置偏移量
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
#pragma mark - UICollectionView 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    NSLog(@"%s", __FUNCTION__);
    return self.URLStrs.count * ((self.URLStrs.count == 1) ? 1:100);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//     NSLog(@"%s", __FUNCTION__);
    // 获得cell
    HMLoopViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"loopCell" forIndexPath:indexPath];
    // 传递URL字符串
    cell.URLString = self.URLStrs[indexPath.item % self.URLStrs.count];
    return cell;
}

/**
 *  监听item点击
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"indexPath = %zd",indexPath.item % self.URLStrs.count);
    if (self.didSelected) {
        self.didSelected(indexPath.item % self.URLStrs.count);
    }
}


#pragma mark - UIScrollView 代理方法
/**
 *  当用户开始拖拽时调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

/**
 *  当用户结束拖拽时调用
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    [self addTimer];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}

/**
 *  手动拖拽时才会触发
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 计算当前滚动的页号
    NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
   
    if (page == 0 || page == ([self.collectionView numberOfItemsInSection:0] - 1)) {
        
        //第一种算法
//        page = self.URLStrs.count - ((page == 0) ? 0: 1); // 3
        //第二种算法
        page = (page % self.URLStrs.count) + self.URLStrs.count;
        // 滚动到第URLStrs.count张
        self.collectionView.contentOffset = CGPointMake(page * scrollView.bounds.size.width, 0);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 计算当前滚动的页号
    NSInteger page = (scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width;
    NSLog(@"page = %zd",page);
    self.pageControl.currentPage = page % self.URLStrs.count;
    // 设置标题
    self.titleLabel.text = self.titles[page % self.titles.count];
    
}

@end
