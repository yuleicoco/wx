//
//  MeViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    UILabel *aLab = [[UILabel alloc]initWithFrame:CGRectMake(100,100,200,30)];
    NSString *balance =@"888888";
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"账户余额: %@元",balance]];
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor]range:NSMakeRange(0,2)];
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor]range:NSMakeRange(2,2)];
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]range:NSMakeRange(6, balance.length)];
    [aString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15]range:NSMakeRange(6, balance.length)];
    aLab.attributedText = aString;
    [self.view addSubview:aLab];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
