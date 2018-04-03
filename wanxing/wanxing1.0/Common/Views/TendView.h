//
//  TendView.h
//  wanxing
//
//  Created by osyu on 2018/4/2.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TendViewDelegate <NSObject>

- (void)AllTend;
- (void)UnTend;
- (void)deleTend;


@end

@interface TendView : UIView

@property (nonatomic,assign)id<TendViewDelegate>delegate;

@end
