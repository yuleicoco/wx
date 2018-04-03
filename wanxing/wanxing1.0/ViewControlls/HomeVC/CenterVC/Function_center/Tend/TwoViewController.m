//
//  TwoViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "TwoViewController.h"
#import "LookViewImage.h"

@interface TwoViewController ()<CollectionviewDelegate>

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    
    
}

- (void)SetupView
{
    [super SetupView];
    
    UILabel * lb =[UILabel new];
    lb.font = Ping_R(16);
    lb.textColor = Gray_color_47;
    lb.text =@"附件内容";
    [self.view addSubview:lb];
    
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.top.equalTo(self.view).offset(15);
        make.size.mas_equalTo(CGSizeMake(65, 15));
    }];
    
    collectionView *vc =[[collectionView alloc]init];
    vc.delegate = self;
    [self.view addSubview:vc];
    
    [vc mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(lb.mas_right).offset(9);
        make.top.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-13);
        make.height.equalTo(@125);
        
        
    }];
    
    
}

- (void)lookImage
{
    
    NSMutableArray * arr =[[NSMutableArray alloc]initWithObjects:@"test11",@"test11",nil];
    LookViewImage * im =[[LookViewImage alloc]init];
    im.dataArray = arr;
    [self.navigationController pushViewController:im animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
