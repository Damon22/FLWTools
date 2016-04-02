//
//  UIView+MXExtension.m
//  物留客
//
//  Created by pkxing on 15/2/3.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//
#import "MXHeadForBlock.h"
#import "UIView+MXExtension.h"
#import <objc/runtime.h>
@implementation UIView (MXExtension)
- (UIViewController*)viewController {
    UIViewController *vc = nil;
    for (UIView * next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            if (![nextResponder isKindOfClass:[UINavigationController class]]) {
                return (UIViewController*)nextResponder;
            } else {
                UINavigationController *nav = (UINavigationController *)nextResponder;
                return [nav.viewControllers lastObject];
            }
        }
    }
    return vc;
}

+(void)load{
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(bringSubviewToFront:)), class_getInstanceMethod([self class], @selector(bringMxSubviewToFront:)));
}

- (void)bringMxSubviewToFront:(UIView *)view {
    [self bringMxSubviewToFront:view];
    if ([view isKindOfClass:[UITableView class]]) {
        UIView *topBarView  = objc_getAssociatedObject(view, MXTopBarView);
        if (topBarView) {
            [view.superview bringMxSubviewToFront:topBarView];
        }
    }
}
@end
