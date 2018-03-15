//
//  AppDelegate+Launcher.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "AppDelegate+Launcher.h"


@implementation AppDelegate (Launcher)

// 逻辑入口
- (void)launcherApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
   // [self CheckLogin];
    [self EenterMainTab];
    
    
    
}

//登录入口
- (void)CheckLogin{
    
    
    
// 检查是否为第一次
    
}


// 进入主页
-(void)EenterMainTab
{
    self.mainTabVC = [[MainTabViewController alloc]init];
    
    self.window.rootViewController = self.mainTabVC;
    
    [self.window makeKeyAndVisible];
    
}

//代理函数-----引导页

@end
