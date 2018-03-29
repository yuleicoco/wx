//
//  SearchJobView.h
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchJobViewDelegate <NSObject>

- (void)SeacrchJob;

@end


@interface SearchJobView : UIView<UITextFieldDelegate>

@property (nonatomic,assign)id<SearchJobViewDelegate>delegate;
@property (nonatomic,strong)UITableView * SearchTab;
@property (nonatomic,strong)UIButton * btnch;
@property (nonatomic,strong)UITextField * textWord;
@property (nonatomic,strong)UITextField * textPerson;
@property (nonatomic,strong)UITableView * pullTab;

@end
