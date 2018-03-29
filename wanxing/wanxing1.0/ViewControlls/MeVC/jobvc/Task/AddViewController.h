//
//  AddViewController.h
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseTabViewController.h"
#import "ChooseView.h"

@interface AddViewController : BaseTabViewController

@property (nonatomic,strong)UITextField *textTa;   // 任务名称
@property (nonatomic,strong)UILabel * lblePerson; // 人员
@property (nonatomic,strong)UILabel * lbleStartTime; // 开始时间
@property (nonatomic,strong)UILabel * lbleEndTime; // 结束时间
@property (nonatomic,strong)UIButton * btnDown;
@property (nonatomic,strong)ChooseView * choosePerson;






@end
