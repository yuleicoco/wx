//
//  Seachclockview.h
//  wanxing
//
//  Created by osyu on 2018/3/24.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewDelegate <NSObject>

- (void)Seacrch;

@end


@interface Seachclockview : UIView<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,assign)id<SearchViewDelegate>delegate;
@property (nonatomic,strong)UITableView * SearchTab;
@property (nonatomic,strong)UIButton * btnch;
@property (nonatomic,strong)UITextField * textField;
@property (nonatomic,strong)UITableView * pullTab;



@end
