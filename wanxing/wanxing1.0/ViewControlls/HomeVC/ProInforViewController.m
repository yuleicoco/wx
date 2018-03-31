//
//  ProInforViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ProInforViewController.h"

@interface ProInforViewController ()

@property(nonatomic,strong)NSMutableArray * arr;
@property(nonatomic,strong)NSMutableArray * arrLb;
@property(nonatomic,strong)NSMutableArray * arrLine;
@property(nonatomic,strong)NSMutableArray * datalbArr;
@end

@implementation ProInforViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setNavTitle:@"xxx计划"];
}

- (void)SetupView
{
    [super SetupView];
    
    
    self.arr =[[NSMutableArray alloc]initWithObjects:@"项目名称",@"计划用时",@"实际用时",@"负责人", nil];
    for (NSInteger i = 0; i<4; i++) {
        // 文字
        UILabel * lb =[UILabel new];
        lb.text = self.arr[i];
        lb.textColor = RGB(47, 47, 47);
        lb.font = Ping_R(16);
        [self.arrLb addObject:lb];
        [self.view addSubview:lb];
        // 线条
        UILabel * lbline =[UILabel new];
        [lbline setBackgroundColor:Gray_color_uibrother];
        [self.arrLine addObject:lbline];
        [self.view addSubview:lbline];
        
        UILabel * datalb =[UILabel new];
        datalb.font = Ping_R(16);
        datalb.tag = 8866+i;
        datalb.text =@"asffaaa";
        datalb.textColor = Gray_color_tt;
        [self.datalbArr addObject:datalb];
        [self.view addSubview:datalb];
        
        
        
    }
    
    
    [self.datalbArr mas_distributeViewsAlongAxis: MASAxisTypeVertical withFixedSpacing:39 leadSpacing:20.5 tailSpacing:400];
    [self.datalbArr mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(95);
        make.width.equalTo(@125);
    }];
    
    
    
    [self.arrLb mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:39 leadSpacing:20.5 tailSpacing:400];
    [self.arrLb mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(11);
        make.width.equalTo(@125);
        
    }];
    
    [self.arrLine mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:55 leadSpacing:55 tailSpacing:380];
    [self.arrLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(9);
        make.right.equalTo(self.view).offset(-9);
    }];
    
    UILabel * line =[UILabel new];
    line.backgroundColor = Gray_color_uibrother;
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(221);
        make.left.and.right.equalTo(self.view).offset(0);
        make.height.equalTo(@5);
        
    }];
    
    
    
    
    UILabel * lbl =[UILabel new];
    lbl.text = @"备注内容";
    lbl.textColor = RGB(47, 47, 47);
    lbl.font = Ping_R(17);
    [self.view addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(11);
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.top.equalTo(line.mas_bottom).offset(16);
        
    }];
    
    UITextView * textView =[UITextView new];
    
    textView.layer.borderColor = Gray_color_uibrother.CGColor;
    textView.layer.borderWidth = 1;
    textView.layer.cornerRadius =5;
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).offset(6);
        make.left.equalTo(lbl.mas_right).offset(12);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@100);
        
    }];
    textView.placeholder =@"请填写备注";
    textView.limitLength =[NSNumber numberWithInteger:200];
    
    
    
    
}

#pragma mark - Get and Set
- (NSMutableArray *)datalbArr{
    if (_datalbArr == nil) {
        _datalbArr = [[NSMutableArray alloc] init];
    }
    return _datalbArr;
}

- (NSMutableArray *)arrLb{
    if (_arrLb == nil) {
        _arrLb = [[NSMutableArray alloc] init];
    }
    return _arrLb;
}

- (NSMutableArray *)arrLine{
    if (_arrLine == nil) {
        _arrLine = [[NSMutableArray alloc] init];
    }
    return _arrLine;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
