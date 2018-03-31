
//
//  HouseTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "HouseTableViewCell.h"

@implementation HouseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setFrame:(CGRect)frame
{
    frame.size.height -= 1;
    // 给cellframe赋值
    [super setFrame:frame];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.LogName =[UILabel new];
        self.LogName.font =Ping_R(17);
        [self.LogName setTextColor:[UIColor blackColor]];
        [self addSubview:self.LogName];
        [self.LogName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(8);
            make.top.equalTo(self).offset(13);
            make.size.mas_equalTo(CGSizeMake(116, 16));
            
        }];        
        self.LogPerson = [UILabel new];
        [self.LogPerson setTextColor:Gray_color];
        self.LogPerson.font =Ping_R(12);
        [self addSubview:self.LogPerson];
        [self.LogPerson mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.LogName);
            make.left.equalTo(self.LogName.mas_right).offset(2);
            make.size.mas_equalTo(CGSizeMake(90, 12));
        }];
        
        // 数量
        self.numlb =[UILabel new];
        self.numlb.font =Ping_R(12);
        self.numlb.textColor = Gray_color_tt;
        self.numlb.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.numlb];
        [self.numlb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-13);
            make.size.mas_equalTo(CGSizeMake(90, 12));
            
        }];
        
        // 规格
        self.numID =[UILabel new];
        self.numID.font =Ping_R(14);
        self.numID.textColor = Gray_color_tt;
        [self addSubview:self.numID];
        [self.numID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(8);
            make.top.equalTo(self.LogName.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(300, 14));
        }];
        
    }
    return self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
