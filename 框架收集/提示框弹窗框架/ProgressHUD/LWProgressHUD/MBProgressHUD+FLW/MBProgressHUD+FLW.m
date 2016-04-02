//
//  MBProgressHUD+FLW.m
//  HudDemo
//
//  Created by 枫林晚 on 16/2/24.
//  Copyright © 2016年 Matej Bukovinski. All rights reserved.
//

#import "MBProgressHUD+FLW.h"
#define LWKeyWinow [UIApplication sharedApplication].keyWindow


@implementation MBProgressHUD (FLW)


#pragma mark 显示一些信息
///// UIActivityIndicatorView.
//MBProgressHUDModeIndeterminate,   菊花
///// A round, pie-chart like, progress view.
//MBProgressHUDModeDeterminate,    圆
///// Horizontal progress bar.
//MBProgressHUDModeDeterminateHorizontalBar,   线条
///// Ring-shaped progress view.
//MBProgressHUDModeAnnularDeterminate,  浅圆
///// Shows a custom view.
//MBProgressHUDModeCustomView,   自定义
///// Shows only labels.
//MBProgressHUDModeText   只有文字
//自定义样式
//主方法

+ (MBProgressHUD *)show:(NSString *)message details:(NSString *)details  toView:(UIView *)view icon:(UIImage *)image dimBackground:(BOOL)dimBackground mode:(MBProgressHUDMode)mode CancelButtonName:(NSString *)cancelButtonName{

    if (view == nil) {
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            if (!window.isKeyWindow)continue;
            view = window;
            break;
        }
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = mode;
    
    //蒙版效果
    hud.dimBackground = dimBackground;

    hud.label.text = NSLocalizedString(message, @"HUD loading title");
    
    hud.square = YES;
    
    //详细消息
    hud.detailsLabel.text = NSLocalizedString(details, @"HUD title");
    if (cancelButtonName.length) {
        
        [hud.button setTitle:NSLocalizedString(cancelButtonName, @"HUD cancel button title") forState:UIControlStateNormal];
        [hud.button addTarget:self action:@selector(cancelLoad:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (image) {
        
        hud.customView = [[UIImageView alloc] initWithImage:image];
    }
    
    
    
    return hud;
}

#pragma mark - /********* 加载信息  转菊花 *********/
+ (MBProgressHUD *)loadShowMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{

   MBProgressHUD *hud =  [self show:message details:details toView:view icon:nil dimBackground:dimBackground mode:MBProgressHUDModeIndeterminate CancelButtonName:cancelButtonName];
    return hud;
}

+ (void)cancelLoad:(UIButton *)btn{

    [MBProgressHUD hideHUD];
}

//加载信息  转菊花
+ (MBProgressHUD *)showMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground {

   MBProgressHUD *hud =  [MBProgressHUD show:message details:details toView:view icon:nil dimBackground:dimBackground mode:MBProgressHUDModeIndeterminate CancelButtonName:nil];
    
    return hud;
}

+ (void)showIndeterminate{
    
    [self showMessage:nil];
    
}

+ (void)showMessage:(NSString *)message {

    [self showMessage:message Details:nil];

}

+ (void)showMessage:(NSString *)message Details:(NSString *)details
{
    
    [self showMessage:message Details:details dimBackground:NO];
}

+ (void)showMessage:(NSString *)message Details:(NSString *)details dimBackground:(BOOL)dimBackground
{
    [self showMessage:message details:details toView:nil dimBackground:dimBackground];

}

#pragma mark - /********* 显示自定义图片 *********/
//加载图片
+ (MBProgressHUD *)showIcon:(UIImage *)image message:(NSString *)message Details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName
{
    MBProgressHUD *hud = [MBProgressHUD show:message details:details toView:view icon:image dimBackground:dimBackground mode:MBProgressHUDModeCustomView CancelButtonName:cancelButtonName];
    
    if (cancelButtonName.length) return hud;
    
    [hud hideAnimated:YES afterDelay:2.f];
    
    return hud;
    
}

+ (void)showIcon:(UIImage *)image {
    
    [self showIcon:image Message:nil];
    
}

+ (void)showIcon:(UIImage *)image Message:(NSString *)message {
    
    [self showIcon:image Message:message withCancelButtonName:nil];
    
}

+ (void)showIcon:(UIImage *)image Message:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName

{
    
    [self showIcon:image message:message Details:nil toView:nil dimBackground:NO withCancelButtonName:cancelButtonName];
}

+ (void)showIcon:(UIImage *)image Message:(NSString *)message Details:(NSString *)details dimBackground:(BOOL)dimBackground
{
    [self showIcon:image message:message Details:details toView:nil dimBackground:dimBackground withCancelButtonName:nil];
    
}



#pragma mark - /********* 加载 成功*********/
//加载成功
+ (MBProgressHUD *)showSuccess:(NSString *)success toView:(UIView *)view dimBackground:(BOOL)dimBackground

{
    NSString *iconName = @"Checkmark.png";
    
    UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", iconName]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    MBProgressHUD *hud = [MBProgressHUD show:success details:nil toView:nil icon:image dimBackground:dimBackground mode:MBProgressHUDModeCustomView CancelButtonName:nil];
    
    [hud hideAnimated:YES afterDelay:1.f];
    
    return hud;
}
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil dimBackground:NO];
}

+ (void)showSuccess:(NSString *)success dimBackground:(BOOL)dimBackground
{
    [self showSuccess:success toView:nil dimBackground:dimBackground];
}


#pragma mark - /********* 失败XXXX *********/
+ (MBProgressHUD *)showError:(NSString *)errorInfo toView:(UIView *)view dimBackground:(BOOL)dimBackground

{
    NSString *iconName = @"error.png";
    
    UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", iconName]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    MBProgressHUD *hud = [MBProgressHUD show:errorInfo details:nil toView:nil icon:image dimBackground:dimBackground mode:MBProgressHUDModeCustomView CancelButtonName:nil];
    
    [hud hideAnimated:YES afterDelay:2.f];
    
    return hud;
}
+ (void)showError:(NSString *)errorInfo
{
    [self showError:errorInfo toView:nil dimBackground:NO];
}

+ (void)showError:(NSString *)errorInfo dimBackground:(BOOL)dimBackground
{
    [self showError:errorInfo toView:nil dimBackground:dimBackground];
}

#pragma mark - /********* 上载 *********/
+ (MBProgressHUD *)showUploadMode:(MBProgressHUDMode)mode Message:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{
    MBProgressHUD *hud = [MBProgressHUD show:message details:details toView:view icon:nil dimBackground:dimBackground mode:mode CancelButtonName:cancelButtonName];
    
    
    if (cancelButtonName.length) {
        
        [hud.button setTitle:NSLocalizedString(cancelButtonName, @"HUD cancel button title") forState:UIControlStateNormal];
        
        [hud.button addTarget:self action:@selector(cancelWork:) forControlEvents:UIControlEventTouchUpInside];

}
  

    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{

        [hud doSomeWorkWithProgress:hud.button];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
    
    return hud;
}

+ (void)cancelWork:(UIButton *)btn{

    btn.selected = YES;
}

#pragma mark - /********* 圆 *********/
+ (MBProgressHUD *)loadShowDeterminateMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{

    MBProgressHUD * hud = [self showUploadMode:MBProgressHUDModeDeterminate Message:message details:details toView:view dimBackground:dimBackground withCancelButtonName:(NSString *)cancelButtonName];
    
    return hud;
}

+ (void)loadShowDeterminateMessage:(NSString *)message details:(NSString *)details{

    [self loadShowDeterminateMessage:message details:details dimBackground:NO withCancelButtonName:nil];

}

+ (void)loadShowDeterminateMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{

    [self loadShowDeterminateMessage:message details:details toView:nil dimBackground:dimBackground withCancelButtonName:(NSString *)cancelButtonName];
}

+ (void)loadShowDeterminateMessage:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName
{
    [self loadShowDeterminateMessage:message details:nil dimBackground:NO withCancelButtonName:(NSString *)cancelButtonName];
}



#pragma mark - /********* 浅圆 *********/
+ (MBProgressHUD *)loadShowAnnularDeterminateMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{
    
   MBProgressHUD *hud = [self showUploadMode:MBProgressHUDModeAnnularDeterminate Message:message details:details toView:view dimBackground:dimBackground withCancelButtonName:(NSString *)cancelButtonName];
    
    return hud;
    
}

+ (void)loadShowAnnularDeterminateMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName {
    
    [self loadShowAnnularDeterminateMessage:message details:details toView:nil dimBackground:dimBackground withCancelButtonName:(NSString *)cancelButtonName];
}

+ (void)loadShowAnnularDeterminateMessage:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName
{
    [self loadShowAnnularDeterminateMessage:message details:nil dimBackground:NO withCancelButtonName:(NSString *)cancelButtonName];
}

+ (void)loadShowAnnularDeterminateMessage:(NSString *)message details:(NSString *)details{
    
    [self loadShowAnnularDeterminateMessage:message details:details dimBackground:NO withCancelButtonName:nil];
    
}

#pragma mark - /********* 线条加载 *********/
+ (MBProgressHUD *)loadShowBarDeterminateMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{
    
   MBProgressHUD *hud = [self showUploadMode:MBProgressHUDModeDeterminateHorizontalBar Message:message details:details toView:view dimBackground:dimBackground withCancelButtonName:(NSString *)cancelButtonName];
    
    return hud;
}

+ (void)loadShowBarDeterminateMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{
    
    [self loadShowBarDeterminateMessage:message details:details toView:nil dimBackground:dimBackground withCancelButtonName:(NSString *)cancelButtonName];
}

+ (void)loadShowBarDeterminateMessage:(NSString *)message withCancelButtonName:(NSString *)cancelButtonName
{
    [self loadShowBarDeterminateMessage:message details:nil dimBackground:NO withCancelButtonName:(NSString *)cancelButtonName];
}
+ (void)loadShowBarDeterminateMessage:(NSString *)message details:(NSString *)details{
    
    [self loadShowBarDeterminateMessage:message details:details dimBackground:NO withCancelButtonName:nil];
    
}



#pragma mark - /********* 仅显示文字 *********/
+ (MBProgressHUD *)loadShowTextOnlyMessage:(NSString *)message details:(NSString *)details toView:(UIView *)view dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{

    MBProgressHUD *hud = [MBProgressHUD show:message details:details toView:view icon:nil dimBackground:dimBackground mode:MBProgressHUDModeText CancelButtonName:cancelButtonName];
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    if (cancelButtonName.length) return hud;
    
    [hud hideAnimated:YES afterDelay:2.f];
    
    return hud;
}

+ (void)showTextOnlyMessage:(NSString *)message details:(NSString *)details dimBackground:(BOOL)dimBackground withCancelButtonName:(NSString *)cancelButtonName{
    
    [self loadShowTextOnlyMessage:message details:details toView:nil dimBackground:dimBackground withCancelButtonName:cancelButtonName];
}

+ (void)showTextOnlyMessage:(NSString *)message details:(NSString *)details{

    [self showTextOnlyMessage:message details:details dimBackground:NO withCancelButtonName:nil];

}

+ (void)showTextOnlyMessage:(NSString *)message
{
    [self showTextOnlyMessage:message details:nil];
}

//成功下载
+ (void)showSuccessModeSwitchingPreparing:(NSString *)preparing Loading:(NSString *)loading CleaningUp:(NSString *)cleaningUp Completed:(NSString *)completed {

    NSString *iconName = @"Checkmark.png";
    
    
    
    UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",iconName]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self showPreparing:preparing Loading:loading CleaningUp:cleaningUp Completed:completed CustomIcon:image];

}

//错误下载
+ (void)showErrorModeSwitchingPreparing:(NSString *)preparing Loading:(NSString *)loading CleaningUp:(NSString *)cleaningUp Completed:(NSString *)completed
{
    NSString *iconName = @"error.png";
    
    UIImage *image = [[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@",iconName]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [self showPreparing:preparing Loading:loading CleaningUp:cleaningUp Completed:completed CustomIcon:image];
}

//自动下载样式
+ (void)showPreparing:(NSString *)preparing Loading:(NSString *)loading CleaningUp:(NSString *)cleaningUp Completed:(NSString *)completed CustomIcon:(UIImage *)image{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:LWKeyWinow animated:YES];
    
    hud.label.text = NSLocalizedString(preparing, @"HUD preparing title");

    hud.minSize = CGSizeMake(150.f, 100.f);
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{

        [hud doSomeWorkWithMixedLoading:loading CleaningUp:cleaningUp Completed:completed CustomIcon:image];
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

+ (MBProgressHUD *)showWindowForController:(UIViewController *)vc message:(NSString *)message{

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:vc.view.window animated:YES];
    
    hud.label.text = NSLocalizedString(message, @"HUD preparing title");
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        [hud doSomeWork];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
    
    
    return hud;
}

#pragma mark - Tasks

- (void)doSomeWork {
    sleep(3.);
}

- (void)doSomeWorkWithMixedLoading:(NSString *)loading CleaningUp:(NSString *)cleaningUp Completed:(NSString *)completed CustomIcon:(UIImage *)image{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:LWKeyWinow];
    sleep(2);
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeDeterminate;
        hud.label.text = NSLocalizedString(loading, @"HUD loading title");
    });
    float progress = 0.0f;
    while (progress < 1.0f) {
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{
            hud.progress = progress;
        });
        usleep(50000);
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.label.text = NSLocalizedString(cleaningUp, @"HUD cleanining up title");
    });
    sleep(2);
    dispatch_sync(dispatch_get_main_queue(), ^{
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.mode = MBProgressHUDModeCustomView;
        hud.label.text = NSLocalizedString(completed, @"HUD completed title");
    });
    sleep(2);
}

- (void)doSomeWorkWithProgress:(UIButton *)btn {
    
    btn.selected = NO;
    
    float progress = 0.0f;
    while (progress < 1.0f) {
        if (btn.selected) break;
        progress += 0.01f;
        dispatch_async(dispatch_get_main_queue(), ^{

            [MBProgressHUD HUDForView:LWKeyWinow].progress = progress;
        });
        usleep(50000);
    }
}

+ (void)networkingExample: (id)delegate{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:LWKeyWinow animated:YES];
    
    hud.label.text = NSLocalizedString(@"Preparing...", @"HUD preparing title");

    hud.minSize = CGSizeMake(150.f, 100.f);
    
    [hud doSomeNetworkWorkWithProgress:delegate];
}


- (void)doSomeNetworkWorkWithProgress :(id)delegate{
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:delegate delegateQueue:nil];
    NSURL *URL = [NSURL URLWithString:@"https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/HT1425/sample_iPod.m4v.zip"];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:URL];
    [task resume];
}

#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:LWKeyWinow];
        UIImage *image = [[UIImage imageNamed:@"Checkmark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.mode = MBProgressHUDModeCustomView;
        hud.label.text = NSLocalizedString(@"Completed", @"HUD completed title");
        [hud hideAnimated:YES afterDelay:3.f];
    });
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = (float)totalBytesWritten / (float)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:LWKeyWinow];
        hud.mode = MBProgressHUDModeDeterminate;
        hud.progress = progress;
    });
}




#pragma mark - /********* 隐藏方法 *********/
+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

+ (void)hideAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(hideDelayed:) withObject:[NSNumber numberWithBool:animated] afterDelay:delay];
}

+ (void)hideDelayed:(NSNumber *)animated {

    [self hideHUD];
}



@end
