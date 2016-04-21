//
//  NSObject+VGPrintlvar.m
//  表情键盘OC
//
//  Created by 枫林晚 on 16/4/21.
//  Copyright © 2016年 枫林晚. All rights reserved.
//

#import "NSObject+VGPrintlvar.h"
#import <objc/runtime.h>

@implementation NSObject (VGPrintlvar)

+ (void)printIvars{
    unsigned int outCount = 0;
    
    //属性指针数组
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    
    //获取里面的每个元素
    for (unsigned int i = 0; i < outCount; i++) {
        /// ivar 结构体指针
        Ivar ivar = ivars[i];
        
        const char *cName = ivar_getName(ivar);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        NSLog(@"%@",name);
    }
}

@end
