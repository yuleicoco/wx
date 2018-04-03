
//
//  singleHeadView.m
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "singleHeadView.h"

@implementation singleHeadView
@synthesize lbness;


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 项目名字
        self.LogName =[UILabel new];
        self.LogName.font = Ping_R(17);
        self.LogName.textColor = Gray_color_b;
        self.LogName.text =@"费用项目";
        [self addSubview:self.LogName];
        
        [self.LogName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(16);
            make.left.equalTo(self).offset(12);
            make.height.equalTo(@17);
        }];
        
       
        lbness =[UILabel new];
        lbness.font = Ping_R(12);
        lbness.text =@"总金额: 100元";
        lbness.textColor = Gray_color_tt;
        lbness.textAlignment = NSTextAlignmentRight;
        [self addSubview:lbness];
        [lbness mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.LogName);
            make.right.equalTo(self).offset(-13);
            make.size.mas_equalTo(CGSizeMake(140, 13));
        }];
        
    }
    return self;
    
}


@end
