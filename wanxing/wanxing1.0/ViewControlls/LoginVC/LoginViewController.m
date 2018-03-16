//
//  LoginViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/16.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RegistAcViewController.h"
#import "ForgetPsViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self SetUpView];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated
     ];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)SetUpView
{
    // bg 公司
    UIImageView * Bgimage =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Login_bg"]];
    [self.view addSubview:Bgimage];
    [Bgimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(375, 266));
    }];
    // 输入框
  
        UITextField * InputTF=[[UITextField alloc]init];
        InputTF.placeholder =@"手机/用户名";
        InputTF.borderStyle = UITextBorderStyleRoundedRect;
        InputTF.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
        InputTF.layer.borderColor =[UIColor grayColor].CGColor;
        [self.view addSubview:InputTF];
    
    
    
    // 设置左边图片
    UIImageView * leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (InputTF.frame.size.height - 20)*0.5, 40, 26)];
    leftImageView.image = [UIImage imageNamed:@"Login_user"];
    leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    [InputTF setLeftView:leftImageView];
    InputTF.leftViewMode = UITextFieldViewModeAlways;

    
    [InputTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Bgimage.mas_bottom).offset(51);
        make.size.mas_equalTo(CGSizeMake(325, 47));
        make.left.equalTo(self.view).offset(25);
        
    }];
    
    UITextField * InputPSTF=[[UITextField alloc]init];
    InputPSTF.placeholder =@"密码";
    InputPSTF.borderStyle = UITextBorderStyleRoundedRect;
    InputPSTF.layer.borderColor =[UIColor grayColor].CGColor;
    [self.view addSubview:InputPSTF];
    
    // 设置左边图片
    UIImageView * leftPSImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 16, 42, 30)];
    leftPSImageView.image = [UIImage imageNamed:@"Login_ps"];
    leftPSImageView.contentMode = UIViewContentModeScaleAspectFit;
    [InputPSTF setLeftView:leftPSImageView];
    InputPSTF.leftViewMode = UITextFieldViewModeAlways;
    
    
    [InputPSTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(InputTF.mas_bottom).offset(21);
        make.size.mas_equalTo(CGSizeMake(325, 47));
        make.left.equalTo(self.view).offset(25);
        
    }];
    
    
    UIButton * LoginBtn =[[UIButton alloc]init];
    LoginBtn.backgroundColor = RGB(257, 130, 77);
    [LoginBtn setTitle:NSLocalizedString(@"Login_btn",nil) forState:UIControlStateNormal];
    LoginBtn.layer.masksToBounds = YES;
    LoginBtn.layer.cornerRadius =5;
    [LoginBtn addTarget:self action:@selector(Login_btn_Touch) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:LoginBtn];
  
    [LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(InputPSTF.mas_bottom).offset(75);
        make.size.mas_equalTo(CGSizeMake(325, 47));
        make.left.equalTo(self.view).offset(25);
    }];
    
    UIButton * ResBtn =[[UIButton alloc]init];
    [ResBtn addTarget:self action:@selector(Res_btn_Touch) forControlEvents:UIControlEventTouchUpInside];
    [ResBtn setImage:[UIImage imageNamed:@"Login_reg"] forState:UIControlStateNormal];
    [self.view addSubview:ResBtn];
    
    [ResBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(LoginBtn.mas_bottom).offset(23);
        make.left.equalTo(self.view).offset(39);
        make.size.mas_equalTo(CGSizeMake(67,12 ));
        
        
    }];
    
    
    UIButton * ForBtn =[[UIButton alloc]init];
    
    [ForBtn addTarget:self action:@selector(For_btn_Touch) forControlEvents:UIControlEventTouchUpInside];
    [ForBtn setImage:[UIImage imageNamed:@"Login_for"] forState:UIControlStateNormal];
    [self.view addSubview:ForBtn];
    
    [ForBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(LoginBtn.mas_bottom).offset(23);
        make.left.equalTo(ResBtn.mas_right).offset(163);
        make.size.mas_equalTo(CGSizeMake(68,14 ));
        
    }];
    
    
    

}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
  //  self.navigationController.navigationBarHidden = NO;
    
}



// 点击登录
- (void)Login_btn_Touch
{
    FuckLog(@"sd");
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLoginStateChange object:@YES];
    
}
// 忘记密码
-  (void)For_btn_Touch
{
    ForgetPsViewController * foVC =[[ForgetPsViewController alloc]init];
    [self.navigationController pushViewController:foVC animated:YES];
    
    
}


// 注册账号

- (void)Res_btn_Touch
{
    RegistAcViewController * ReVC =[[RegistAcViewController alloc]init];
    [self.navigationController pushViewController:ReVC animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
