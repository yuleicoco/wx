//
//  HomeViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "HomeViewController.h"
#import "DoLogViewController.h"
#import "HouseViewController.h"
#import "CenterViewController.h"
#import "ProViewController.h"




@interface HomeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)NSMutableArray * imageArr;
@property(nonatomic,strong)NSMutableArray * BtnArr;
@property(nonatomic,strong)NSMutableArray * TextArr;
@property(nonatomic,strong)NSMutableArray * LbArr;
@property(nonatomic,strong)UIScrollView *verticalScrollView;
@property(nonatomic,strong)DoLogViewController * LogVC ;
@property(nonatomic,strong)ProViewController * proVC ;
@property(nonatomic,strong)HouseViewController * HouseVC ;
@property(nonatomic,strong)CenterViewController * centerVC ;




@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.view.backgroundColor =[UIColor whiteColor] ;
    [self setNavTitle:NSLocalizedString(@"home_title", nil)];
    [self showBarButton:NAV_RIGHT imageName:@"home_nav"];
    [self InitScView];
    
}

-(void)SetupData
{
    _imageArr =[[NSMutableArray alloc]initWithObjects:@"home_btn_do_log",@"home_btn_pro",@"home_btn_house",@"home_btn_center", nil];
    _TextArr =[[NSMutableArray alloc]initWithObjects:NSLocalizedString(@"home_tab_log", nil),NSLocalizedString(@"home_tab_pro", nil),NSLocalizedString(@"home_tab_housue", nil),NSLocalizedString(@"home_tab_center", nil), nil];

    
}



-(void)SetupView
{
    
    
    // 4个功能键
    for (NSInteger i = 0; i<4; i++) {
        UIButton * btnF =[[UIButton alloc]init];
        [btnF setImage:[UIImage imageNamed:_imageArr[i]] forState:UIControlStateNormal];
        [btnF addTarget:self action:@selector(BtnF_ToucH:) forControlEvents:UIControlEventTouchUpInside];
        btnF.tag = 2000+i;
        [self.BtnArr addObject:btnF];
        [self.view addSubview:btnF];
        
    }
    
    [_BtnArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:51 leadSpacing:26 tailSpacing:22];
    [_BtnArr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@195);
        make.height.equalTo(@41);
    }];
    
    // 字体
    
    for (NSInteger i = 0; i<4; i++) {
        UILabel * lbaF =[[UILabel alloc]init];
        lbaF.text =_TextArr[i];
        lbaF.textColor =RGB(140, 140, 140);
        lbaF.font =[UIFont fontWithName:@"PingFangSC-Regular" size:15];
        [self.LbArr addObject:lbaF];
        [self.view addSubview:lbaF];
    }
    
    
    [self.LbArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:31 leadSpacing:17 tailSpacing:15
     ];
    
    [self.LbArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@243);
        make.height.equalTo(@14);
    }];
    
    UILabel * lineb =[UILabel new];
    lineb.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lineb];
    
    [lineb mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.and.right.equalTo(self.view).offset(0);
        make.height.equalTo(@5);
        make.top.equalTo(self.view).offset(277);
    }];

    
}


// f
- (void)BtnF_ToucH:(UIButton *)Buttonf
{
    NSInteger i =  Buttonf.tag -2000;

    
    
    switch (i) {
            
        case 0:
           [self.navigationController pushViewController:self.LogVC animated:YES];
        
            break;
        case 1:
            [self.navigationController pushViewController:self.proVC animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:self.HouseVC animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:self.centerVC animated:YES];
            break;
            
        default:
            break;
    }

    
    
}




// 滚动
#pragma  Mark -Scrolview

- (void)InitScView
{
    
    _verticalScrollView = [[UIScrollView alloc] init];
    _verticalScrollView.backgroundColor = [UIColor greenColor];
    _verticalScrollView.pagingEnabled = YES;
    // 添加scrollView添加到父视图，并设置其约束
    [self.view addSubview:_verticalScrollView];
    
    //*********************** Mansoy***************
    
     UIView *currentView = _verticalScrollView;
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


#pragma mark - Get and Set
- (NSMutableArray *)imageArr{
    if (_imageArr == nil) {
        _imageArr = [[NSMutableArray alloc] init];
    }
    return _imageArr;
}

- (NSMutableArray *)BtnArr{
    if (_BtnArr == nil) {
        _BtnArr = [[NSMutableArray alloc] init];
    }
    return _BtnArr;
}

- (NSMutableArray *)TextArr{
    if (_TextArr == nil) {
        _TextArr = [[NSMutableArray alloc] init];
    }
    return _TextArr;
}

- (NSMutableArray *)LbArr{
    if (_LbArr == nil) {
        _LbArr = [[NSMutableArray alloc] init];
    }
    return _LbArr;
}

- (DoLogViewController *)LogVC{
    if (_LogVC == nil) {
        _LogVC = [[DoLogViewController alloc] init];
    }
    return _LogVC;
}

- (ProViewController *)proVC{
    if (_proVC == nil) {
        _proVC = [[ProViewController alloc] init];
    }
    return _proVC;
}

- (HouseViewController *)HouseVC{
    if (_HouseVC == nil) {
        _HouseVC = [[HouseViewController alloc] init];
    }
    return _HouseVC;
}

- (CenterViewController *)centerVC{
    if (_centerVC == nil) {
        _centerVC = [[CenterViewController alloc] init];
    }
    return _centerVC;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
