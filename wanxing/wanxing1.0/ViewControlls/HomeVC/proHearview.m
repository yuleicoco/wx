
//
//  proHearview.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "proHearview.h"

@implementation proHearview

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        UILabel * lbone =[UILabel new];
        lbone.text = @"排序方式";
        lbone.font = Ping_R(16);
        lbone.textColor = Gray_color_b;
        [self addSubview:lbone];
        [lbone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(14);
            make.top.equalTo(self).offset(14);
            make.size.mas_equalTo(CGSizeMake(66, 15));
            
        }];
        
        UIButton *btnMess = [UIButton new];
        [btnMess setTitle:@"完成状态" forState:UIControlStateNormal];
        [btnMess setImage:[UIImage imageNamed:@"pro_vc_ups"] forState:UIControlStateNormal];
        [btnMess setImage:[UIImage imageNamed:@"pro_vc_ups"] forState:UIControlStateSelected];
        btnMess.adjustsImageWhenHighlighted = NO;
        btnMess.titleLabel.font =Ping_R(13);
        [btnMess setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnMess.imageEdgeInsets = UIEdgeInsetsMake(0, 54, 0, -54);
        btnMess.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 12);
        [btnMess addTarget:self action:@selector(message_btn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnMess];
        
        [btnMess mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(lbone);
            make.left.equalTo(lbone.mas_right).offset(80);
            make.size.mas_equalTo(CGSizeMake(75, 13));
        }];
        
        
        UIButton *TimeBnt = [UIButton new];
        [TimeBnt setTitle:@"时间排序" forState:UIControlStateNormal];
        [TimeBnt setImage:[UIImage imageNamed:@"pro_vc_up"] forState:UIControlStateNormal];
        [TimeBnt setImage:[UIImage imageNamed:@"pro_vc_up"] forState:UIControlStateSelected];
        TimeBnt.adjustsImageWhenHighlighted = NO;
        TimeBnt.titleLabel.font =Ping_R(13);
        [TimeBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        TimeBnt.imageEdgeInsets = UIEdgeInsetsMake(0, 54, 0, -54);
        TimeBnt.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 12);
        [TimeBnt addTarget:self action:@selector(TimeBnt:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:TimeBnt];
        
        [TimeBnt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(lbone);
            make.left.equalTo(btnMess.mas_right).offset(56);
            make.size.mas_equalTo(CGSizeMake(75, 13));
        }];
        
        
        
    }
    
    return self;
}

// 状态排序
- (void)message_btn:(UIButton *)sender
{
    
    
    
}
// 时间排序

-(void)TimeBnt:(UIButton *)sender
{
    
    
}

@end
