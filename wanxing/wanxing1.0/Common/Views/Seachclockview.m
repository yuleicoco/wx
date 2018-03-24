
//
//  Seachclockview.m
//  wanxing
//
//  Created by osyu on 2018/3/24.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "Seachclockview.h"

static NSString * searchid = @"searchid";

@implementation Seachclockview
@synthesize SearchTab;
@synthesize btnch;
@synthesize textField;
@synthesize pullTab;



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
            make.height.equalTo(@133);
        }];
        
        UILabel * lby =[UILabel new];
        lby.font  = Ping_R(14);
        lby.text = NSLocalizedString(@"clock_pro", nil);
        [self addSubview:lby];
        [lby mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(22);
            make.top.equalTo(self).offset(27);
            make.size.mas_equalTo(CGSizeMake(30, 13.5));
        }];
        
        btnch =[UIButton new];
        [btnch setBackgroundImage:[UIImage imageNamed:@"do_log_box"] forState:UIControlStateNormal];
        [btnch setTitle:@"软件部" forState:UIControlStateNormal];
        btnch.titleLabel.font =Ping_R(14);
        [btnch setTitleColor:Gray_color_b forState:UIControlStateNormal];
        [btnch addTarget:self action:@selector(pullbtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnch];
    
        [btnch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lby.mas_right).offset(9);
            make.top.equalTo(self).offset(19);
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
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(121, 36));
            make.top.equalTo(btnch.mas_bottom).offset(31);
        }];
        
        pullTab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        pullTab.backgroundColor = [UIColor whiteColor];
        pullTab.hidden = YES;
        pullTab.userInteractionEnabled = YES;
        pullTab.layer.borderWidth =0.5;
        pullTab.layer.borderColor = Gray_color_tt.CGColor;
        pullTab.separatorInset = UIEdgeInsetsZero;
        pullTab.layoutMargins = UIEdgeInsetsZero;
        [self addSubview:pullTab];
        [pullTab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnch.mas_bottom).offset(0);
            make.centerX.equalTo(btnch);
            make.size.mas_equalTo(CGSizeMake(125, 180));

        }];
        
     
        
        UILabel * lbm =[UILabel new];
        lbm.font  = Ping_R(14);
        lbm.text = NSLocalizedString(@"clock_name", nil);
        [self addSubview:lbm];
        [lbm mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnch.mas_right).offset(16);
            make.top.equalTo(self).offset(27);
            make.size.mas_equalTo(CGSizeMake(30, 15));
        }];
        
        UITextField *textField = [UITextField new];
        
        textField.text = @"点击试试";
        textField.layer.borderWidth =0.5;
        textField.layer.cornerRadius =3;
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
  
      
        
      
        
       
        
        
        
    }
    
    return self;
    
}

-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    pullTab.hidden = YES;
    
}


#pragma MARK---------------------TAB协议^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- (void)pullbtn:(UIButton *)sender
{
    
    pullTab.hidden = NO;
    pullTab.delegate = self;
    pullTab.dataSource = self;
    [pullTab reloadData];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:pullTab.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = pullTab.bounds;
    maskLayer.path = maskPath.CGPath;
    pullTab.layer.mask = maskLayer;
    
    
    
    
}

- (void)Search_btn:(UIButton *)sender
{
    if (self.delegate) {
        [self.delegate Seacrch];
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
    pullTab.hidden = YES;
    
}

#pragma MARK---------------------text协议^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

/*
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSCharacterSet *cs;
    cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS]invertedSet];
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
    BOOL canChange = [string isEqualToString:filtered];
    return canChange;
   
}
*/

- (void)textFieldDidBeginEditing:(UITextField *)textField{
 
    
    
}


@end
