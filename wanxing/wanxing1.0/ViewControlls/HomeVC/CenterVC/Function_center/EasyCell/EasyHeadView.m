
//
//  EasyHeadView.m
//  wanxing
//
//  Created by osyu on 2018/4/4.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "EasyHeadView.h"

@implementation EasyHeadView
@synthesize lb;
@synthesize datlb;


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        lb = [UILabel new];
        lb.font = Ping_R(16);
        lb.textColor = Gray_color_55;
        [self addSubview:lb];
        
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(13);
            make.size.mas_equalTo(CGSizeMake(67, 15.5));
            make.centerY.equalTo(self);
        }];
        
        
        datlb =[UILabel new];
        datlb.font = Ping_R(14);
        datlb.textColor = Gray_color_128;
        datlb.textAlignment = NSTextAlignmentLeft;
        [self addSubview:datlb];
        
        [datlb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lb.mas_right).offset(13);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(245, 13.5));
        }];
        
        self.btnMess = [UIButton new];
        self.btnMess.hidden = YES;
        [self.btnMess setImage:[UIImage imageNamed:@"left_in"] forState:UIControlStateNormal];
        [self.btnMess setImage:[UIImage imageNamed:@"inout_pu"] forState:UIControlStateSelected];
        //        [self.btnMess addTarget:self action:@selector(clickbtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnMess setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.btnMess];
        
        [self.btnMess mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self).offset(-19);
            make.size.mas_equalTo(CGSizeMake(6.5, 12.5));
        }];
        
    }
    
    return self;
}

@end
