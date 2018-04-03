//
//  DoTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/22.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "DoTableViewCell.h"

@implementation DoTableViewCell



 -(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         self.imageC  =[UIImageView new];
        [self addSubview: self.imageC ];
        
        [ self.imageC  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(17);
            make.left.equalTo(self).offset(10);
            make.size.mas_equalTo(CGSizeMake(26, 26));
        }];
        
        
       self.lb =[UILabel new];
         self.lb.font = Ping_R(16);
        [self addSubview: self.lb];
        [ self.lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageC.mas_right).offset(13);
            make.top.equalTo(self).offset(21);
            make.size.mas_equalTo(CGSizeMake(80, 16));
            
        }];
        
    }
    
    return self;
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
  
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
