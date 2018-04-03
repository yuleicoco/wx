//
//  LookViewImage.h
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseTabViewController.h"

@interface LookViewImage : BaseTabViewController<QFTableViewDelegate,QFTableViewDataSource>
@property (nonatomic,strong)  QFTableView * mytableView;
@property (nonatomic,strong) NSMutableArray * dataArray;



@end
