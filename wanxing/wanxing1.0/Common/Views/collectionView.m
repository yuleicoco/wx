//
//  collectionView.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "collectionView.h"
#import "LookViewImage.h"

@implementation collectionView

@synthesize collectionV;




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout * DayCollect =[[UICollectionViewFlowLayout alloc]init];
        collectionV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:DayCollect];
        collectionV.backgroundColor =[UIColor whiteColor];
        [self addSubview:collectionV];
        
        [collectionV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.bottom.equalTo(self).offset(0);
        }];
        collectionV.scrollEnabled = NO;
        collectionV.delegate =self;
        collectionV.dataSource = self;
        [collectionV registerClass:[FuCollectionViewCell class] forCellWithReuseIdentifier:@"fucellid"];
        
        
    }
    
    return self;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FuCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"fucellid" forIndexPath:indexPath];
    cell.imageview.image =[UIImage imageNamed:@"test12"];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(91,60);
}

// UICollectionView被选中时调用的方法  // 放大图片
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // NSNumber *number = [NSNumber numberWithInt:indexPath.row];
 
     [self lookImageArr];
}

/*
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}
 */


- (void)lookImageArr
{
    
    if (self.delegate) {
        [self.delegate lookImage];
        
    }
    
}



#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return -5;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 3;
}


@end
