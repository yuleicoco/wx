//
//  CaiHeaderView.m
//  wanxing
//
//  Created by osyu on 2018/3/31.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "CaiHeaderView.h"

@implementation CaiHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UILabel * line =[UILabel new];
        line.backgroundColor = Gray_color_uibrother;
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.top.equalTo(self).offset(0);
            make.height.equalTo(@5);
            
        }];
        
        UILabel * lbl =[UILabel new];
        lbl.text = @"备注内容";
        lbl.textColor = RGB(47, 47, 47);
        lbl.font = Ping_R(17);
        [self addSubview:lbl];
        [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(11);
            make.size.mas_equalTo(CGSizeMake(70, 16));
            make.top.equalTo(line.mas_bottom).offset(16);
            
        }];
        
        UITextView * textView =[UITextView new];
        
        textView.layer.borderColor = Gray_color_uibrother.CGColor;
        textView.layer.borderWidth = 1;
        textView.layer.cornerRadius =5;
        [self addSubview:textView];
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.mas_bottom).offset(6);
            make.left.equalTo(lbl.mas_right).offset(12);
            make.size.mas_equalTo(CGSizeMake(267, 100));
           

        }];
        textView.placeholder =@"请填写备注";
        textView.limitLength =[NSNumber numberWithInteger:200];
        
        
    }
    return self;
    
}


@end
