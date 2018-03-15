//
//  BaseTabViewController.h
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseTabViewController : BaseViewController

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* dataSource;
@property (nonatomic,strong)NSMutableArray * dicSource;
@property (nonatomic, assign) BOOL bGroupView;
@property (nonatomic, assign) int pageIndex;

- (void)UpdataSource;


@end
