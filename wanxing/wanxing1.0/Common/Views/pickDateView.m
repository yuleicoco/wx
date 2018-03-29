//
//  pickDateView.m
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "pickDateView.h"


@implementation pickDateView

- (instancetype)initWithFrame:(CGRect)frame
{
      self = [super initWithFrame:frame];
    if (self) {
        
        self.YearArr =[[NSMutableArray alloc]init];
        [self BUT:0 mo:0];
         self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 375, 165)];
         self.pickerView.backgroundColor = Gray_color_uibrother;
         self.pickerView.delegate = self;
         self.pickerView.dataSource = self;
         [self.pickerView selectRow:10 inComponent:0 animated:NO];
         [self.pickerView selectRow:6 inComponent:1 animated:NO];
         [self.pickerView selectRow:10 inComponent:2 animated:NO];
         [self.pickerView selectRow:10 inComponent:3 animated:NO];
         [self.pickerView selectRow:10 inComponent:4 animated:NO];
         [self addSubview:self.pickerView];
        
      
        

    }
    return self;
    
    
}

-(void)BUT:(NSInteger )ye mo:(NSInteger )m
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear |NSCalendarUnitMonth;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    // 分
     NSMutableArray *column5 = [NSMutableArray array];
    for (NSInteger i =0; i<=59; i++) {
        NSString *min = [NSString stringWithFormat:@"%ld", i];
        [column5 addObject:min];
    }
    
    
     //小时   24
    NSMutableArray *column4 = [NSMutableArray array];
    for (NSInteger i =0; i<24; i++) {
        NSString *hour = [NSString stringWithFormat:@"%ld", i];
        NSDictionary *dict = @{hour : column5};
        [column4 addObject:dict];
    }

    
    
    //日
    NSInteger dayNum;
    if (ye == 0 || m == 0) {
    dayNum =[self howManyDaysInThisYear:1990 withMonth:1];
    }else
    {
        dayNum =[self howManyDaysInThisYear:ye withMonth:m];
    }
    NSMutableArray *column3 = [NSMutableArray array];
    for (NSInteger i = 1; i<=dayNum; i++) {
        NSString *day = [NSString stringWithFormat:@"%ld", i];
        NSDictionary *dict = @{day : column4};
        [column3 addObject:dict];
    }
     NSMutableArray *column2 = [NSMutableArray arrayWithCapacity:12];
    // 月
    for (int i = 1; i <= 12; i++) {
        NSString *month = [NSString stringWithFormat:@"%d", i];
        NSDictionary *dict = @{month : column3};
        [column2 addObject:dict];
    }
    
    //年
    for (int i = 1990; i <= dateComponent.year ; i++) {
        NSString *key = [NSString stringWithFormat:@"%d", i];
        NSDictionary *dict = @{key : column2};
        [_YearArr addObject:dict];
    }
    
    // 级联
    NSDictionary *firstDict = self.YearArr[0];
    _selectedDataForColumn1 = firstDict;
    // 二级
    NSArray *allCitys = firstDict.allValues[0];
    NSDictionary *fistCityDict = allCitys[0];
    _selectedDataForColumn2 = fistCityDict;
    
    // 三级
    
    NSArray * hour = fistCityDict.allValues[0];
    NSDictionary * secondDict  = hour[0];
    _selectedDataForColumn3 = secondDict;
    
    // 四级
    NSArray * mint = secondDict.allValues[0];
    NSDictionary * thrid = mint[0];
    _selectedDataForColumn4 = thrid;
    
    [self.pickerView reloadAllComponents];//刷新UIPickerView
    
}

#pragma mark - 获取某年某月的天数
- (NSInteger)howManyDaysInThisYear:(NSInteger)year withMonth:(NSInteger)month{
    if((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12))
        return 31 ;
    
    if((month == 4) || (month == 6) || (month == 9) || (month == 11))
        return 30;
    
    if((year % 4 == 1) || (year % 4 == 2) || (year % 4 == 3))
    {
        return 28;
    }
    
    if(year % 400 == 0)
        return 29;
    
    if(year % 100 == 0)
        return 28;
    
    return 29;
}



//返回有几列

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    return 5;
}

//返回指定列的行数

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    if (component == 0) {
        //y
        return self.YearArr.count;
    } else if (component == 1) {
        //m
        NSArray *allCitys = self.selectedDataForColumn1.allValues[0];
        return allCitys.count;
    }else if (component == 2)
    {
        // d
          NSArray *allDists = self.selectedDataForColumn2.allValues[0];
          return allDists.count;
    }
    else if (component ==3)
    {
        // h
        NSArray * allhoure = self.selectedDataForColumn3.allValues[0];
        return allhoure.count;
        
    }else if (component ==4)
    {
        // m
        NSArray * allhourem = self.selectedDataForColumn4.allValues[0];
        return allhourem.count;
        
    }
   
    
    return 0;
    
}

//返回指定列，行的高度，就是自定义行的高度

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 20.0f;
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        NSDictionary *dict = self.YearArr[row];
        NSString *key = dict.allKeys[0];
        return key;
    }else if(component == 1) {
        NSArray *cityArray = self.selectedDataForColumn1.allValues[0];
        NSDictionary *cityDict = cityArray[row];
        NSString *cityKey = cityDict.allKeys[0];
        return cityKey;
     }
    else if (component ==2)
    {
        
        NSArray *allDists = self.selectedDataForColumn2.allValues[0];
        NSDictionary *cityDict = allDists[row];
        NSString *cityKey = cityDict.allKeys[0];
        return cityKey;
    }
    else if (component ==3)
    {
        NSArray *alhoure = self.selectedDataForColumn3.allValues[0];
        NSDictionary *cityDict = alhoure[row];
        NSString *cityKey = cityDict.allKeys[0];
        return cityKey;
        
    }
    else if (component ==4)
    {
        NSArray *alhoure = self.selectedDataForColumn4.allValues[0];
        return  alhoure[row];
        
        
    }
    return @" ？？？";
}
//返回指定列的宽度

- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
  
    if (component == 0) {
        
        return 86;
    }else if (component ==1)
    {
        
        return 30;
    }
    else if (component ==2)
    {
        
        return 50;
    }
    else if (component ==3)
    {
        return 30;
    }else
    {
        
        return 30;
    }
    
}

//被选择的行

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
  


  

    if (component ==0) {
        
          NSDictionary * dic = self.YearArr[row];
          NSString * str  = dic.allKeys[0];
          [pickerView reloadComponent:1];
          [pickerView selectRow:0 inComponent:component + 1 animated:YES];
    }if (component ==1) {
        
       
        NSDictionary * dic = self.YearArr[row];
        NSString * str  = dic.allKeys[0];
        
        NSArray *cityArray = self.selectedDataForColumn1.allValues[0];
        NSDictionary *cityDict = cityArray[row];
        NSString *cityKey = cityDict.allKeys[0];
        [_YearArr removeAllObjects];
        [self BUT:[str integerValue]  mo:[cityKey integerValue]];
        self.pickerView.delegate = self;
        self.pickerView.dataSource = self;
        [pickerView reloadComponent:2];
        [pickerView reloadAllComponents];
        
        
        [pickerView selectRow:0 inComponent:component + 1 animated:YES];
    }if (component ==2) {
     
       

    }
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    
    UILabel *lbl = (UILabel *)view;
    
    if (lbl == nil) {
        lbl = [[UILabel alloc]init];
        lbl.font = [UIFont systemFontOfSize:20];
        if (component ==0) {
           
            lbl.textAlignment =NSTextAlignmentRight;
            [lbl setBackgroundColor:[UIColor clearColor]];
        }
        if (component == 1) {
            
            lbl.textAlignment =NSTextAlignmentRight;
        }
        if (component == 2) {
            lbl.textAlignment = NSTextAlignmentLeft;
            
        }if (component == 3) {
            lbl.textAlignment =NSTextAlignmentRight;
        }
        if (component == 4) {
            
            lbl.textAlignment = NSTextAlignmentLeft;
        }
       
    }
    
    lbl.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return lbl;
    
}




@end
