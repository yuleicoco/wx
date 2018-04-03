//
//  ShowAlertView.h
//  wanxing
//
//  Created by osyu on 2018/3/17.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowAlertDelegate <NSObject>

- (void)SureS;
- (void)CanceS;
- (void)DeleBox;



@end

@interface ShowAlertView : UIView
@property (nonatomic,assign)id<ShowAlertDelegate>delegate;


@end
