//
//  DoViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "DoViewController.h"

@interface DoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation DoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setNavTitle:NSLocalizedString(@"do_title", nil)];
    
    UIView  * view =[UIView new];
    view.frame = self.view.frame;
    
    [self.view addSubview:view];
    
    UICollectionViewFlowLayout * DayCollect =[[UICollectionViewFlowLayout alloc]init];
    DayCollect.itemSize =CGSizeMake(31, 31);
    
    UICollectionView  * colletionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:DayCollect];
    
    colletionView.backgroundColor =[UIColor greenColor];
    colletionView.delegate =self;
    colletionView.dataSource = self;
    [colletionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"dayI"];
    [view addSubview:colletionView];
    

    
        
        
    
}


#pragma UICollectionViewDelegate *******************************************************

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1; // 排满35
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 35;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
   
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dayI" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
