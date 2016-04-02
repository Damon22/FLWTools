//
//  UIImage+resizableImage.h
//  QQ聊天界面  1-10
//
//  Created by 枫林晚 on 16/1/10.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (resizableImage)

/**
 *  拉伸图片
 *
 *  @param name         图片名字
 *  @param resizingMode 拉伸或者平铺
 *
 *  @return 拉伸完的图片
 */
+ (UIImage *)resizableImageWithName:(NSString *)name andResizingMode:(UIImageResizingMode)resizingMode;

/**
 *  拉伸图片
 *
 *  @param name 图片名字
 *
 *  @return 拉伸完的图片
 */
+ (UIImage *)resizableImageWithName:(NSString *)name;


+ (UIImage *)stretchableImageWithImageName:(NSString *)name;

//imgNor stretchableImageWithLeftCapWidth:imgNor.size.width *0.5 topCapHeight:imgNor.size.height *0.5];

@end
