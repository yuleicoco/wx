//
//  DateView.m
//  wanxing
//
//  Created by osyu on 2018/3/19.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "DateView.h"
#import "CollViewCell.h"




@implementation DateView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.arrIndex = [NSMutableArray new];
        //背景蒙版
        self.backgroundColor =[[UIColor grayColor]colorWithAlphaComponent:0.9];
        UIView * MBview =[[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:MBview];
        
        //
        
        UIView * DateChoose =[[UIView alloc]init];
        DateChoose.backgroundColor =[UIColor whiteColor];
        DateChoose.layer.cornerRadius =7;
        DateChoose.layer.masksToBounds = YES;
        [self addSubview:DateChoose];
        
        [DateChoose mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@99);
            make.left.equalTo(self).offset(11);
            make.size.mas_equalTo(CGSizeMake(355, 326));
            
        }];
        
       
        NSMutableArray * arrUn =[[NSMutableArray alloc]initWithObjects:@"date_un",@"date_in", nil];
        NSMutableArray * Unarr =[NSMutableArray new];
        NSMutableArray * Inarr =[NSMutableArray new];
    
        

        
        for (NSInteger i = 0; i<2; i++) {
            // <
            UIButton * btn =[UIButton new];
            [btn setImage:[UIImage imageNamed:arrUn[0]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(Un_touch:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 1050+i;
            [Unarr addObject:btn];
            [self addSubview:btn];
        }
        [Unarr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:160 leadSpacing:32 tailSpacing:143];
        [Unarr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(DateChoose).offset(20);
            make.height.equalTo(@16);
        }];
        
        
        
        
            // >
        for (NSInteger i = 0; i<2; i++) {
            UIButton * btn =[UIButton new];
            [btn setImage:[UIImage imageNamed:arrUn[1]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(In_touch:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 1060+i;
            [Inarr addObject:btn];
            [self addSubview:btn];
        }
        
        [Inarr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:160 leadSpacing:143 tailSpacing:49];
        [Inarr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(DateChoose).offset(20);
            make.height.equalTo(@16);
        }];
        
        
         // 年  月
  
            UILabel * lby =[UILabel new];
            lby.font =[UIFont fontWithName:@"PingFangSC-Semibold" size:16];
            lby.textColor = RGB(9, 177, 239);
            lby.text =  @"2018";
            [self addSubview:lby];
        [lby mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(DateChoose).offset(63);
            make.top.equalTo(DateChoose).offset(20);
            
            
        }];
        
        
            UILabel * lbM =[UILabel new];
            lbM.text =  @"二月";
            lbM.font =[UIFont fontWithName:@"PingFangSC-Semibold" size:16];
            lbM.textColor = RGB(9, 177, 239);
            [self addSubview:lbM];
        
        [lbM mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(DateChoose).offset(237);
            make.top.equalTo(DateChoose).offset(20);
        }];
        
        
     
       
            UILabel * line =[UILabel new];
            [line setBackgroundColor:[UIColor grayColor]];
            line.alpha =0.7;
            [DateChoose addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
              make.top.equalTo(DateChoose).offset(52);
              make.height.equalTo(@1);
                make.left.equalTo(self).offset(11);
              make.width.equalTo(DateChoose.mas_width);
            
        }];
        
        
        UILabel * lineT =[UILabel new];
        [lineT setBackgroundColor:[UIColor grayColor]];
        lineT.alpha =0.7;
        [DateChoose addSubview:lineT];
        
        [lineT mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(DateChoose).offset(-64);
            make.height.equalTo(@1);
             make.left.equalTo(self).offset(11);
            make.width.equalTo(DateChoose);
            
        }];
        
        NSMutableArray * weeNam =[[NSMutableArray alloc]initWithObjects:NSLocalizedString(@"date_one", nil),NSLocalizedString(@"date_two", nil),
                                  NSLocalizedString(@"date_thr", nil),NSLocalizedString(@"date_fou", nil),NSLocalizedString(@"date_fiv", nil),NSLocalizedString(@"date_fou", nil),NSLocalizedString(@"date_fiv", nil),NSLocalizedString(@"date_six", nil),NSLocalizedString(@"date_seven", nil),nil];
        NSMutableArray * weLbArr =[NSMutableArray new];
        
        
        // 星期
        for (NSInteger i = 0; i<7; i++) {
            
            UILabel * WeekL =[UILabel new];
            WeekL.textColor = RGB(140, 140, 140);
            WeekL.text =weeNam[i];
            WeekL.font =[UIFont fontWithName:@"PingFangSC-Regular" size:11];
            [weLbArr addObject:WeekL];
            [self addSubview:WeekL];
            
        }
       
        [weLbArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:28 leadSpacing:19 tailSpacing:19];
        [weLbArr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line).offset(9);
            make.height.equalTo(@9);
        }];
        
    
        
        
        
        // 确定 取消
        
        UIButton * SureBtn =[UIButton new];
        SureBtn.backgroundColor = RGB(252, 151, 33);
        [SureBtn setTitle:NSLocalizedString(@"main_sure", nil) forState:UIControlStateNormal];
        SureBtn.layer.masksToBounds = YES;
        SureBtn.layer.cornerRadius = 5;
        [SureBtn addTarget:self action:@selector(SureDateBtn) forControlEvents:UIControlEventTouchUpInside];
        [DateChoose addSubview:SureBtn];
        [SureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(DateChoose.mas_left).offset(35);
            make.top.equalTo(lineT.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(136, 39));
            
        }];
        
        
        UIButton * CancelBtn =[UIButton new];
        CancelBtn.backgroundColor = RGB(38, 190, 199);
        [CancelBtn setTitle:NSLocalizedString(@"main_cancel", nil) forState:UIControlStateNormal];
        CancelBtn.layer.masksToBounds = YES;
        CancelBtn.layer.cornerRadius = 5;
        [CancelBtn addTarget:self action:@selector(CancelDateBtn) forControlEvents:UIControlEventTouchUpInside];
        [DateChoose addSubview:CancelBtn];
        [CancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(SureBtn.mas_right).offset(14);
            make.top.equalTo(lineT.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(136, 39));
            
        }];
        
        
        
        // collection   //日子
        UICollectionViewFlowLayout * DayCollect =[[UICollectionViewFlowLayout alloc]init];
        self.colletionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:DayCollect];
        self.colletionView.backgroundColor =[UIColor whiteColor];
        [DateChoose addSubview:self.colletionView];
        
       
        
        [self.colletionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line).offset(23);
            make.left.equalTo(DateChoose).offset(0);
            make.size.mas_equalTo(CGSizeMake(355, 185));
            
        }];
        self.colletionView.scrollEnabled = NO;
        self.colletionView.delegate =self;
        self.colletionView.dataSource = self;
        [self.colletionView registerClass:[CollViewCell class] forCellWithReuseIdentifier:@"numdayid"];
       
        
     
        
        [self Test];
        
       
        
        
    }
    
     return  self;
    
}

- (void)Test
{
    
   
    self.calender = [NSCalendar currentCalendar];
    [self.calender setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    self.comps =  [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    NSInteger thisMonth = [self.comps month];
    NSInteger thisYear = [self.comps year];
   _tadayNum = [self.comps day];
    
    _totalDayThisMonth = [self getTotalDaysThisMonth:[NSDate date]];
    
   
    [self.comps setMonth:[self.comps month] - 1];
    NSDate *lastMonDate = [self.calender dateFromComponents:self.comps];
    _totalDayLastMonth = [self getTotalDaysThisMonth:lastMonDate];
    
    

    
    
    _fisrtWeekDay          = [self getWeekdayWithYear:thisYear month:thisMonth day:1];
    _firstWeekDayNextMonth = [self getWeekdayWithYear:thisYear month:thisMonth + 1 day:1];
    
    
    
    if (_fisrtWeekDay == 7) {
        _lastSum = 0;
    }else{
        
        _lastSum = _fisrtWeekDay;
    }
    _nextSum = 7 - _firstWeekDayNextMonth;
    _sumDays = _totalDayThisMonth + _nextSum + _lastSum;
    
    
    
    
}

#pragma Mark -------method

- (void)Un_touch:(UIButton *)sender{
    
    NSInteger i = sender.tag -1050;
    
    switch (i) {
        case 0:
            
            break;
            
        case 1:
            
        default:
            break;
    }
    
}

- (void)In_touch:(UIButton *)sender
{
    NSInteger i = sender.tag -1060;
    
    switch (i) {
        case 0:
            
            break;
            
        case 1:
            
        default:
            break;
    }
    
}

#pragma UICollectionViewDelegate *******************************************************

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _sumDays;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
   
    CollViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"numdayid" forIndexPath:indexPath];
    if (indexPath.row == (_sumDays - _totalDayThisMonth + _tadayNum-1) ){
        
        
        NSNumber *number = [NSNumber numberWithInt:indexPath.row];
        [self.arrIndex addObject:number];
        cell.isBlue = YES;
        cell.numLb.textColor =[UIColor whiteColor];
        cell.numLb.backgroundColor  = RGB(9, 177, 239);
    }else
    {
        
        cell.isBlue = NO;
    }
    
    if (indexPath.row < _lastSum) {
        //上月数据
        cell.numLb.text = [NSString stringWithFormat:@"%ld",(_totalDayLastMonth - _fisrtWeekDay + 1 + indexPath.row)];
        NSLog(@"---%ld",(_totalDayLastMonth - _fisrtWeekDay + 1 + indexPath.row));
        cell.numLb.textColor =[UIColor grayColor];
        
    }else if(indexPath.row < _totalDayThisMonth + _lastSum){
        //本月数据展示
        cell.numLb.text = [NSString stringWithFormat:@"%ld",(indexPath.row + 1 - _lastSum)];
        NSLog(@"==%ld",(indexPath.row + 1 - _lastSum));
    }else{
        //下个月数据显示
        cell.numLb.text = [NSString stringWithFormat:@"%ld",(indexPath.row + 1 - _totalDayThisMonth - _lastSum)];
        NSLog(@"++%ld",(indexPath.row + 1 - _totalDayThisMonth - _lastSum));
    }
    
    
    return cell;
}


/*
-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"1");
    CollViewCell *cell = (CollViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
}
 */

/*
-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
        NSLog(@"2");
    CollViewCell *cell = (CollViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
 */


#pragma mark
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

// UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
     NSNumber *number = [NSNumber numberWithInt:indexPath.row];
     CollViewCell  * cell =(CollViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    if (cell.isBlue) {
        //  选中
        cell.isBlue = NO;
        cell.numLb.textColor = RGB(55, 55, 55);
        cell.numLb.backgroundColor =[UIColor whiteColor];
        [self.arrIndex removeObject:number];

    }else
    {
        if (self.arrIndex.count ==1) {
           
            NSIndexPath *indexPathc = [NSIndexPath indexPathForRow:[self.arrIndex[0] integerValue] inSection:0];
            CollViewCell  * cellOne =(CollViewCell *)[collectionView cellForItemAtIndexPath:indexPathc];
            cellOne.isBlue = NO;
            cellOne.numLb.textColor = RGB(55, 55, 55);
            cellOne.numLb.backgroundColor =[UIColor whiteColor];
            [self.arrIndex removeAllObjects];
            
            cell.isBlue = YES;
            cell.numLb.textColor =[UIColor whiteColor];
            cell.numLb.backgroundColor  = RGB(9, 177, 239);
            [self.arrIndex addObject:number];
           
            
            
            
            
        }else{
        cell.isBlue = YES;
        cell.numLb.textColor =[UIColor whiteColor];
        cell.numLb.backgroundColor  = RGB(9, 177, 239);
        [self.arrIndex addObject:number];
            
               FuckLog(@"444");
        }
        
    }
    
   
    
    
    
    
    
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(31,31);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(7, 6, 0, 12);//分别为上、左、下、右
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 18;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 6;
}




#pragma UICollectionViewDelegate *******************************************************


#pragma mark - 获取当前月总天数NSInteger
- (NSInteger)getTotalDaysThisMonth:(NSDate *)date{
    
    NSRange range = [self.calender rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}  


#pragma mark - 判断给定日期是周几
//返回1--周一，7--周日
- (NSInteger)getWeekdayWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    [comps setMonth:month];
    [comps setYear:year];
    
    
    NSDate *date = [self.calender dateFromComponents:comps];
    NSLog(@"date -- %@",date);
    NSDateComponents *weekdayComponents = [self.calender components:NSCalendarUnitWeekday fromDate:date];
    
    NSInteger weekDayNum =[weekdayComponents weekday] - 1;
    
    if (weekDayNum == 0) {
        weekDayNum = 7;
    }
    
    return weekDayNum;
}








#pragma Mark ----------method
//确定
- (void)SureDateBtn
{
    
    if (self.delegate) {
        
        // 遵循协议 实现
        [self.delegate SureB];
        
    }
    
}
// 取消
- (void)CancelDateBtn
{
    
    if (self.delegate) {
        
        [self.delegate CanceB];
    }
    
}
@end
