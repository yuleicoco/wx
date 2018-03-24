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
    self.view.backgroundColor =[UIColor whiteColor];
    
    if (self.navigationController) {
        self.navigationController.navigationBar.layer.shadowOffset =CGSizeMake(0, 1);
        self.navigationController.navigationBar.translucent = NO;
        // 设置导航图片
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"home_nav_bg"] forBarMetrics:0];
    }
    
    
    
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
      [self.navigationController popViewControllerAnimated:NO];
    
}

-(void)doRightButtonTouch
{
    
    
    
}

- (void)hideNav
{
    self.navigationController.delegate = self;
    
}
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}


- (void)showBarButton:(EzNavigationBar)position title:(NSString *)name fontColor:(UIColor *)color hide:(BOOL)hide{
    
    UIButton *button ;
    CGSize titleSize = [name boundingRectWithSize:CGSizeMake(999999.0f, NAV_BAR_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil].size;
    CGRect buttonFrame = CGRectZero;
    
    buttonFrame = CGRectMake(0, 0, titleSize.width, 44);
    
    button = [[UIButton alloc] initWithFrame:buttonFrame];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.hidden = hide;
    [button setTitle:name forState:UIControlStateNormal];
    
    [self showBarButton:position button:button];
    
}

- (void)showBarButton:(EzNavigationBar)position title:(NSString *)name fontColor:(UIColor *)color font:(UIFont *)f hide:(BOOL)hide{
    
    UIButton *button ;
    CGSize titleSize = [name boundingRectWithSize:CGSizeMake(999999.0f, NAV_BAR_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil].size;
    CGRect buttonFrame = CGRectZero;
    
    buttonFrame = CGRectMake(0, 0, titleSize.width, 44);
    
    button = [[UIButton alloc] initWithFrame:buttonFrame];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = f;
    [button setTitleColor:color forState:UIControlStateNormal];
    button.hidden = hide;
    [button setTitle:name forState:UIControlStateNormal];
    
    [self showBarButton:position button:button];
    
}


- (void)showBarButton:(EzNavigationBar)position imageName:(NSString *)imageName{
    
    UIButton *button ;
    UIImage* image = [UIImage imageNamed:imageName];
    CGRect buttonFrame = CGRectZero;
    
    buttonFrame = CGRectMake(0, 0, image.size.width, NAV_BAR_HEIGHT);
    if ( buttonFrame.size.width < NAV_BUTTON_MIN_WIDTH ){
        buttonFrame.size.width = NAV_BUTTON_MIN_WIDTH;
    }
    
    if ( buttonFrame.size.height < NAV_BUTTON_MIN_HEIGHT ){
        buttonFrame.size.height = NAV_BUTTON_MIN_HEIGHT;
    }
    button = [[UIButton alloc] initWithFrame:buttonFrame];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:image forState:UIControlStateNormal];
    
    [self showBarButton:position button:button];
    
}

- (void)showBarButton:(EzNavigationBar)position button:(UIButton *)button
{
    
    if (NAV_LEFT == position) {
        [button addTarget:self action:@selector(doLeftButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }else if (NAV_RIGHT == position){
        [button addTarget:self action:@selector(doRightButtonTouch) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    }
    
    
}

- (void)setTitleView:(UIView *)titleView{
    
     self.navigationItem.titleView = titleView;
}

- (void) setNavTitle:(NSString*) navTitle{
    
    // 修改居中问题
    
    CGSize titleSize =self.navigationController.navigationBar.bounds.size;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, titleSize.width/2,titleSize.height)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor =[UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text=navTitle;
    label.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:19];
    self.navigationItem.titleView=label;
    
}

- (void)setleftItem:(NSString *)Title
{
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = Title;
    self.navigationItem.backBarButtonItem = backbutton;
    
}

//  返回

- (void)BackButtion{
    self.tabBarController.tabBar.hidden= NO;
    NSArray *array = self.navigationController.viewControllers;
    self.navigationItem.backBarButtonItem= nil;
    if (array.count > 1) {
        UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftbutton.frame = CGRectMake(0, 0, 30, 30);
        [leftbutton setTitleEdgeInsets:UIEdgeInsetsMake(-1, -18, 0, 0)];
        [leftbutton setImageEdgeInsets:UIEdgeInsetsMake(-1, -18, 0, 0)];
        [leftbutton setImage:[UIImage imageNamed:@"home_back"] forState:UIControlStateNormal];
        self.tabBarController.tabBar.hidden= YES;
        [self showBarButton:NAV_LEFT button:leftbutton];
    }
    
    
}
//*****************************************************方法****************************************

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)dealloc {
    self.navigationController.delegate = nil;
}

@end
