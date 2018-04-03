//
//  CenterTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "CenterTableViewCell.h"

@implementation CenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
 - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.LogName =[UILabel new];
        self.LogName.font =Ping_R(17);
        [self.LogName setTextColor:Gray_color_b];
        [self addSubview:self.LogName];
        [self.LogName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(14);
            make.top.equalTo(self).offset(17);
            make.size.mas_equalTo(CGSizeMake(140, 16));
            
        }];
        
        self.isperson =[UILabel new];
        self.isperson.font =Ping_B(12);
        self.isperson.textColor = Gray_color_128;
        [self addSubview:self.isperson];
        
        [self.isperson mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(74, 12));
            make.left.equalTo(self.LogName.mas_right).offset(9);
            make.top.equalTo(self).offset(21);
            
        }];
        
      
        self.LogDate =[UILabel new];
        self.LogDate.font  = Ping_R(12);
        self.LogDate.textAlignment = NSTextAlignmentRight;
        [self.LogDate setTextColor:Gray_color_b];
        [self addSubview:self.LogDate];
        
        [self.LogDate mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(18);
            make.right.equalTo(self).offset(-10);
            make.size.mas_equalTo(CGSizeMake(80, 10));
        }];
        
        self.isOver = [UILabel new];
        self.isOver.textAlignment = NSTextAlignmentRight;
        self.isOver.font = Ping_R(12);
        [self.isOver setTextColor:Gray_color];
        [self addSubview:self.isOver];
        
        [self.isOver mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.LogDate.mas_bottom).offset(18);
            make.right.equalTo(self).offset(-10);
            make.size.mas_equalTo(CGSizeMake(50, 12));
        }];
        
        self.LogIntro =[UILabel new];
        self.LogIntro.font = Ping_R(13);
        [self.LogIntro setTextColor:Gray_color_b];
        [self addSubview:self.LogIntro];
        
        [self.LogIntro mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.LogName.mas_bottom).offset(11);
            make.left.equalTo(self).offset(9);
            make.size.mas_equalTo(CGSizeMake(336, 15));
        }];
        
    }
    return self;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
