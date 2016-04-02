//
//  NSString+textSize.m
//  QQ通讯聊天界面 1-6
//
//  Created by 枫林晚 on 16/1/6.
//  Copyright © 2016年 方林威. All rights reserved.
//

#import "NSString+textSize.h"

@implementation NSString (textSize)

- (CGSize)stringSizeWithMaxSize:(CGSize)maxSize andFontSize:(CGFloat)fontSize{

    NSDictionary * attr = @{NSFontAttributeName :[UIFont systemFontOfSize:fontSize]};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attr context:nil].size;
}

@end
