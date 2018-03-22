//
//  ChooseCollectionViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/21.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ChooseCollectionViewCell.h"

@implementation ChooseCollectionViewCell


 - (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
         _btn =[UIButton new];
        [_btn setImage:[UIImage imageNamed:@"log_cell_unchoose"] forState:UIControlStateNormal];
        [_btn setImage:[UIImage imageNamed:@"log_cell_choose"] forState:UIControlStateSelected];
        [self addSubview:_btn];
        
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(20);
            make.left.equalTo(self).offset(23);
            make.size.mas_offset(CGSizeMake(16, 16));
        }];
        
        _lb =[UILabel new];
        _lb.font = Ping_R(16);
        _lb.text =@"雅安监狱项目";
        
        [self addSubview:_lb];
        [_lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(20);
            make.left.equalTo(_btn.mas_right).offset(8);
            make.size.mas_equalTo(CGSizeMake(100, 16));
            
        }];
        
        
        _line =[UILabel new];
        _line.backgroundColor = Gray_color_uibrother;
        [self addSubview:_line];

        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(19);
            make.size.mas_equalTo(CGSizeMake(0.5, 21.5));
            make.left.equalTo(self).offset(183);

        }];
        
        
        
    }
    return self;
    
}
@end
