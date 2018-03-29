//
//  pickDateView.h
//  wanxing
//
//  Created by osyu on 2018/3/26.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pickDateView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) UIPickerView *pickerView;
@property (nonatomic,  strong)NSMutableArray * YearArr;
@property (nonatomic,  assign)NSInteger selectRow;
@property (strong, nonatomic) NSDictionary *selectedDataForColumn1;     // 用于级联
@property (strong, nonatomic) NSDictionary *selectedDataForColumn2;     // 用于级联
@property (strong, nonatomic) NSDictionary *selectedDataForColumn3;     // 用于级联
@property (strong, nonatomic) NSDictionary *selectedDataForColumn4;     // 用于级联
@property (nonatomic,assign) BOOL isOpen;


@end
