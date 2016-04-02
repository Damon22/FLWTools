//
//  NSString+textSize.h
//  QQ通讯聊天界面 1-6
//
//  Created by 枫林晚 on 16/1/6.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (textSize)

/**
 *  计算字符串所占的大小
 *
 *  @param maxSize  限制宽度和高度
 *  @param fontSize 字体大小
 *
 *  @return 字符串的大小
 */
- (CGSize)stringSizeWithMaxSize:(CGSize)maxSize andFontSize:(CGFloat)fontSize;

@end
