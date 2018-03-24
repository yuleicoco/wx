//
//  BaseViewController.h
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

// 导航器左右
typedef enum
{
    NAV_LEFT                    =0,
    NAV_RIGHT                   =1,
} EzNavigationBar;

@interface BaseViewController : UIViewController<UINavigationControllerDelegate>

//view基类

@property(nonatomic,strong)NSString * MessgaeNum;

- (void)SetupData; // 初始化数据
- (void)SetupView; // 初始化视图


// 我的页面 消息

- (void)showBarButton:(EzNavigationBar)position title:(NSString *)name fontColor:(UIColor *)color hide:(BOOL)hide;
- (void)showBarButton:(EzNavigationBar)position title:(NSString *)name fontColor:(UIColor *)color font:(UIFont *)f hide:(BOOL)hide;


- (void)showBarButton:(EzNavigationBar)position imageName:(NSString *)imageName;

- (void)showBarButton:(EzNavigationBar)position button:(UIButton *)button;

- (void)setTitleView:(UIView *)titleView;

- (void)doLeftButtonTouch;

- (void)doRightButtonTouch;

- (void) setNavTitle:(NSString*) navTitle;

- (void)hideNav;
- (void)setleftItem:(NSString *)Title;






@end
