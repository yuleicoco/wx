//
//  SearchPay.h
//  wanxing
//
//  Created by osyu on 2018/4/8.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SearchPayDelegate <NSObject>

- (void)SeacrchVC;

@end

@interface SearchPay : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign)id<SearchPayDelegate>delegate;
@property (nonatomic,strong)UITableView * tabda;
@property (nonatomic,strong)UIButton * btnch;
@property (nonatomic,strong)UIButton * btnNext;

@end
