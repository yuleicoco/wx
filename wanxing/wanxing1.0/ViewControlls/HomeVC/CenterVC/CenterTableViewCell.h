//
//  CenterTableViewCell.h
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CenterTableViewCell : UITableViewCell
@property (nonatomic,strong)UILabel * LogName; // 项目名字
@property (nonatomic,strong)UILabel * LogDate; // 日期
@property (nonatomic,strong)UILabel * LogIntro; // 介绍
@property (nonatomic,strong)UILabel * isOver;
@property (nonatomic,strong)UILabel * isperson;



@end
