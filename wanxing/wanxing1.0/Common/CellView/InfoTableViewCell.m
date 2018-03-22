//
//  InfoTableViewCell.m
//  wanxing
//
//  Created by osyu on 2018/3/22.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
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
