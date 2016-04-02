//
//  HMLoopView.h
//  01-网易新闻
//
//  Created by shenzhenIOS on 16/3/13.
//  Copyright © 2016年 shenzhenIOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HMTitlePositionBlowImage, //  标题在图片下面
    HMTitlePositionAboveImage, // 标题在图片上面
} HMTitlePosition;

@interface HMLoopView : UIView
/**
 *  创建图片轮播器
 *
 *  @param URLStrs 图片URL数组
 *  @param titles  标题数组
 */
- (instancetype)initWithURLStrs:(NSArray <NSString *> *)URLStrs titles:(NSArray  <NSString *> *)titles didSelected:(void (^)(NSInteger index))didSelected;
/**
 *  时间间隔
 */
@property (nonatomic, assign) NSInteger timerInterval;
// 标题的位置
@property (nonatomic, assign) HMTitlePosition titlePosition;
@end
