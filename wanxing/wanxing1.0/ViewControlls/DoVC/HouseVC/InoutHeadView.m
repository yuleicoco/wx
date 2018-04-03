
//
//  InoutHeadView.m
//  wanxing
//
//  Created by osyu on 2018/3/31.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "InoutHeadView.h"

@implementation InoutHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 蓝色
        UILabel * lineOne =[UILabel new];
        lineOne.backgroundColor = Blue_color;
        [self addSubview:lineOne];
        [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(16);
            make.left.equalTo(self).offset(8);
            make.size.mas_equalTo(CGSizeMake(4, 16));
        }];
        // 项目名字
        self.LogName =[UILabel new];
        self.LogName.font = Ping_R(16);
        self.LogName.textColor = Gray_color;
        self.LogName.text =@"出库";
        [self addSubview:self.LogName];
        
        [self.LogName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(16);
            make.left.equalTo(lineOne.mas_right).offset(7);
            make.height.equalTo(@16);
        }];
        
        self.btnMess = [UIButton new];
        [self.btnMess setTitle:@"2018-03-22" forState:UIControlStateNormal];
        [self.btnMess setImage:[UIImage imageNamed:@"left_in"] forState:UIControlStateNormal];
        [self.btnMess setImage:[UIImage imageNamed:@"inout_pu"] forState:UIControlStateSelected];
//        [self.btnMess addTarget:self action:@selector(clickbtn:) forControlEvents:UIControlEventTouchUpInside];
        self.btnMess.adjustsImageWhenHighlighted = NO;
        self.btnMess.titleLabel.font =Ping_R(12);
        [self.btnMess setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnMess.imageEdgeInsets = UIEdgeInsetsMake(0, 40, 0, -78);
        self.btnMess.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 12);
        [self addSubview:self.btnMess];
        
        [self.btnMess mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.LogName);
            make.right.equalTo(self).offset(12);
            make.size.mas_equalTo(CGSizeMake(110, 13));
        }];
        
    }
    return self;
    
}

-(void)clickbtn:(UIButton *)sender
{
    
    sender.selected != sender.selected;
    
}





@end
