//
//  ChooseView.m
//  wanxing
//
//  Created by osyu on 2018/3/21.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ChooseView.h"

@implementation ChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIView * bg =[UIView new];
        bg.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.7];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.right.left.equalTo(self).offset(0);
            make.bottom.equalTo(self).offset(0);
        }];
         
    
        
    }
    
    return self;
    
    
}


@end
