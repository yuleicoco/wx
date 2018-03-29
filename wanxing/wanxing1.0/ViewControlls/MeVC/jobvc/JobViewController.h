//
//  JobViewController.h
//  wanxing
//
//  Created by osyu on 2018/3/24.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseTabViewController.h"
#import "SearchJobView.h"

@interface JobViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)SearchJobView   * SearView ;

@end
