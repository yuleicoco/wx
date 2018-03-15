//
//  MainTabViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "MainTabViewController.h"
#import "HomeViewController.h"
#import "DoViewController.h"
#import "MeViewController.h"
#import "WorkViewController.h"


@interface MainTabViewController ()

{
    
}
@property(nonatomic,strong)UINavigationController * HomeVC; // 首页
@property(nonatomic,strong)UINavigationController * DoVC;   // 实施
@property(nonatomic,strong)UINavigationController * WorkVC; // 办公
@property(nonatomic,strong)UINavigationController * MeVC;   // 我的


@end

@implementation MainTabViewController


//*****************************************************逻辑****************************************
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    
    [self SetupSubViews];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
//*****************************************************逻辑****************************************


- (void)pushViewController:(UIViewController*)viewController
{
    
    
}

// 加载view
- (void)SetupSubViews
{
    
    self.tabBar.backgroundColor=[UIColor whiteColor];
    
    self.viewControllers = @[
                             self.HomeVC,
                             self.DoVC,
                             self.WorkVC,
                             self.MeVC,
                             ];
    
    self.tabBar.layer.shadowColor = [UIColor blackColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -1);
    self.tabBar.layer.shadowOpacity = 0.4;
    self.tabBar.layer.shadowRadius = 2;
    
}
//*****************************************************控制器****************************************

-(UINavigationController *)HomeVC
{
    
    if (!_HomeVC) {
    
        HomeViewController* vc = [[HomeViewController alloc] init];
        vc.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabSquare", nil)
                                      image:[[UIImage imageNamed:@"un_home_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                              selectedImage:[[UIImage imageNamed:@"home_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        _HomeVC = [[UINavigationController alloc]initWithRootViewController:vc];
        
        
    }
    
    return _HomeVC;
}

-(UINavigationController *)DoVC
{
    if (!_DoVC) {
        
        DoViewController* vc = [[DoViewController alloc] init];
        vc.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabDo", nil)
                                      image:[[UIImage imageNamed:@"un_do_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                              selectedImage:[[UIImage imageNamed:@"do_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        _DoVC = [[UINavigationController alloc]initWithRootViewController:vc];
    }
    return _DoVC;
}

-(UINavigationController *)WorkVC
{
    
    if (!_WorkVC) {
        
        WorkViewController* vc = [[WorkViewController alloc] init];
        vc.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabWork", nil)
                                      image:[[UIImage imageNamed:@"un_work_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                              selectedImage:[[UIImage imageNamed:@"work_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        _WorkVC = [[UINavigationController alloc]initWithRootViewController:vc];
        
    }
    return  _WorkVC;
    
    
}

-(UINavigationController *)MeVC
{
    if (!_MeVC) {
        MeViewController* vc = [[MeViewController alloc] init];
        vc.tabBarItem =
        [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabMe", nil)
                                      image:[[UIImage imageNamed:@"un_me_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                              selectedImage:[[UIImage imageNamed:@"me_tab"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        _MeVC = [[UINavigationController alloc]initWithRootViewController:vc];
    }
    
    return _MeVC;
    
}
//*****************************************************控制器****************************************

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



@end
