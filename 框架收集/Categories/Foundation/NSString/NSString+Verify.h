//
//  NSString+Verify.h
//  正则表达式实战
//
//  Created by 枫林晚 on 16/3/28.
//  Copyright © 2016年 枫林晚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)
/** 是否QQ */
- (BOOL)isQQ;
/** 是否手机号 */
- (BOOL)isPhone;
/** 是否邮箱 */
- (BOOL)isEmail;
/**
 *  正则判断
 *
 *  @param pattern 匹配模式
 *
 *  @return 返回判断结果
 */
- (BOOL)matchWithPattern:(NSString *)pattern;
@end

/** QQ的匹配模式 */
extern NSString *const patternQQ;
/** 手机号的匹配模式 */
extern NSString *const patternPhone;
/** 邮箱的匹配模式 */
extern NSString *const patternEmail;