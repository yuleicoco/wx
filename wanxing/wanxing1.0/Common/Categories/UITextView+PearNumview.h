//
//  UITextView+PearNumview.h
//  wanxing
//
//  Created by osyu on 2018/3/28.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (PearNumview)
@property (nonatomic,strong) NSString *placeholder;//占位符
@property (copy, nonatomic) NSNumber *limitLength;//限制字数
@end
