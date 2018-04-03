//
//  SingleTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "SingleTableViewCell.h"

@implementation SingleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.lb =[UILabel new];
        self.lb.font  = Ping_R(16);
        self.lb.textColor = Gray_color_b;
        [self addSubview:self.lb];
        [self.lb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(9);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(100, 15));
        }];
        
        
        self.datalb =[UILabel new];
        self.datalb.font  = Ping_R(14);
        self.datalb.textColor = RGB(128, 128, 128);
        self.datalb.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.datalb];
        
        [self.datalb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-13);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(200, 15));
        }];
        
        
    }
    
    return self;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
