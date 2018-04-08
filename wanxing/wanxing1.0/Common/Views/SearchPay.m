//
//  SearchPay.m
//  wanxing
//
//  Created by osyu on 2018/4/8.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "SearchPay.h"

@implementation SearchPay
@synthesize tabda;
@synthesize btnch;
@synthesize btnNext;


- (instancetype)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.9];
        self.userInteractionEnabled = YES;
        
        UIView * bg =[UIView new];
        bg.backgroundColor = [UIColor whiteColor];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.right.left.equalTo(self).offset(0);
            make.height.equalTo(@182);
        }];
        
        UILabel * lab =[UILabel new];
        lab.text =@"项目名称";
        lab.font = Ping_R(14);
        lab.textColor = Gray_color_55;
        [bg addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bg).offset(17);
            make.size.mas_equalTo(CGSizeMake(58, 13));
            make.top.equalTo(bg).offset(25);
            
        }];
        
        UILabel * labOne =[UILabel new];
        labOne.text =@"分包单位";
        labOne.font = Ping_R(14);
        labOne.textColor = Gray_color_55;
        [bg addSubview:labOne];
        
        [labOne mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(bg).offset(17);
              make.size.mas_equalTo(CGSizeMake(58, 13));
              make.top.equalTo(lab.mas_bottom).offset(34);
        }];
        
        btnch =[UIButton new];
        [btnch setBackgroundImage:[UIImage imageNamed:@"search_box"] forState:UIControlStateNormal];
        [btnch setTitle:@"重庆川仪项目" forState:UIControlStateNormal];
        btnch.titleLabel.font =Ping_R(14);
        [btnch setTitleColor:Gray_color_b forState:UIControlStateNormal];
        [btnch addTarget:self action:@selector(pullbtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnch];
        
        [btnch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lab.mas_right).offset(9);
            make.centerY.equalTo(lab);
            make.size.mas_equalTo(CGSizeMake(275, 33));
        }];
        
        UIButton * SraBtn =[UIButton new];
        [SraBtn addTarget:self action:@selector(Search_btn:) forControlEvents:UIControlEventTouchUpInside];
        [SraBtn setTitle:NSLocalizedString(@"clock_search", nil) forState:UIControlStateNormal];
        [SraBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
        SraBtn.titleLabel.font = Ping_B(14);
        SraBtn.backgroundColor = Green_color;
        [self addSubview:SraBtn];
        [SraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(labOne.mas_bottom).offset(41);
            make.size.mas_equalTo(CGSizeMake(121, 36));
            make.centerX.equalTo(self);
        }];
        
         btnNext =[UIButton new];
        [btnNext setBackgroundImage:[UIImage imageNamed:@"search_box"] forState:UIControlStateNormal];
        [btnNext setTitle:@"山岳第二建设集团" forState:UIControlStateNormal];
        btnNext.titleLabel.font =Ping_R(14);
        [btnNext setTitleColor:Gray_color_b forState:UIControlStateNormal];
        [btnNext addTarget:self action:@selector(pullbtnTW:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnNext];
        
        [btnNext mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labOne.mas_right).offset(9);
            make.centerY.equalTo(labOne);
            make.size.mas_equalTo(CGSizeMake(275, 33));
        }];
        
        
        tabda = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tabda.backgroundColor = [UIColor whiteColor];
        tabda.hidden = YES;
        tabda.userInteractionEnabled = YES;
        tabda.layer.borderWidth =0.5;
        tabda.layer.borderColor = Gray_color_tt.CGColor;
        tabda.separatorInset = UIEdgeInsetsZero;
        tabda.layoutMargins = UIEdgeInsetsZero;
        [self addSubview:tabda];
        [tabda mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnch.mas_bottom).offset(0);
            make.centerX.equalTo(btnch);
            make.size.mas_equalTo(CGSizeMake(275, 180));
            
        }];
        
        
        
        
        
      
     
        
        
        
    }
    return self;
    
}

- (void)pullbtn:(UIButton *)sender
{
    [self PublicVoid];
    [tabda mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnch.mas_bottom).offset(0);
        make.centerX.equalTo(btnch);
        make.size.mas_equalTo(CGSizeMake(275, 180));
        
    }];
    
}

- (void)pullbtnTW:(UIButton *)sender
{
    
    [self PublicVoid];
    [tabda mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnNext.mas_bottom).offset(0);
        make.centerX.equalTo(btnNext);
        make.size.mas_equalTo(CGSizeMake(275, 180));
        
    }];
    
    
}

- (void)PublicVoid
{
    
    tabda.hidden = NO;
    tabda.delegate = self;
    tabda.dataSource = self;
    [tabda reloadData];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:tabda.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = tabda.bounds;
    maskLayer.path = maskPath.CGPath;
    tabda.layer.mask = maskLayer;
}


- (void)Search_btn:(UIButton *)sender
{
    
    if (self.delegate) {
        [self.delegate SeacrchVC];
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

#pragma MARK---------------------TAB协议^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 6;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.textLabel.text =@"     开发部";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor =[UIColor blackColor];
    cell.textLabel.font = Ping_R(14);
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}



// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    tabda.hidden = YES;
}
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    tabda.hidden = YES;
    
}

@end
