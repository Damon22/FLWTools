//
//  UIView+Capture.m
//  09-画板-(掌握)
//
//  Created by SZSYKT_iOSBasic_2 on 16/1/31.
//  Copyright © 2016年 heima. All rights reserved.
//

#import "UIView+Capture.h"

@implementation UIView (Capture)
/**
 *  截图
 */
- (UIImage *)capture {
    // 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    
    // 获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 将图层的所有内容绘制到指定的上下文中
    [self.layer renderInContext:ctx];
    // 从图形上下文中获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}
@end
