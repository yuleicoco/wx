//
//  DateView.h
//  wanxing
//
//  Created by osyu on 2018/3/19.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

// 封装一个日期view

@protocol DateviewDelegate <NSObject>

- (void)SureDateBtn;
- (void)CancelDateBtn;




@end

@interface DateView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,assign)id<DateviewDelegate>delegate;
@property (nonatomic,strong)UICollectionView * colletionView;


@property (nonatomic,strong) NSCalendar *calender;
@property (nonatomic,strong) NSDateComponents * comps;
@property (nonatomic,assign) NSInteger totalDayThisMonth;  //本月总天数
@property (nonatomic,assign) NSInteger totalDayLastMonth;   //上月总天数 :
@property (nonatomic,assign) NSInteger fisrtWeekDay;   //本月第一天周几：
@property (nonatomic,assign) NSInteger firstWeekDayNextMonth;   //下月第一天周几：
@property (nonatomic,assign)NSInteger tadayNum;



@property (nonatomic,assign) NSInteger lastSum;     // = fisrtWeekDay //显示上个月格子数：
@property (nonatomic,assign) NSInteger nextSum;     //= 7 - firstWeekDayNM;  //显示下个月格
@property (nonatomic,assign) NSInteger sumDays;     //= totalDayThisMonth + nextSum + lastSum  显示总各自数：

@end
