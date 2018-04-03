//
//  FuCollectionViewCell.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "FuCollectionViewCell.h"

@implementation FuCollectionViewCell
@synthesize imageview;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imageview =[UIImageView new];
        [self addSubview:imageview];
        
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.and.top.and.bottom.equalTo(self).offset(0);
            make.size.mas_equalTo(CGSizeMake(91, 60));
            
        }];
        
    }
    
    return self;
    
    
}

@end
