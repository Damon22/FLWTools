//
//  NSString+Verify.m
//  正则表达式实战
//
//  Created by 枫林晚 on 16/3/28.
//  Copyright © 2016年 枫林晚. All rights reserved.
//

#import "NSString+Verify.h"

NSString *const patternQQ  = @"^[1-9]\\d{5,10}$";
NSString *const patternPhone = @"^(0|86)?1([358]\\d|7[678]|4[57])\\d{8}$";
NSString *const patternEmail = @"^[a-z0-9]+([\\._\\-]*[a-z0-9])*@([a-z0-9]+\\-*[a-z0-9]+\\.){1,63}[a-z0-9]+$";
@implementation NSString (Verify)


- (BOOL)isQQ
{
    //  QQ的匹配模式
    NSLog(@"%@",patternQQ);
    return [self matchWithPattern:patternQQ];
}

- (BOOL)isPhone
{
    return [self matchWithPattern:patternPhone];
}

- (BOOL)isEmail
{
    return [self matchWithPattern:patternEmail];
}


- (BOOL)matchWithPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *rge = [NSRegularExpression regularExpressionWithPattern:pattern options:kNilOptions error:&error];
    
    if (error) {
        
        return NO;
    }
    
    NSTextCheckingResult *results = [rge firstMatchInString:self options:kNilOptions range:NSMakeRange(0, self.length)];
    if (results) {
        return YES;
    }else
    {
        return NO;
    }
}

@end
