//
//  UITableViewCell+Extension.m
//  TableViewDemo
//
//  Created by pkxing on 15/1/31.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//
#import "MXHeadForBlock.h"
#import "UITableViewCell+MXExtension.h"
#import <objc/runtime.h>

#define MXIndexForButton 12345
@interface UITableViewCell()

@end
@implementation UITableViewCell (MXExtension)
+(void)load{
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(initWithStyle:reuseIdentifier:)), class_getInstanceMethod([self class], @selector(initWithMXStyle:reuseIdentifier:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(initWithCoder:)), class_getInstanceMethod([self class], @selector(initWithMxCoder:)));
}

+(instancetype)cellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier style:(UITableViewCellStyle)style {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:identifier];
    }
    return cell;
}

/**
 *  拦截系统的initWithCoder方法(目的:监听按钮)
 */
- (id)initWithMxCoder:(NSCoder *)aDecoder{
    self = [self initWithMxCoder:aDecoder];
    if (self) {
        [self mx_setup];
    }
    return self;
}
/**
 *  拦截系统的initWithStyle:reuseIdentifier:方法(目的:监听按钮)
 */
- (instancetype)initWithMXStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [self initWithMXStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self mx_setup];
    }
    return self;
}

- (void)mx_setup{
    [self setIndexForButton:MXIndexForButton];
    [self digView:self];
}

- (NSInteger)indexForButton{
    NSNumber *number = objc_getAssociatedObject(self, @"buttonIndex");
    NSInteger index = [number integerValue] ;
    [self setIndexForButton:index + 1];
    return index;
}

- (void)setIndexForButton:(NSInteger)index{
    objc_setAssociatedObject(self, @"buttonIndex", [NSNumber numberWithInteger:index], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *  变量 cell的所有子控件(目的:找出 button,添加事件)
 */
-(void)digView:(UIView *)view{
    NSInteger count = view.subviews.count;
    for (int index = 0; index < count; index ++) {
        UIView *childView = view.subviews[index];
        if (childView.subviews.count > 0) {
            [self digView:childView];
        }
        if ([childView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)childView;
            objc_setAssociatedObject(button, @"buttonIndex", [NSNumber numberWithInteger:[self indexForButton]], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [button addTarget:self action:@selector(mx_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}
#pragma mark - 监听按钮
- (void)mx_buttonClick:(UIButton *)button{
   CellButtonClickBlock actionBlock = objc_getAssociatedObject([self findSuperView:self], MXActionBlock);
    if (actionBlock) {
        NSNumber *number = objc_getAssociatedObject(button, @"buttonIndex");
        actionBlock(self,button,[number integerValue] - MXIndexForButton);
    }
}

- (UIView *)findSuperView:(UIView *)view{
    UIView *superView = [view superview];
    if ([superView isKindOfClass:[UITableView class]]) {
        return superView;
    }
    return [self findSuperView:superView];
}
@end
