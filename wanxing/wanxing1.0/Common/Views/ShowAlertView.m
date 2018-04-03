//
//  ShowAlertView.m
//  wanxing
//
//  Created by osyu on 2018/3/17.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ShowAlertView.h"

@implementation ShowAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.9];
        UIView * MBview =[[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:MBview];
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"single_box@2x"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];        
        UIView * DateChoose =[[UIView alloc]init];
        DateChoose.layer.contents =(id)image.CGImage;
        [self addSubview:DateChoose];
        
        [DateChoose mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.centerY.equalTo(self).offset(-40);
            make.size.mas_equalTo(CGSizeMake(313, 199));
            
        }];
        
        UILabel * lab =[UILabel new];
        lab.text =@"温馨提示";
        lab.font = Ping_B(16);
        lab.textColor =[UIColor whiteColor];
        lab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.equalTo(DateChoose).offset(13);
            make.size.mas_equalTo(CGSizeMake(73, 16));
            
        }];
        
        UIButton * btn =[UIButton new];
        [btn addTarget:self action:@selector(Dele_btn) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"single_de"] forState:UIControlStateNormal];
        [DateChoose addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(DateChoose).offset(13);
            make.right.equalTo(DateChoose).offset(-14);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            
        }];
        
        
        UITextView * lbin =[UITextView new];
        lbin.font = Ping_R(14);
        lbin.textColor = RGB(68, 68, 68);
        lbin.text =@"您好红富豪我厚爱哦啊花覅还好哦啊啊回复哈华哈佛你还会发货阿发包方把发好hi噢好囧好啊胡奥上次还哦好";
        [self addSubview:lbin];
        
        
        [lbin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(DateChoose).offset(58);
            make.left.equalTo(DateChoose).offset(29);
            make.size.mas_equalTo(CGSizeMake(251, 45));
        }];
        
        
        NSMutableArray * arr =[NSMutableArray new];
        for (NSInteger i = 0; i<2; i++) {
            UIButton * btn =[UIButton new];
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 5;
            btn.tag = 99999+i;
            if (i == 0) {
                btn.backgroundColor = Orange_color;
                [btn setTitle:NSLocalizedString(@"main_sure",nil) forState:UIControlStateNormal];
                
            }else{
                btn.backgroundColor = Green_color;
                [btn setTitle:NSLocalizedString(@"main_cancel", nil) forState:UIControlStateNormal];
            }
            
            [btn addTarget:self action:@selector(Touch:) forControlEvents:UIControlEventTouchUpInside];
            [arr addObject:btn];
            [DateChoose addSubview:btn];
        }
        
        [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:19 leadSpacing:25 tailSpacing:31];
        [arr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(DateChoose.mas_bottom).offset(-25);
            make.height.equalTo(@39);
        }];
        
        
    }
    return self;
    
    
}


- (void)Dele_btn
{
    
    if (self.delegate) {
        
        [self.delegate DeleBox];
    }
    
    
}

- (void)Touch:(UIButton *)sender
{
    NSInteger  i = sender.tag -99999;
    
    if (self.delegate) {
        if (i == 0) {
            [self.delegate SureS];
            NSLog(@"11");
        }else
        {
            NSLog(@"22");
            [self.delegate SureS];
        }
    }
    
}


@end
