//
//  BaseTabViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseTabViewController.h"

@interface BaseTabViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTabViewController

//*****************************************************逻辑****************************************

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated
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













- (void)UpdataSource
{
    _dataSource =[[NSMutableArray alloc]init];
    _dicSource =[[NSMutableArray alloc]init];
    
    
}


//*****************************************************基类实现****************************************


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
