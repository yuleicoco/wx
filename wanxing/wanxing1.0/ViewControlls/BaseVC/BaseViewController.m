//
//  BaseViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseViewController.h"
#import "UITabBar+Badge.h"


@interface BaseViewController ()

@end

@implementation BaseViewController


//*****************************************************逻辑****************************************



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SetupData];
    [self SetupView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self BackButtion];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
    
}

//*****************************************************逻辑****************************************


-(void)SetupData
{
    
    
}

-(void)SetupView
{
    
    
}
//*****************************************************方法****************************************

-(void)doLeftButtonTouch
{
    
    
}

-(void)doRightButtonTouch
{
    
    
    
}

- (void)showBarButton:(EzNavigationBar)position title:(NSString *)name fontColor:(UIColor *)color hide:(BOOL)hide{
    
    
}


- (void)showBarButton:(EzNavigationBar)position imageName:(NSString *)imageName{
    
    
}

- (void)showBarButton:(EzNavigationBar)position button:(UIButton *)button
{
    
    
    
}

- (void)setTitleView:(UIView *)titleView{
    
    
}

- (void) setNavTitle:(NSString*) navTitle{
    
    
}
//  返回

- (void)BackButtion{
    
    
    
}
//*****************************************************方法****************************************

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
