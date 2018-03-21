//
//  CollViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/20.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "CollViewCell.h"

@implementation CollViewCell


 -(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _isBlue = NO;
        self.numLb =[UILabel new];
        self.numLb.text =@"1";
        self.numLb.layer.cornerRadius = 31/2;
        self.numLb.layer.masksToBounds = YES;
        self.numLb.font =[UIFont fontWithName:@"PingFangSC-Medium" size:12];
        self.numLb.textColor = RGB(55, 55, 55);
        self.numLb.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.numLb];
        
        [self.numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(31, 31));
            
        }];
        
    }
    
    return self;
    
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    
}

@end
