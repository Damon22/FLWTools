//
//  LWVideoTool.h
//  XML练习
//
//  Created by 枫林晚 on 16/3/5.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LWVideoTool : NSObject

/** block需传入控制器刷新 */
+ (void)videoWithUrlString:(NSString *)urlString finished:(void (^)(NSArray *videos))finished;

@end
