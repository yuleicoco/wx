

//
//  EasyTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "EasyTableViewCell.h"

@implementation EasyTableViewCell
@synthesize lb;
@synthesize datlb;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        lb = [UILabel new];
//        lb.font = Ping_R(16);
//        lb.textColor = Gray_color_55;
//        [self addSubview:lb];
//
//        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).offset(13);
//            make.size.mas_equalTo(CGSizeMake(67, 15.5));
//            make.centerY.equalTo(self);
//        }];
        
        
        datlb =[UILabel new];
        datlb.font = Ping_R(14);
        datlb.textColor = Gray_color_128;
        datlb.textAlignment = NSTextAlignmentLeft;
        [self addSubview:datlb];
        
        [datlb mas_makeConstraints:^(MASConstraintMaker *make) {
              make.left.equalTo(self).offset(94);
              make.top.equalTo(self).offset(0);
              make.size.mas_equalTo(CGSizeMake(245, 13.5));
        }];
    }
    return self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
