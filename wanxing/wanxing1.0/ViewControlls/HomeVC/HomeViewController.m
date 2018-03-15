//
//  HomeViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)NSMutableArray * imageArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
   
    [self setNavTitle:NSLocalizedString(@"home_title", nil)];
    [self showBarButton:NAV_RIGHT imageName:@"home_nav"];
    [self InitScView];
    
}

-(void)SetupData
{
    _imageArr =[[NSMutableArray alloc]init];
    
    for (NSInteger i = 1; i < 5; i++) {
        
        [self.imageArr addObject:[NSString stringWithFormat:@"home_vc_bg%ld.jpg",i]];
    }
    
}

// 滚动
#pragma  Mark -Scrolview

- (void)InitScView
{
    
    UIScrollView *verticalScrollView = [[UIScrollView alloc] init];
    verticalScrollView.backgroundColor = [UIColor greenColor];
    verticalScrollView.pagingEnabled = YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:verticalScrollView];
    
    //*********************** Mansoy***************
    
     UIView *currentView = verticalScrollView;
    // 水平方向滚动视图
    UIScrollView *horizontalScrollView = [[UIScrollView alloc] init];
    horizontalScrollView.pagingEnabled = YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:horizontalScrollView];
    
    [horizontalScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(currentView.mas_bottom).offset(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(currentView.mas_bottom).offset(175);
    }];
    
    // 设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    UIView *horizontalContainerView = [[UIView alloc] init];
    [horizontalScrollView addSubview:horizontalContainerView];
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(horizontalScrollView);
        make.height.equalTo(horizontalScrollView);
    }];
    //过渡视图添加子视图
    UIView *previousView = nil;
    for (int i = 0; i < 3; i++)
    {
        UIImageView * BGview = [[UIImageView alloc] init];
        [BGview setImage:[UIImage imageNamed:@"home_vc_bg"]];
        
        // 添加到父视图，并设置过渡视图中子视图的约束
        [horizontalContainerView addSubview:BGview];
        
        [BGview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.equalTo(horizontalContainerView);
            make.width.equalTo(horizontalScrollView);
            
            if (previousView)
            {
                make.left.mas_equalTo(previousView.mas_right);
            }
            else
            {
                make.left.mas_equalTo(0);
            }
        }];
        
        previousView = BGview;
    }
    // 设置过渡视图的右距（此设置将影响到scrollView的contentSize）
    [horizontalContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(previousView.mas_right);
    }];
}
    
    
    
    
    //*********************** Mansoy***************


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
