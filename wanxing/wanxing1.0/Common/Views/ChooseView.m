//
//  ChooseView.m
//  wanxing
//
//  Created by osyu on 2018/3/21.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "ChooseView.h"
#import "ChooseCollectionViewCell.h"

static NSString *kheaderIdentifier = @"headerIdentifier";

@implementation ChooseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES;
        UIView * bg =[UIView new];
        bg.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.7];
        [self addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(0);
            make.right.left.equalTo(self).offset(0);
            make.bottom.equalTo(self).offset(0);
        }];
        
        
        UICollectionViewFlowLayout * DayCollect =[[UICollectionViewFlowLayout alloc]init];
        self.ChoseCollView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:DayCollect];
        self.ChoseCollView.backgroundColor =[UIColor whiteColor];
        [self addSubview:self.ChoseCollView];
        
        
        
        [self.ChoseCollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(44);
            make.bottom.equalTo(self).offset(-87);
            make.left.right.equalTo(self).offset(0);
   
            
        }];
        self.didAddSperateVerticalLine = NO;
        
        self.ChoseCollView.scrollEnabled = NO;
        self.ChoseCollView.delegate =self;
        self.ChoseCollView.dataSource = self;
        [self.ChoseCollView registerClass:[ChooseCollectionViewCell class] forCellWithReuseIdentifier:@"chooseid"];
        // 注册头
        
        [self.ChoseCollView registerNib:[UINib nibWithNibName:@"HeaderViewCollection" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kheaderIdentifier];
        
        
        
        UIView * btnView =[UIView new];
        btnView.userInteractionEnabled = YES;
        btnView.backgroundColor =[UIColor whiteColor];
        btnView.layer.shadowOpacity = 0.4f;
        btnView.layer.shadowColor = [UIColor grayColor].CGColor;
        [self addSubview:btnView];
        
        [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self).offset(0);
            make.bottom.equalTo(self).offset(0);
            make.height.equalTo(@87);
            
        }];
        
        NSMutableArray * arr =[NSMutableArray new];
        for (NSInteger i = 0; i<2; i++) {
            UIButton * btn =[UIButton new];
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 5;
            btn.tag = 99999+i;
            if (i == 0) {
                btn.backgroundColor = Orange_color;
                [btn setTitle:NSLocalizedString(@"main_sure",nil) forState:UIControlStateNormal];
                
            }else{
                btn.backgroundColor = Green_color;
                [btn setTitle:NSLocalizedString(@"main_cancel", nil) forState:UIControlStateNormal];
            }
            
            [btn addTarget:self action:@selector(Touch:) forControlEvents:UIControlEventTouchUpInside];
            [arr addObject:btn];
            [btnView addSubview:btn];
        }
        
        [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:19 leadSpacing:25 tailSpacing:31];
        [arr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@25);
            make.height.equalTo(@39);
        }];
        
        
        
        
    }
    
    return self;
    
    
}


- (void)Touch:(UIButton *)sender
{
    NSInteger  i = sender.tag -99999;
    
    if (self.delegate) {
        if (i == 0) {
            [self.delegate SureC];
            NSLog(@"11");
        }else
        {
            NSLog(@"22");
            [self.delegate CanceC];
        }
    }
    
}


#pragma UICollectionViewDelegate *******************************************************

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ChooseCollectionViewCell  * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"chooseid" forIndexPath:indexPath];
    
    if (indexPath.row%2) {
        // 偶数
        cell.self.line.hidden = YES;
    }
    
    
    CGSize contentSize = self.ChoseCollView.contentSize;
    if (indexPath.row == 1) {
    
        UIView *horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height * indexPath.row  , contentSize.width, 1)];
        horizontalLine.backgroundColor = [UIColor lightGrayColor];
        horizontalLine.alpha = 0.35;
        [self.ChoseCollView addSubview:horizontalLine];
        
    }else{
    UIView *horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(7, cell.frame.size.height * indexPath.row  , contentSize.width-14, 1)];
    horizontalLine.backgroundColor = Gray_color_uibrother;
    horizontalLine.alpha = 0.35;
            // 偶数
        
        if (indexPath.row<7) {
             [self.ChoseCollView addSubview:horizontalLine];
        }

   
    }
    
    return cell;
    
                           
    
}

// UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(SCREEN_WIDTH/2,55);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//分别为上、左、下、右
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    CGSize size;
    
    size = CGSizeMake( self.ChoseCollView.width,54 );
    
    
    return size;
}



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifier;
    UICollectionReusableView *view;
    
       if ([kind isEqualToString: UICollectionElementKindSectionHeader ]){
           reuseIdentifier = kheaderIdentifier;
           view = [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
           UILabel *label = (UILabel *)[view viewWithTag:2222];
           view.backgroundColor =[UIColor whiteColor];
           label.text =@"项目选择";
           
 }
    return view;
    
}
                           
                       


@end
