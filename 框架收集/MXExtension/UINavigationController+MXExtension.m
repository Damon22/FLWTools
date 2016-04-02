//
//  UINavigationController+MXExtension.m
//  物留客
//
//  Created by pkxing on 15/2/3.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//
#import "UINavigationController+MXExtension.h"
#import "MXHeadForBlock.h"
#import <objc/runtime.h>
@implementation UINavigationController (MXExtension)
+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(pushViewController:animated:)), class_getInstanceMethod([self class], @selector(pushViewMXController:animated:)));
    
}

- (void)pushViewMXController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[UITableViewController class]]) {
        UITableView *tableView = (UITableView *)viewController.view;
        UIView *topBarView  = objc_getAssociatedObject(tableView, MXTopBarView);
        if (topBarView) {
            UIViewController *newVc  = [[UIViewController alloc] init];
            newVc.title = viewController.title;
            newVc.navigationItem.leftBarButtonItem = viewController.navigationItem.leftBarButtonItem;
            newVc.navigationItem.rightBarButtonItem = viewController.navigationItem.rightBarButtonItem;
            newVc.navigationItem.titleView = viewController.navigationItem.titleView;
            newVc.edgesForExtendedLayout = UIRectEdgeNone;
            [newVc addChildViewController:viewController];
            [newVc.view addSubview:viewController.view];
            viewController.view.frame = newVc.view.bounds;
            [self pushViewMXController:newVc animated:YES];
            return;
        }
     }
    [self pushViewMXController:viewController animated:YES];
}
@end
