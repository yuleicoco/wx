//
//  SearchSingleView.h
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SingelSearViewDelegate <NSObject>

- (void)SeacrchVC;

@end


@interface SearchSingleView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign)id<SingelSearViewDelegate>delegate;

@property (nonatomic,strong)UITableView * proTab;
@property (nonatomic,strong)UITableView * shenTab;

@end
