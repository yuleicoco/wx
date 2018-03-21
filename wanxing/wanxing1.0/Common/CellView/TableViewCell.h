//
//  TableViewCell.h
//  wanxing
//
//  Created by osyu on 2018/3/20.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel * LogName; // 项目名字
@property (nonatomic,strong)UILabel * LogPerson; // 负责人
@property (nonatomic,strong)UILabel * LogDate; // 日期
@property (nonatomic,strong)UILabel * LogIntro; // 介绍


@end
