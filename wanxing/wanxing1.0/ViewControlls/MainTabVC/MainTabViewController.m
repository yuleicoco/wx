//
//  MainTabViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "MainTabViewController.h"

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
    
    
    
}
//*****************************************************控制器****************************************

-(UINavigationController *)HomeVC
{
    
    if (!_HomeVC) {
    
        
        
    }
    
    return _HomeVC;
}

-(UINavigationController *)DoVC
{
    if (!_DoVC) {
        
    }
    return _DoVC;
}

-(UINavigationController *)WorkVC
{
    
    if (!_WorkVC) {
        
    }
    return  _WorkVC;
    
    
}

-(UINavigationController *)MeVC
{
    if (!_MeVC) {
        
    }
    
    return _MeVC;
    
}
//*****************************************************控制器****************************************

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



@end
