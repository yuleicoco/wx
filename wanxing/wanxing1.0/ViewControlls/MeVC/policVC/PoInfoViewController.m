//
//  PoInfoViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/28.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PoInfoViewController.h"

@interface PoInfoViewController ()

@end

@implementation PoInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"川仪项目预警"];
    [self showBarButton:NAV_RIGHT title:@"处理" fontColor:RGB(255, 255, 255) font:[UIFont fontWithName:@"PingFangSC-Regular" size:14] hide:NO];
    
    
}

- (void)SetupView
{
    [super SetupView];
    
   
    
    
    NSMutableArray * arr =[NSMutableArray arrayWithObjects:@"项目名称",@"预警类型",@"预警原因",@"距离到期",@"到期时间", nil];
    NSMutableArray * lbarr =[NSMutableArray new];
    NSMutableArray * linearr =[NSMutableArray new];
    NSMutableArray * datArr =[NSMutableArray new];
    for (NSInteger i = 0; i<5; i++) {
        UILabel * lb =[UILabel new];
        lb.font = Ping_R(17);
        lb.text =arr[i];
        [lbarr addObject:lb];
        [self.view addSubview:lb];
        
        
        UILabel * line =[UILabel new];
        line.backgroundColor = Gray_color_uibrother;
        [linearr addObject:line];
        [self.view addSubview:line];
        
        
        UILabel * datalb =[UILabel new];
        datalb.font = Ping_R(14);
        datalb.text =@"我不是黄蓉";
        if (i>2) {
            datalb.textColor =[UIColor redColor];
        }else{
        datalb.textColor =RGB(128, 128, 128);
        }
        [datArr addObject:datalb];
        [self.view addSubview:datalb];
    }
    
    [lbarr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:37 leadSpacing:20.5 tailSpacing:342];
    [lbarr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12);
        make.width.equalTo(@90);
    }];
    
    [linearr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:55 leadSpacing:55 tailSpacing:322];
    [linearr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view).offset(0);
    
    }];
    UILabel * lbt =[UILabel new];
    lbt.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:lbt];
    
    [lbt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@5);
        make.left.and.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-322);
        
    }];
    
    
    [datArr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:37 leadSpacing:20.5 tailSpacing:342];
    [datArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(94);
        make.width.equalTo(@90);
    }];
    
    
    UILabel * lbl =[UILabel new];
    lbl.text = @"备注内容";
    lbl.textColor = RGB(47, 47, 47);
    lbl.font = Ping_R(17);
    [self.view addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(11);
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.top.equalTo(lbt.mas_bottom).offset(13);
        
    }];
    
    UITextView * textView =[UITextView new];
    
    textView.layer.borderColor = Gray_color_uibrother.CGColor;
    textView.layer.borderWidth = 1;
    textView.layer.cornerRadius =5;
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lbt.mas_bottom).offset(6);
        make.left.equalTo(lbl.mas_right).offset(12);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@100);
        
    }];
    textView.placeholder =@"请填写备注";
    textView.limitLength =[NSNumber numberWithInteger:200];

    // tab
    self.tableView.hidden = YES;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(0);
        make.size.mas_equalTo(CGSizeMake(93, 66));
    }];
    
    
    
}
#pragma mark ---------tab

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 2;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 33;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.textLabel.text =@"不在提醒";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor =[UIColor whiteColor];
    cell.textLabel.font = Ping_R(14);
    cell.backgroundColor = RGB(9,177,239);
    
    
//    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
//    view_bg.backgroundColor = Gray_color_uibrother;
//    cell.selectedBackgroundView = view_bg;
    return cell;
    
    
}

-(void)doRightButtonTouch
{
   
    FuckLog(@"处理");
    self.tableView.hidden  = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
