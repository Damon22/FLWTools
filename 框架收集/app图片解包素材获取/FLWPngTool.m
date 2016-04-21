//
//  FLWPngTool.m
//  sssss
//
//  Created by 枫林晚 on 16/3/4.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import "FLWPngTool.h"

@implementation FLWPngTool


+ (void)writePngFramePath:(NSString *)pathA toPath:(NSString *)pathB{
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *path1 = [NSString stringWithFormat:@"%@/",pathA];
    
    NSString *path2 = [NSString stringWithFormat:@"%@/",pathB];
    
    NSArray *arr = [manager subpathsAtPath:path1];
    
    
    [arr enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        //截串
        NSArray *strArr = [obj componentsSeparatedByString:@"."];
        
        NSString *name = strArr.firstObject;
        
        NSString *lastStr = [NSString stringWithFormat:@"%@.%@",strArr[strArr.count - 2],strArr.lastObject];
        
        if ([name containsString:@"@"]) {
            //截取
            NSRange range = [name rangeOfString:@"@"];
            name = [name substringToIndex:range.location];
        }
        
        name = [name stringByAppendingString:lastStr];
        
        name = [name stringByReplacingOccurrencesOfString:@"@1x" withString:@""];
        
        NSLog(@"name = %@",name);
        
        //拿去照片数据
        NSData *data = [manager contentsAtPath:[path1 stringByAppendingString:obj]];
        
        NSString *path = [path2 stringByAppendingPathComponent:name];
        
        //写入目标文件
        [data writeToFile:path atomically:YES];
    }];
    
    
}


@end
