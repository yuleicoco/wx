//
//  BaseTabViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/15.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseTabViewController.h"




@interface BaseTabViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation BaseTabViewController

//*****************************************************逻辑****************************************

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:animated];
}
//*****************************************************逻辑****************************************



- (void)setupView{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.bGroupView ? UITableViewStyleGrouped : UITableViewStylePlain];
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_tableView];
}

- (void)SetupData
{
    
    _dataSource =[[NSMutableArray alloc]init];
    _dicSource =[[NSMutableArray alloc]init];
}


- (void)UpdataSource
{
    
    [self.tableView.mj_header beginRefreshing];
    
    
}


//*****************************************************基类实现****************************************

/**
*  初始化上拉下拉刷新block
*/
- (void)initRefreshView
{
    __typeof (&*self) __weak weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.pageIndex = START_PAGE_INDEX;
        [weakSelf loadDataSourceWithPage:weakSelf.pageIndex];
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if ((weakSelf.pageIndex )* REQUEST_PAGE_SIZE == weakSelf.dataSource.count) {
            weakSelf.pageIndex++;
            [weakSelf loadDataSourceWithPage:weakSelf.pageIndex];
        }else{
            [weakSelf.tableView.mj_footer endRefreshing];
            weakSelf.tableView.mj_footer.hidden = YES;
        }
    }];
    
    self.tableView.mj_footer.hidden = YES;
    [self.tableView.mj_header beginRefreshing];
}


/*
*  加载分页方法，在子类重写
*/
- (void)loadDataSourceWithPage:(int)page {
    
    
}
/**
 *  结束刷新
 */
-(void)handleEndRefresh{
    
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

//*****************************************************协议****************************************
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

//*****************************************************协议****************************************

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
