//
//  deleView.m
//  wanxing
//
//  Created by osyu on 2018/3/28.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "deleView.h"

@implementation deleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UILabel *line =[UILabel new];
        line.backgroundColor = Gray_color_uibrother;
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.equalTo(self).offset(0);
            make.height.equalTo(@1);
            
        }];
        
        NSArray * arr =[NSArray arrayWithObjects:@"caogao_up" ,@"caogao_de", nil];
        NSMutableArray * arrbtn =[NSMutableArray array];
        for (NSInteger i = 0; i<2; i++) {
            UIButton * btn =[UIButton new];
            [btn addTarget:self action:@selector(deBtn:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 6767+i;
            [btn setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
            [arrbtn addObject:btn];
            [self addSubview:btn];
        }
        [arrbtn mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        [arrbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.height.equalTo(@50);
        }];
        
    }
    return self;
    
}

- (void)deBtn:(UIButton *)sender
{
    NSInteger inde = sender.tag -6767;
    if (inde == 0 && self.delegate) {
        [self.delegate upviw];
    }else
    {
        [self.delegate deleview];
        
    }
    
    
    
}

@end
