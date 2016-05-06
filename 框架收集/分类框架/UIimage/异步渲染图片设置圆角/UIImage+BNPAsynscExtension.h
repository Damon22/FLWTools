//
//  UIImage+BNPAsynscExtension.h
//  BNPDoctor
//
//  Created by 枫林晚 on 16/5/5.
//  Copyright © 2016年 新视界. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BNPAsynscExtension)
/** 异步渲染加载图片 */
- (void)bnp_AsyncDrowImageWithSize:(CGSize)size bkgColor:(UIColor *)bkgColor isCorner:(BOOL)isCorner drawFinsh:(void (^)(UIImage *image))drawFinsh;
@end
