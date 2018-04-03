//
//  collectionView.h
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuCollectionViewCell.h"

@protocol CollectionviewDelegate <NSObject>

- (void)lookImage;

@end



@interface collectionView : UIView <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)  UICollectionView * collectionV;
@property (nonatomic,assign)id<CollectionviewDelegate>delegate;
@end
