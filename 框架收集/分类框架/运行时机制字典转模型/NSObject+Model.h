//
//  NSObject+Model.h
//  彩票
//
//  Created by xiaomage on 16/3/1.
//  Copyright (c) 2016年 枫林晚. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSObject (Model)

// 快速进行字典转模型
// mapDict:模型中的哪个属性名跟字典里面的key对应
+ (instancetype)objcWithDict:(NSDictionary *)dict mapDict:(NSDictionary *)mapDict;

@end
