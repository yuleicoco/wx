//
//  WorkViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "WorkViewController.h"
#import "ClockViewController.h"

@interface WorkViewController ()
@property (nonatomic,strong)NSMutableArray * arrImage;

@property (nonatomic,strong)UILabel * numLB;
@property (nonatomic,strong)UILabel * lateLB;
@property(nonatomic,strong)UILabel * relaxLB;

@end

@implementation WorkViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self setNavTitle:NSLocalizedString(@"tabWork", nil)];
}

 - (void)SetupData
{
    [super SetupData];
    
    self.arrImage =[ [NSMutableArray alloc]initWithObjects:@"work_open" ,@"work_relax",@"work_search", nil];
    
    
}


- (void)SetupView
{
    [super SetupView];
    
    
    UILabel * line =[UILabel new];
    line.backgroundColor =Gray_color_uibrother;
    [self.view addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view).offset(0);
        make.height.equalTo(@5);
        
    }];
    
    
    NSMutableArray * arr =[NSMutableArray new];
    
    for (NSInteger i = 0; i<3; i++) {
        
        
        UIImageView * imageb =[UIImageView new];
        imageb.image =[UIImage imageNamed:self.arrImage[i]];
        imageb.userInteractionEnabled = YES;
        imageb.tag = 7777+i;
        
        UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        click.numberOfTapsRequired = 1;
        click.numberOfTouchesRequired = 1;
        [imageb addGestureRecognizer:click];
        [arr addObject:imageb];
        if (i == 0) {
            self.numLB =[UILabel new];
            self.numLB.text = @"本月打卡数: 23次";
            self.numLB.font =Ping_R(13);
            self.numLB.textColor =RGB(159, 225, 249);
            [imageb addSubview:self.numLB];
        }else if (i == 1)
        {
            self.lateLB =[UILabel new];
            self.lateLB.font =Ping_R(13);
            self.lateLB.textColor =RGB(159, 225, 249);
            self.lateLB.text = @"迟到: 23次";
            [imageb addSubview:self.lateLB];
        }else
        {
            self.relaxLB =[UILabel new];
            self.relaxLB.font =Ping_R(13);
            self.relaxLB.textColor =RGB(173, 244, 248);
            self.relaxLB.text = @"本月请假: 23次";
            [imageb addSubview:self.relaxLB];
            
            
        }
        [self.view addSubview:imageb];
    }
    
    [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:6 leadSpacing:20 tailSpacing:220];
    [arr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(8);
        make.width.equalTo(@359);
        
    }];
    
    [self.numLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(39);
        make.top.equalTo(self.view).offset(79);
        make.size.mas_equalTo(CGSizeMake(130 ,12 ));
        
    }];
    
    [self.lateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(39);
        make.top.equalTo(self.numLB.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(130 ,12 ));
        
    }];
    
    [self.relaxLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(39);
        make.top.equalTo(self.view).offset(215);
        make.size.mas_equalTo(CGSizeMake(130 ,12 ));
        
    }];
    
    
    
    
    
    
    
}

#pragma UIGestureRecognizer Handles
-(void) handleTap:(UITapGestureRecognizer *)recognizer
{
    NSInteger index = recognizer.view.tag -7777;
    
    switch (index) {
        case 0:
            [self PushClo];
            break;
            
        case 1:
             NSLog(@"点击第2个");
            break;
        case 2:
             NSLog(@"点击第3个");
            break;
        default:
            break;
    }
 
}

- (void)PushClo
{
    ClockViewController * vc =[[ClockViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
