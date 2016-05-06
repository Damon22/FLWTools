//
//  UIImage+BNPAsynscExtension.m
//  BNPDoctor
//
//  Created by 枫林晚 on 16/5/5.
//  Copyright © 2016年 新视界. All rights reserved.
//

#import "UIImage+BNPAsynscExtension.h"

@implementation UIImage (BNPAsynscExtension)
- (void)bnp_AsyncDrowImageWithSize:(CGSize)size bkgColor:(UIColor *)bkgColor isCorner:(BOOL)isCorner drawFinsh:(void (^)(UIImage *))drawFinsh
{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        CGSize blockSize = size;
        if (CGSizeEqualToSize(size, CGSizeZero)) {
            // 别人没有传入大小,使用图片大小
            blockSize = CGSizeMake(self.size.width, self.size.height);
        }
        
        // 上下文的rect
        //CGRect(origin: CGPointZero, size: size!)
        CGRect rect = CGRectMake(0, 0, blockSize.width, blockSize.height);
        
        
        //开启上下文
        //第二个参数: 不透明度: true 表示不透明, false 表示透明
        UIGraphicsBeginImageContextWithOptions(blockSize, bkgColor != nil, [UIScreen mainScreen].scale);
        
        //设置背景颜色
        [bkgColor setFill];
        UIRectFill(rect);
        
        //需要圆角
        if (isCorner) {
            // 路径
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
            
            //让后面绘制的元素在路径里面
            [path addClip];
        }
        
        [self drawInRect:rect];
        
        //获取图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        XNSLog(@"%@",newImage);
        //结束上下文
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            drawFinsh(newImage);
        });
    });
}
@end
