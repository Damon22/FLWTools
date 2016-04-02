//
//  UIImage+resizableImage.m
//  QQ聊天界面  1-10
//
//  Created by 枫林晚 on 16/1/10.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import "UIImage+resizableImage.h"

@implementation UIImage (resizableImage)

+ (UIImage *)resizableImageWithName:(NSString *)name andResizingMode:(UIImageResizingMode)resizingMode{

    //第一个参数：设置受保护区域，只有在间距范围交集的内容才能进行相应的拉伸和平铺，意味着要保护四个角点
    //第二个参数：图片是进行拉伸还是平铺：UIImageResizingModeStretch：拉伸  UIImageResizingModeTile:平铺
    return  [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 25, 30, 30) resizingMode:UIImageResizingModeTile];
}


+ (UIImage *)resizableImageWithName:(NSString *)name{
    
    return [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 25, 30, 30) resizingMode:UIImageResizingModeTile];
}


+ (UIImage *)stretchableImageWithImageName:(NSString *)name{

    UIImage *img = [UIImage imageNamed:name];
    
    return [img stretchableImageWithLeftCapWidth:img.size.width *0.5 topCapHeight:img.size.height *0.5];
}

@end
