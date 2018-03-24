//
//  ClockTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/24.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ClockTableViewCell.h"

@implementation ClockTableViewCell
@synthesize lbth;
@synthesize lbfo;
@synthesize lbtw;
@synthesize lbone;


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        lbone =[UILabel new];
        lbone.font = Ping_R(17);
        lbone.textColor = Gray_color_b;
        [self addSubview:lbone];
        [ lbone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(13);
            make.top.equalTo(self).offset(21);
            make.size.mas_equalTo(CGSizeMake(70, 16));
            
        }];
        
        
        lbtw =[UILabel new];
        lbtw.font = Ping_R(14);
        lbtw.textColor = Gray_color_b;
        [self addSubview:lbtw];
        [ lbtw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbone.mas_right).offset(30);
            make.top.equalTo(self).offset(21);
            make.size.mas_equalTo(CGSizeMake(42.5, 16));
            
        }];
        
        
        lbth =[UILabel new];
        lbth.textColor = Gray_color_b;
        lbth.font = Ping_R(14);
        [self addSubview:lbth];
        [ lbth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbtw.mas_right).offset(55);
            make.top.equalTo(self).offset(21);
            make.size.mas_equalTo(CGSizeMake(40, 16));
            
        }];
        
        
        
        lbfo =[UILabel new];
          lbfo.textColor = Gray_color_b;
        lbfo.font = Ping_R(14);
        [self addSubview:lbfo];
        [ lbfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lbth.mas_right).offset(61);
            make.top.equalTo(self).offset(21);
            make.size.mas_equalTo(CGSizeMake(70, 16));
            
        }];
        
        UILabel * LineGra =[UILabel new];
        LineGra.backgroundColor =Gray_color_uibrother;
        [self addSubview:LineGra];
        
        [LineGra mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self).offset(9);
            make.top.equalTo(self.lbfo.mas_bottom).offset(14);
            make.right.equalTo(self).offset(-9);
            make.height.equalTo(@0.7);
            
        }];
        
      
        
        
        
    }
    
    return self;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
