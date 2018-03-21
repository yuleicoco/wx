//
//  ChooseView.h
//  wanxing
//
//  Created by osyu on 2018/3/21.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ChooseViewDelegate <NSObject>

- (void)SureC;
- (void)CanceC;




@end

// 选择项目
@interface ChooseView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,assign)id<ChooseViewDelegate>delegate;


@end
