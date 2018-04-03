//
//  CaiTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/31.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "CaiTableViewCell.h"

@implementation CaiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.lb =[UILabel new];
        self.lb.font= Ping_R(17);
        self.lb.textAlignment = NSTextAlignmentLeft;
        self.lb.textColor =Gray_color_b;
        [self addSubview:self.lb];
        
        [self.lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(9);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(69.5, 16));
        }];
        
        self.dalb =[UILabel new];
        self.dalb.font = Ping_R(14);
        self.dalb.textColor = Gray_color_tt;
        self.dalb.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.dalb];
        [self.dalb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(130, 16));
            
        }];
        
    }
    return self;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
