//
//  PlanNextViewController.m
//  wanxing
//
//  Created by osyu on 2018/4/3.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "PlanNextViewController.h"
#import "EasyTableViewCell.h"
#import "CaiHeaderView.h"
#import "EasyHeadView.h"


static NSString * cellId = @"plannTabid";
static NSString * headid =@"planhead";
@interface PlanNextViewController ()
{
    
    NSMutableArray * arr;
    NSInteger currentRow;
    int _sectionStatus[5];//默认:关闭
    
    
}

@end

@implementation PlanNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"六类网线"];
    currentRow = 10;

}

- (void)SetupData
{
    [super SetupData];
    
    arr =[NSMutableArray arrayWithObjects:@"工程组成",@"数量", @"规格型号",@"材料参数",@"材料产地",nil];
    
}

- (void)SetupView
{
    [super SetupView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.equalTo(self.view).offset(0);
        make.height.equalTo(@420);
        
    }];
    [self.tableView registerClass:[EasyTableViewCell class] forCellReuseIdentifier:cellId];
    self.tableView.tableFooterView =[[CaiHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
    self.tableView.tableHeaderView =[[EasyHeadView alloc]initWithReuseIdentifier:headid];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==3) {
        if (_sectionStatus[section]) {
            return 5;
        }else
        {
            
            return 0;
        }
       
        
    }else
    {
        return 0;
        
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EasyTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.datlb.text =@"gayufguagfuisg_材料";
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = Gray_color_uibrother;
    cell.selectedBackgroundView = view_bg;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    if (indexPath.row ==2) {
//        if (currentRow ==2)
//        {
//            currentRow =10;
//            [self.tableView reloadData];
//        }else
//        {   currentRow = indexPath.row;
//            EasyTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//            [self.tableView reloadData];
//
//        }
//    }
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 11;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    

    EasyHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headid];
    if(!sectionHeadView){
        
        sectionHeadView = [[EasyHeadView alloc] initWithReuseIdentifier:headid];
        sectionHeadView.lb.text = arr[section];
        sectionHeadView.datlb.text =@"shsvhs";
        if (section ==3) {
            sectionHeadView.btnMess.hidden =NO;
        }
       sectionHeadView.btnMess.tag = section;
        [sectionHeadView.btnMess addTarget:self action:@selector(Mark_inn:) forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"%ld",section);
    }
    return sectionHeadView;
    
}

- (void)Mark_inn:(UIButton *)sender {
    NSInteger section = sender.tag;
    //跟原来状态 取反
    _sectionStatus[section] = !_sectionStatus[section];
    //只刷新指定分区
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 55;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
