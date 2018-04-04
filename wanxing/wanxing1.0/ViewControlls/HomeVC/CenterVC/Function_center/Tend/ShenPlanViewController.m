//
//  ShenPlanViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ShenPlanViewController.h"
#import "ShenAViewController.h"
#import "ShenBViewController.h"

@interface ShenPlanViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegare>
{
    NSMutableArray * arr;
    
}
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end

@implementation ShenPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self setNavTitle:@"申购计划单子"];
    [self showBarButton:NAV_RIGHT title:NSLocalizedString(@"single_shen", nil) fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
}
- (void)SetupView
{
    [super SetupView];
    
    ShenAViewController * oneVC =[[ShenAViewController alloc]init];
    ShenBViewController * twoVC =[[ShenBViewController alloc]init];
    
    NSArray *childArr = @[oneVC, twoVC];
    CGFloat contentViewHeight = self.view.frame.size.height - 50;
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, contentViewHeight) parentVC:self childVCs:childArr];
    _pageContentView.delegatePageContentView = self;
    [self.view addSubview:_pageContentView];
    
    NSArray * btnDataSource3 = @[@"项目信息", @"材料信息"];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50) delegate:self titleNames:btnDataSource3];
    [self.view addSubview:_pageTitleView];
    _pageTitleView.selectedIndex = 1;
    _pageTitleView.titleColorStateNormal = [UIColor lightGrayColor];
    _pageTitleView.titleColorStateSelected = RGB(9, 177, 239);
    _pageTitleView.indicatorColor =RGB(9, 177, 239);
    _pageTitleView.indicatorStyle = SGIndicatorTypeEqual;
}



- (void)SGPageTitleView:(SGPageTitleView *)SGPageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}

- (void)SGPageContentView:(SGPageContentView *)SGPageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
