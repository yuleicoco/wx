//
//  PlanBTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PlanBTableViewCell.h"

@implementation PlanBTableViewCell
@synthesize numlb;
@synthesize btn;
@synthesize caiLB;
@synthesize guilb;
@synthesize introlb;



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        caiLB =[UILabel new];
        caiLB.font =Ping_R(16);
        caiLB.textColor = Gray_color_55;
        [self addSubview:caiLB];
        [caiLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(14);
            make.top.equalTo(self).offset(18);
            make.size.mas_equalTo(CGSizeMake(120, 15));
        }];
        
        UIImageView * im =[UIImageView new];
        im.image=[UIImage imageNamed:@"plan_line"];
        [self addSubview:im];
        
        [im mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(caiLB.mas_bottom).offset(12);
            make.left.and.right.equalTo(self).offset(0);
            make.height.equalTo(@1);
        }];
        
        
        guilb =[UILabel new];
        guilb.font =Ping_R(12);
        guilb.textColor = Gray_color_128;
        guilb.textAlignment = NSTextAlignmentLeft;
        [self addSubview:guilb];
        
        [guilb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(im.mas_bottom).offset(11);
            make.left.equalTo(self).offset(14);
            make.size.mas_equalTo(CGSizeMake(280, 12.5));
        }];

        numlb =[UILabel new];
        numlb.font =Ping_R(12);
        numlb.textColor = Gray_color_128;
        numlb.textAlignment = NSTextAlignmentLeft;
        [self addSubview:numlb];
        
        [numlb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(guilb.mas_bottom).offset(5);
            make.left.equalTo(self).offset(14);
            make.size.mas_equalTo(CGSizeMake(80, 11.5));
        }];

        introlb =[UILabel new];
        introlb.font =Ping_R(14);
        introlb.textColor = Gray_color_55;
        introlb.textAlignment = NSTextAlignmentLeft;
        [self addSubview:introlb];
        
        [introlb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(numlb.mas_bottom).offset(8);
            make.left.equalTo(self).offset(14);
            make.size.mas_equalTo(CGSizeMake(308, 14.5));
        }];
        
        btn =[UIButton new];
        [btn setImage:[UIImage imageNamed:@"plan_up"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn_click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(caiLB);
            make.right.equalTo(self).offset(-24);
            make.size.mas_equalTo(CGSizeMake(8, 13.5));
        }];
        
        
        
        
    }
    
    return self;
}

- (void)btn_click
{
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
