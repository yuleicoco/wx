//
//  RegistAcViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/16.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "RegistAcViewController.h"

@interface RegistAcViewController ()

@end

@implementation RegistAcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupView];
   
}



- (void)SetupView
{
    // bg 公司
    UIImageView * Bgimage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Login_bg"]];
    [self.view addSubview:Bgimage];
    [Bgimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(375, 266));
    }];
    
    NSArray * ar =[[NSArray alloc]initWithObjects:NSLocalizedString(@"Regist_use", nil),
                   NSLocalizedString(@"Regist_ps", nil),NSLocalizedString(@"Regist_agps", nil), nil];
    
    // 3个 用户名 密码  确认密码
    NSMutableArray *array = [NSMutableArray new];
    for (NSInteger i =0; i<3; i++) {
        UILabel * ThrLb =[[UILabel alloc]init];
        ThrLb.tag = 1000+i;
        ThrLb.text =ar[i];
        ThrLb.font =[UIFont fontWithName:@"PingFangSC-Regular" size:28];
        [self.view addSubview:ThrLb];
        [array addObject:ThrLb];
        
    }
    
    [array mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:25 leadSpacing:301 tailSpacing:250];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@27);
        
    }];
    
    
    
    // 3个 输入框
    for (NSInteger i = 0; i<3; i++) {
        
        UITextField * InputTF =[[UITextField alloc]init];
        InputTF.tag = 1500+i;
        [self.view addSubview:InputTF];
        
        
    }
    
    
    // 注册
    UIButton * Re_btn =[[UIButton alloc]init];
    
    [Re_btn addTarget:self action:@selector(Re_btn_Touch) forControlEvents:UIControlEventTouchUpInside];
    [Re_btn setTitle:NSLocalizedString(@"Regist_reg", nil) forState:UIControlStateNormal];
    Re_btn.backgroundColor = OrangerCol;
    [self.view addSubview:Re_btn];
    
    [Re_btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(LoginBtn.mas_bottom).offset(23);
//        make.left.equalTo(ResBtn.mas_right).offset(163);
          make.size.mas_equalTo(CGSizeMake(325,47 ));
        
    }];
    
    
}

// 注册点击
- (void)Re_btn_Touch
{
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated
     ];
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.delegate = nil;
    
    
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
