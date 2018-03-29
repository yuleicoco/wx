//
//  TableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/20.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.LogName =[UILabel new];
        self.LogName.font =Ping_R(16);
        [self.LogName setTextColor:[UIColor blackColor]];
        [self addSubview:self.LogName];
        [self.LogName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(9);
            make.top.equalTo(self).offset(13);
            make.size.mas_equalTo(CGSizeMake(98, 16));
            
        }];
        
        
        self.LogPerson = [UILabel new];
        [self.LogPerson setTextColor:Gray_color];
        self.LogPerson.font =Ping_R(12);
        [self addSubview:self.LogPerson];
        [self.LogPerson mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(16);
            make.left.equalTo(self.LogName.mas_right).offset(13);
            make.size.mas_equalTo(CGSizeMake(90, 12));
        }];
        
        
        
        self.LogDate =[UILabel new];
        self.LogDate.font  = Ping_R(12);
        [self.LogDate setTextColor:Gray_color];
        [self addSubview:self.LogDate];
        
        [self.LogDate mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self).offset(16);
            make.right.equalTo(self).offset(-14);
            make.size.mas_equalTo(CGSizeMake(62, 10));
        }];
        
        
        self.LogIntro =[UILabel new];
        self.LogIntro.font = Ping_R(14);
        [self.LogIntro setTextColor:Gray_color];
        [self addSubview:self.LogIntro];
        
        [self.LogIntro mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.LogName.mas_bottom).offset(9);
            make.left.equalTo(self).offset(9);
            make.size.mas_equalTo(CGSizeMake(336, 15));
        }];
        
        UILabel * LineGra =[UILabel new];
        LineGra.backgroundColor =Gray_color_uibrother;
        [self addSubview:LineGra];
        
        [LineGra mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(self).offset(9);
            make.top.equalTo(self.LogIntro.mas_bottom).offset(14);
            make.right.equalTo(self).offset(-9);
            make.height.equalTo(@0.7);
            
        }];
            
       
            
            
        
        
        
    }
    
    return self;
    
}







- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
