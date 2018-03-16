 //
//  AppDelegate+Launcher.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "AppDelegate+Launcher.h"
#import "JDGuidePageView.h"
#import "AccountManager.h"
#import "ViewController.h"
@interface AppDelegate()<GetScrollVDelegate>

@end

@implementation AppDelegate (Launcher)

// 逻辑入口
- (void)launcherApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStateChange:) name:NotificationLoginStateChange object:nil];
    
    // [self CheckLogin];
    
    [self enterLoginVC];
    
}



// 进入主页
-(void)EenterMainTab
{
    if (self.loginVC) {
        self.loginVC = nil;
    }
    
    self.mainTabVC = [[MainTabViewController alloc]init];
    self.window.rootViewController = self.mainTabVC;
    [self.window makeKeyAndVisible];
    
    
    
}

// 进入登录界面
- (void)enterLoginVC

{
    if (self.mainTabVC) {
        self.mainTabVC = nil;
    }
    
    self.loginVC = [[LoginViewController alloc]init];
    
    UINavigationController * loginNaVc = [[UINavigationController alloc]initWithRootViewController:self.loginVC];
    self.window.rootViewController = loginNaVc;
    
    [self.window makeKeyAndVisible];
    
}

#pragma mark - 判断是不是首次登录或者版本更新
- (BOOL)isFirstLauch{
    
    //获取当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = infoDic[@"CFBundleShortVersionString"];
    
    
    //获取上次启动应用保存的appVersion
    NSString *version = [[NSUserDefaults standardUserDefaults] objectForKey:@"version"];
    //版本升级或首次登录
    if (version == nil || ![version isEqualToString:currentAppVersion]) {
        [[NSUserDefaults standardUserDefaults] setObject:currentAppVersion forKey:@"version"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }else{
        return NO;
    }
    
}

#pragma mark - 添加启动动画(此方法要在rootviewcontroller之后添加)



//- (void)addLaunchAnimation
//{
//    UIViewController *viewController = [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"LaunchScreen"];
//    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
//    [mainWindow addSubview:viewController.view];
//    [self.window bringSubviewToFront:viewController.view];
//
//    //添加广告图
//    /*
//     UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDHT, 300)];
//     NSString *str = @"http://upload-images.jianshu.io/upload_images/746057-6e83c64b3e1ec4d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240";
//     [imageV sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"default1.jpg"]];
//     [viewController.view addSubview:imageV];
//     */
//    [UIView animateWithDuration:0.6f delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//
//        viewController.view.alpha = 0.0f;
//        viewController.view.layer.transform = CATransform3DScale(CATransform3DIdentity, 2.0f, 2.0f, 1.0f);
//
//    } completion:^(BOOL finished) {
//        [viewController.view removeFromSuperview];
//    }];
//
//}


#pragma mark - 检查登录

- (void)CheckLogin
{
    if ([AccountManager sharedAccountManager].isLogin) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLoginStateChange object:@YES];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLoginStateChange object:@NO];
    }
    
}

-(void)loginStateChange:(NSNotification *)notification{
    BOOL loginSuccess = [notification.object boolValue];
    
    if (loginSuccess) {
        [self EenterMainTab];
    }else{
       
        if ([self isFirstLauch]) {
            // 第一次
            ViewController * VC   = [[ViewController alloc]init];
            self.window.rootViewController = VC;
            [self.window makeKeyAndVisible];
            
            
            JDGuidePageView *guideView =[[JDGuidePageView alloc]initGuideViewWithImages:@[@"guide_01", @"guide_02", @"guide_03"] ];
            guideView.delegate = self;
            guideView.isShowPageView = YES;
            guideView.isScrollOut = NO;
            guideView.currentColor =[UIColor redColor];
            [self.window addSubview:guideView];
    
            
            
        }else{
            //   不是
            [self EenterMainTab];
            
        }
        
    }
    
    
}
//代理函数
- (void)getScrollV:(NSString *)popScroll
{
    
    [self enterLoginVC];
    
    
}






@end
