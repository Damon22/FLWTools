//
//  FLWPngTool.h
//  sssss
//
//  Created by 枫林晚 on 16/3/4.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLWPngTool : NSObject

/**
 *  把app.car文件里面图片取出后面的加密后缀
 *
 *  @param pathA 图片路径
 *  @param pathB 写入的路径
 */
+ (void)writePngFramePath:(NSString *)pathA toPath:(NSString *)pathB;

@end
