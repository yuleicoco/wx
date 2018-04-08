//
//  PayListHeadView.m
//  wanxing
//
//  Created by osyu on 2018/4/8.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PayListHeadView.h"

@implementation PayListHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
     
        // 项目名字
        self.LogName =[UILabel new];
        self.LogName.font = Ping_R(16);
        self.LogName.textColor = Gray_color_55;
        self.LogName.text =@"分包单位金额";
        [self addSubview:self.LogName];
        
        [self.LogName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(9);
            make.height.equalTo(@16);
        }];
        
        self.btnMess = [UIButton new];
        [self.btnMess setImage:[UIImage imageNamed:@"left_in"] forState:UIControlStateNormal];
        [self.btnMess setImage:[UIImage imageNamed:@"inout_pu"] forState:UIControlStateSelected];
        [self addSubview:self.btnMess];
        [self.btnMess mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.LogName);
            make.right.equalTo(self).offset(-19);
            make.size.mas_equalTo(CGSizeMake(12, 6));
        }];
        
    }
    return self;
    
}


@end
