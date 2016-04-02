//
//  UIImage+Extend.h
//  01-作业讲解-(掌握)
//
//  Created by SZSYKT_iOSBasic_2 on 16/1/31.
//  Copyright © 2016年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)
/**
 *  根据图片名返回一张圆形图片
 */
+ (UIImage *)circleImageWithName:(NSString *)imageName;

/**
 *  返回一张有边框的圆形图片
 *
 *  @param imageName   图片的名字
 *  @param borderWidth 边框大小
 *  @param borderColor 边框颜色
 *
 *  @return
 */
+ (UIImage *)circleImageWithName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
