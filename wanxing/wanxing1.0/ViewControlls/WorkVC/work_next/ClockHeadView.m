//
//  ClockHeadView.m
//  wanxing
//
//  Created by osyu on 2018/3/24.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ClockHeadView.h"

@implementation ClockHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithReuseIdentifier:reuseIdentifier];
    
    if (self) {
        UILabel * lbone =[UILabel new];
        lbone.text = NSLocalizedString(@"clock_name", nil);
        lbone.font = Ping_R(14);
        lbone.textColor = Gray_color_tt;
        [self addSubview:lbone];
        [lbone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(14);
             make.top.equalTo(self).offset(11);
             make.size.mas_equalTo(CGSizeMake(30, 13));
            
        }];
        
        
        UILabel * lbtw =[UILabel new];
        lbtw.text = NSLocalizedString(@"clock_pro", nil);
        lbtw.font = Ping_R(14);
        lbtw.textColor = Gray_color_tt;
        [self addSubview:lbtw];
        [lbtw mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(lbone.mas_right).offset(72);
            make.top.equalTo(self).offset(11);
            make.size.mas_equalTo(CGSizeMake(30, 13));
            
        }];
        
        
        UILabel * lbth =[UILabel new];
        lbth.text = NSLocalizedString(@"clock_go", nil);
        lbth.font = Ping_R(13);
        lbth.textColor = Gray_color_tt;
        [self addSubview:lbth];
        
        [lbth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbtw.mas_right).offset(60);
            make.top.equalTo(self).offset(11);
             make.size.mas_equalTo(CGSizeMake(54.5, 13));
        }];
        UILabel * lbfo =[UILabel new];
        lbfo.text = NSLocalizedString(@"clock_off", nil);
        lbfo.font = Ping_R(13);
        lbfo.textColor = Gray_color_tt;
        [self addSubview:lbfo];
        [lbfo mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(lbth.mas_right).offset(48);
            make.top.equalTo(self).offset(11);
             make.size.mas_equalTo(CGSizeMake(54.5, 13));
        }];
        
        
    }
    
    return self;
}



@end
