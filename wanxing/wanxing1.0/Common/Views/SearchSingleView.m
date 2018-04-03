
//
//  SearchSingleView.m
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "SearchSingleView.h"
static NSString * searchid = @"searchsinid";
@implementation SearchSingleView
@synthesize proTab;
@synthesize shenTab;


- (instancetype)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.9];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tap1.cancelsTouchesInView = NO;
        [self addGestureRecognizer:tap1];
        
        
        UIView * bg =[UIView new];
        bg.backgroundColor = [UIColor whiteColor];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.right.left.equalTo(self).offset(0);
            make.height.equalTo(@182);
        }];
        
        UILabel * lbm =[UILabel new];
        lbm.font  = Ping_R(13);
        lbm.text = NSLocalizedString(@"me_vc_word", nil);
        [self addSubview:lbm];
        [lbm mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(16);
            make.top.equalTo(self).offset(29);
            make.size.mas_equalTo(CGSizeMake(40, 13));
        }];
        
        UITextField *textField = [UITextField new];
        textField.text = @"点击试试";
        textField.layer.borderWidth =0.5;
        textField.layer.cornerRadius =2;
        textField.layer.borderColor =Gray_color_tt.CGColor;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.font = Ping_R(14);
        textField.delegate = self;
        [self addSubview:textField];
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbm.mas_right).offset(9);
            make.top.equalTo(self).offset(19);
            make.size.mas_equalTo(CGSizeMake(125, 30));
        }];
        
        
        UILabel * lby =[UILabel new];
        lby.font  = Ping_R(13);
        lby.text = NSLocalizedString(@"single_name", nil);
        [self addSubview:lby];
        [lby mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(textField.mas_right).offset(17);
            make.top.equalTo(self).offset(27);
            make.size.mas_equalTo(CGSizeMake(30, 13.5));
        }];
        
        
        UILabel * lbName =[UILabel new];
        lbName.layer.borderWidth =0.5;
        lbName.layer.cornerRadius =2;
        lbName.layer.borderColor =Gray_color_tt.CGColor;
        [self addSubview:lbName];
        
        [lbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-12);
            make.top.equalTo(self).offset(19);
            make.size.mas_equalTo(CGSizeMake(125, 30));
        }];
        
        
        
        
        UILabel * lbth =[UILabel new];
        lbth.font  = Ping_R(13);
        lbth.text = NSLocalizedString(@"clock_pro", nil);
        [self addSubview:lbth];
        [lbth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(16);
            make.top.equalTo(lbm.mas_bottom).offset(32);
            make.size.mas_equalTo(CGSizeMake(40, 13));
        }];
        
        
        
        UIButton * btnch =[UIButton new];
        [btnch setBackgroundImage:[UIImage imageNamed:@"do_log_box"] forState:UIControlStateNormal];
        [btnch setTitle:@"软件部" forState:UIControlStateNormal];
        btnch.titleLabel.font =Ping_R(14);
        [btnch setTitleColor:Gray_color_b forState:UIControlStateNormal];
        [btnch addTarget:self action:@selector(pullbtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnch];
        
        [btnch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbth.mas_right).offset(9);
            make.top.equalTo(textField.mas_bottom).offset(19);
            make.size.mas_equalTo(CGSizeMake(125, 30));
        }];
        
        UIButton * SraBtn =[UIButton new];
        [SraBtn addTarget:self action:@selector(Search_btn:) forControlEvents:UIControlEventTouchUpInside];
        [SraBtn setTitle:NSLocalizedString(@"clock_search", nil) forState:UIControlStateNormal];
        [SraBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];\
        SraBtn.titleLabel.font = Ping_B(14);
        SraBtn.backgroundColor = Green_color;
        [self addSubview:SraBtn];
        [SraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnch.mas_bottom).offset(31);
            make.size.mas_equalTo(CGSizeMake(121, 36));
            make.centerX.equalTo(self);
        }];
        
        
        
        proTab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        proTab.backgroundColor = [UIColor whiteColor];
        proTab.hidden = YES;
        proTab.userInteractionEnabled = YES;
        proTab.layer.borderWidth =0.5;
        proTab.layer.borderColor = Gray_color_tt.CGColor;
        proTab.separatorInset = UIEdgeInsetsZero;
        proTab.layoutMargins = UIEdgeInsetsZero;
        [self addSubview:proTab];
        [proTab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnch.mas_bottom).offset(0);
            make.centerX.equalTo(btnch);
            make.size.mas_equalTo(CGSizeMake(125, 180));
            
        }];
        
       
  
        UILabel * labexx =[UILabel new];
        labexx.font  = Ping_R(13);
        labexx.text = NSLocalizedString(@"single_shen", nil);
        [self addSubview:labexx];
        [labexx mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(lby);
            make.centerY.equalTo(btnch);
            make.size.mas_equalTo(CGSizeMake(30, 13.5));
            
        }];
        
        
        UIButton * btncht =[UIButton new];
        [btncht setBackgroundImage:[UIImage imageNamed:@"do_log_box"] forState:UIControlStateNormal];
        [btncht setTitle:@"尚未审核" forState:UIControlStateNormal];
        btncht.titleLabel.font =Ping_R(14);
        [btncht setTitleColor:Gray_color_b forState:UIControlStateNormal];
        [btncht addTarget:self action:@selector(pullbtnt:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btncht];
        
        [btncht mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-12);
            make.centerY.equalTo(lbth);
            make.size.mas_equalTo(CGSizeMake(125, 30));
        }];
        
        
       
        
        

        
      
    }
    return self;
    
}

- (void)pullbtn:(UIButton *)sender
{
    
    proTab.hidden = NO;
    proTab.delegate = self;
    proTab.dataSource = self;
    [proTab reloadData];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:proTab.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = proTab.bounds;
    maskLayer.path = maskPath.CGPath;
    proTab.layer.mask = maskLayer;
    
    
    
    
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
    FuckLog(@"3");
    proTab.hidden = YES;
    
}
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    proTab.hidden = YES;
    
}


@end
