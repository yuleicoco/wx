//
//  deleView.h
//  wanxing
//
//  Created by osyu on 2018/3/28.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeViewDelegate <NSObject>

- (void)upviw;
- (void)deleview;




@end

@interface deleView : UIView
@property (nonatomic,assign)id<DeViewDelegate>delegate;
@end
