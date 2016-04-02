//
//  ImagePlayView.h
//  图片轮播器
//
//  Created by WZZ on 15/12/11.
//  Copyright © 2015年 晓志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlwImagePlayView : UIView

/**
 *  图片数组
 */
@property(nonatomic,strong,readonly)NSArray *imageArr;
/**
 *  当前页面page的颜色
 */
@property(nonatomic,strong)UIColor *currentpageColor;
/**
 *  非当前页面page的颜色
 */
@property(nonatomic,strong)UIColor *pageIndicatorTintColor;

/**
 *  里面装的是每一个滚动画面的UIImageView
 */
@property(nonatomic,strong,readonly)NSArray<UIImageView *> *imageViewArr;
/**
 *  图片轮播器对象
 *
 *  @param frame    图片轮播器的frame
 *  @param imageArr 图片名称的数组
 *  @param secoder  每次轮播的时间，默认时间是1.5秒，如果填入的时间小于0.5秒会使用默认时间
 *
 *  @return 返回一个图片轮播器对象
 */
- (instancetype)initWithFrame:(CGRect)frame WithImageArr:(NSArray *)imageArr WithImagePlayerSpace:(NSInteger) secoder;

/**
 *  创建一个图片轮播器的View
 *
 *  @param frame    图片轮播器的frame
 *  @param imageArr 图片名称的数组
 *  @param secoder  每次轮播的时间，默认时间是1.5秒，如果填入的时间小于0.5秒会使用默认时间
 *
 *  @return 返回一个图片轮播器
 */
+ (instancetype)imagePlayViewWithFrame:(CGRect)frame WithImageArr:(NSArray *)imageArr WithImagePlayerSpace:(NSInteger) secoder;

@end

/*
 @property (nonatomic,strong)NSArray *imageArr;
 */


/*
 //设置轮播器的位置
 CGRect frame = CGRectMake(10 , 10, 355, 140);
 

FlwImagePlayView *imagePlayView = [FlwImagePlayView imagePlayViewWithFrame:frame WithImageArr:self.imageArr WithImagePlayerSpace:2];

[self addSubview:imagePlayView];


 */


/*
 
 #pragma mark - 图片轮播播数据
 - (NSArray *)imageArr {
 
 if (_imageArr == nil) {
 
 NSMutableArray *mtbArr = [NSMutableArray array];
 for (NSInteger i = 0; i < 5; i++) {
 
 NSString *imageStr = [NSString stringWithFormat:@"ad_%02ld",i];
 [mtbArr addObject:imageStr];
 }
 
 _imageArr = [NSArray arrayWithArray:mtbArr];
 }
 return _imageArr;
 }
 
 
 */
