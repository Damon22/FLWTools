//
//  MBProgressHUD+FLW.h
//  HudDemo
//
//  Created by 枫林晚 on 16/2/24.
//  Copyright © 2016年 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (FLW)

+ (MBProgressHUD *)show:(NSString *)message details:(NSString *)details  toView:(UIView *)view icon:(UIImage *)image dimBackground:(BOOL)dimBackground mode:(MBProgressHUDMode)mode CancelButtonName:(NSString *)cancelButtonName;


/**
 *  带按钮的菊花创建
 */
+ (MBProgressHUD *)loadShowMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;

/**
 *  转菊花  不会自动消失  需要手动消失
 *
 *  @param message       主要内容
 *  @param details       详细内容
 *  @param view          显示的view
 *  @param dimBackground 是否需要灰灰蒙版
 */
+ (MBProgressHUD *)showMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground;
/**
 *  显示没有内容的菊花
 */
+ (void)showIndeterminate;
/**
 *  显示有内容的菊花
 */
+ (void)showMessage:(NSString *)message;
/**
 *  显示有主要内容和详细内容的菊花
 */
+ (void)showMessage:(NSString *)message Details:(NSString *)details;
/**
 *  显示有主要内容和详细内容的菊花  可以设置蒙层
 */
+ (void)showMessage:(NSString *)message Details:(NSString *)details dimBackground:(BOOL)dimBackground;


/**
 *  显示自定义图片
 *
 *  @param image            图片
 *  @param message          图片大致
 *  @param details          图片描述
 *  @param view             显示位置
 *  @param dimBackground    是否添加蒙层
 *  @param cancelButtonName 按钮名
 *
 */
+ (MBProgressHUD *)showIcon:(UIImage *)image message:(NSString *)message Details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;

/**
 *  仅显示图片
 *
 */
+ (void)showIcon:(UIImage *)image;
/**
 *  显示图片和描述
 */
+ (void)showIcon:(UIImage *)image Message:(NSString *)message;
/**
 *  显示图片和描述  带有取消按钮
 */
+ (void)showIcon:(UIImage *)image Message:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName;

/**
 *  显示图片    大致描述信息    详细描述   是否显示蒙层
 */
+ (void)showIcon:(UIImage *)image Message:(NSString *)message Details:(NSString *)details dimBackground:(BOOL)dimBackground;


/**
 *  对勾
 *
 *  @param message       主要内容
 *  @param view          显示的view
 *  @param dimBackground 是否需要灰灰蒙版
 */
+ (MBProgressHUD *)showSuccess:(NSString *)success toView:(UIView *)view dimBackground:(BOOL)dimBackground;
/**
 *  显示有内容的对勾  可以设置蒙层
 */
+ (void)showSuccess:(NSString *)success;
/**
 *  显示有内容的对勾  可以设置蒙层
 */
+ (void)showSuccess:(NSString *)success dimBackground:(BOOL)dimBackground;


/**
 *  XXXXXX
 *
 *  @param message       主要内容
 *  @param view          显示的view
 *  @param dimBackground 是否需要灰灰蒙版
 */
+ (MBProgressHUD *)showError:(NSString *)errorInfo toView:(UIView *)view dimBackground:(BOOL)dimBackground;


/**
 *  显示有内容信息的XXXXXX  可以设置蒙层
 */
+ (void)showError:(NSString *)errorInfo;

/**
 *  显示有内容的XXXXXX  可以设置蒙层
 */
+ (void)showError:(NSString *)errorInfo dimBackground:(BOOL)dimBackground;

/**
 *  深色圆加载  会自动消失
 *
 *  @param message       主要内容
 *  @param details       详细内容
 *  @param view          显示的view
 *  @param dimBackground 是否需要灰灰蒙版
 *  @param cancelButtonName 按钮的名字
 */
+ (MBProgressHUD *)loadShowDeterminateMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;
/**
 *  显示有主要内容和详细内容的深色圆  可以设置蒙层
 */
+ (void)loadShowDeterminateMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;

+ (void)loadShowDeterminateMessage:(NSString *)message details:(NSString *)details;



/**
 *  显示有主要内容的深色圆
 */
+ (void)loadShowDeterminateMessage:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName;

/**
 *  浅色圆加载  会自动消失
 *
 *  @param message       主要内容
 *  @param details       详细内容
 *  @param view          显示的view
 *  @param dimBackground 是否需要灰灰蒙版
 */
+ (MBProgressHUD *)loadShowAnnularDeterminateMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;

/**
 *  显示有主要内容和详细内容的浅色圆  可以设置蒙层
 */
+ (void)loadShowAnnularDeterminateMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;
/**
 *  显示有主要内容的浅色圆
 */
+ (void)loadShowAnnularDeterminateMessage:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName;

+ (void)loadShowAnnularDeterminateMessage:(NSString *)message details:(NSString *)details;


/**
 *  线条加载  会自动消失
 *
 *  @param message       主要内容
 *  @param details       详细内容
 *  @param view          显示的view
 *  @param dimBackground 是否需要灰灰蒙版
 */
+ (MBProgressHUD *)loadShowBarDeterminateMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;
/**
 *  显示有主要内容和详细内容的线条加载  可以设置蒙层
 */
+ (void)loadShowBarDeterminateMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;
/**
 *  显示有主要内容的线条加载
 */
+ (void)loadShowBarDeterminateMessage:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName;

+ (void)loadShowBarDeterminateMessage:(NSString *)message details:(NSString *)details;

/**
 *  主要内容  详细内容  显示的view 是否蒙层  按钮文字
 */
+ (MBProgressHUD *)loadShowTextOnlyMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;
+ (void)showTextOnlyMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName;
+ (void)showTextOnlyMessage:(NSString *)message details:(NSString *)details;
+ (void)showTextOnlyMessage:(NSString *)message;

/**
 *  显示在指定控制器的window上
 */
+ (MBProgressHUD *)showWindowForController:(UIViewController *)vc message:(NSString *)message;


/**
 *  下载成功  准备下载  正在下载  正在安装  安装成功
 *                          菊花     方形条    菊花     对勾
 */
+ (void)showSuccessModeSwitchingPreparing:(NSString *)preparing Loading:(NSString *)loading CleaningUp:(NSString *)cleaningUp Completed:(NSString *)completed;
/**
 *  下载失败  准备下载  正在下载  正在安装  安装失败
 *                          菊花     方形条    菊花     XX
 */
+ (void)showErrorModeSwitchingPreparing:(NSString *)preparing Loading:(NSString *)loading CleaningUp:(NSString *)cleaningUp Completed:(NSString *)completed;
/**
 *  下载成功  准备下载  正在下载  正在安装  安装成功
 *                          菊花     方形条    菊花     自定义照片
 */
+ (void)showPreparing:(NSString *)preparing Loading:(NSString *)loading CleaningUp:(NSString *)cleaningUp Completed:(NSString *)completed CustomIcon:(UIImage *)image;

/**
 *  延迟自定时间关闭
 */
+ (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay;
/**
 *  从哪个View上关闭
 *
 */
+ (void)hideHUDForView:(UIView *)view;
/**
 *  直接关闭
 */
+ (void)hideHUD;

@end
