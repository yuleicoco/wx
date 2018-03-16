//
//  AppDelegate.h
//  wanxing
//
//  Created by osyu on 2018/3/14.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabViewController.h"
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MainTabViewController* mainTabVC;
@property (nonatomic, strong) LoginViewController *loginVC;


@end

