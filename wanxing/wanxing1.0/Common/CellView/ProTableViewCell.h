//
//  ProTableViewCell.h
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProTableViewCell : UITableViewCell

@property (nonatomic,strong)UILabel * LogName; // 项目名字
@property (nonatomic,strong)UILabel * LogPerson; // 负责人
@property (nonatomic,strong)UILabel * LogDate; // 日期
@property (nonatomic,strong)UITextView * LogIntro;
@property (nonatomic,strong)UILabel * isOver; // 完成


@end
