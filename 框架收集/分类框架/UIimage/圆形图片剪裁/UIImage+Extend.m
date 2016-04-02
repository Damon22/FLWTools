//
//  UIImage+Extend.m
//  01-作业讲解-(掌握)
//
//  Created by SZSYKT_iOSBasic_2 on 16/1/31.
//  Copyright © 2016年 heima. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend)
/**
 *  根据图片名返回一张圆形图片
 */
+ (UIImage *)circleImageWithName:(NSString *)imageName {
    // 绘制图片
    UIImage *icon = [UIImage imageNamed:imageName];
    // 开启位图上下文
    CGFloat width = MIN(icon.size.width, icon.size.height);
    CGFloat height = width;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0.0);
    // 获得位图上下文 -- 就是刚刚开启的位图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 拼接路径
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, width, height));
    // 裁剪
    CGContextClip(ctx);
    // 绘图图片
    [icon drawInRect:CGRectMake(0, 0, width, height)];
    
    // 从位图上下文中获得绘制好的图片
    UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
    
    // 在使用完位图上下文之后，要关闭
    UIGraphicsEndImageContext();
    
    return  image;
}

/**
 *  返回一张有边框的圆形图片
 *
 *  @param imageName   图片的名字
 *  @param borderWidth 边框大小
 *  @param borderColor 边框颜色
 *
 *  @return
 */
+ (UIImage *)circleImageWithName:(NSString *)imageName borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    // 绘制图片
    UIImage *icon = [UIImage imageNamed:imageName];
    
    CGFloat margin = borderWidth;
    // 开启位图上下文
    CGFloat width = MIN(icon.size.width, icon.size.height);
    CGFloat height = width;
    NSLog(@"%f",width);
    // 绘制图片
    // 开启位图上下文
    // 参数1：位图上下文尺寸
    // 参数2：opaque:不透明  YES:不透明 NO:透明
    // 参数3：缩放系数 0或1 等于0，则上下文实际的大小等于给定的值 * 当前屏幕的缩放系数
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width + 2 * margin, height + 2 * margin), NO, 0.0);
    // 获得位图上下文 -- 就是刚刚开启的位图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 拼接路径
    // 绘制大圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, width + 2 * margin, height + 2 * margin));
    
    // 设置颜色
    [borderColor set];
    // 渲染
    CGContextFillPath(ctx);
    
    // 绘制小圆
    // 设置颜色
    [[UIColor blueColor] set];
    CGContextAddEllipseInRect(ctx, CGRectMake(margin, margin, width, height));
    // 裁剪 -- 已经渲染的图形不会被裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [icon drawInRect:CGRectMake(margin, margin, width, height)];
    
    // 从位图上下文中获得绘制好的图片
    UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
    
    // 在使用完位图上下文之后，要关闭
    UIGraphicsEndImageContext();
    
    return image;
}
@end
