//
//  jobTabCell.m
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "jobTabCell.h"

@implementation jobTabCell

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
            make.left.equalTo(self).offset(9);
            make.top.equalTo(self).offset(17);
            make.size.mas_equalTo(CGSizeMake(140, 16));
            
        }];
        
        
        self.LogPerson = [UILabel new];
        [self.LogPerson setTextColor:Gray_color];
        self.LogPerson.font =Ping_R(12);
        [self addSubview:self.LogPerson];
        [self.LogPerson mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.LogName.mas_bottom).offset(5);
            make.left.equalTo(self).offset(9);
            make.size.mas_equalTo(CGSizeMake(220, 13));
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
            
            make.top.equalTo(self.LogPerson.mas_bottom).offset(10);
            make.left.equalTo(self).offset(9);
            make.size.mas_equalTo(CGSizeMake(336, 15));
        }];
        
        UILabel * LineGra =[UILabel new];
        LineGra.backgroundColor =Gray_color_uibrother;
        [self addSubview:LineGra];
        
        [LineGra mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(9);
            make.top.equalTo(self.LogIntro.mas_bottom).offset(19);
            make.right.equalTo(self).offset(-9);
            make.height.equalTo(@0.7);
            
        }];
        
         self.btn =[UIButton new];
        [ self.btn addTarget:self action:@selector(gouxuan:) forControlEvents:UIControlEventTouchUpInside];
        [ self.btn setImage:[UIImage imageNamed:@"log_cell_unchoose"] forState:UIControlStateNormal];
        [ self.btn  setImage:[UIImage imageNamed:@"log_cell_choose"] forState:UIControlStateSelected];
        [self.contentView addSubview: self.btn];
        [ self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-11);
            make.right.equalTo(self.mas_right).offset(-11);
            make.size.mas_equalTo(CGSizeMake(17, 17));

        }];
        
    }
    
    return self;
    
}

- (void)gouxuan:(UIButton *)sender
{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
