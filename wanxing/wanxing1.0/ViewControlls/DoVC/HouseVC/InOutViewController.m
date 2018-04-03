//
//  InOutViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/31.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "InOutViewController.h"
#import "InoutModel.h"
#import "InoutHeadView.h"
#import "InOutTableViewCellx.h"


static NSString * cellId = @"inoutcellTabid";
@interface InOutViewController ()
{
    
     NSMutableArray * SecionArr; // 分区
     NSMutableArray * cellArr;  // cell
     NSMutableArray * lbar;
    //记录每个分区 的展开状态 0表示关闭 1表示展开状态
     int _sectionStatus[4];//默认:关闭
    
    
}

@end

@implementation InOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:NSLocalizedString(@"house_info_ti", nil)];
    
    
    
}

- (void)SetupData
{
    [super SetupData];
    
    lbar =[NSMutableArray arrayWithObjects:@"出入类型",@"仓库",@"材料编号",@"项目",@"类型",@"数量",@"单价",@"总金额",@"供应商",@"操作时间",@"操作说明",nil];
    SecionArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 4; i++) {
        //一维数组
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (NSInteger j = 0; j < 11 ; j++) {
            //每个内容都有model填充
            InoutModel *model = [[InoutModel alloc] init];
            model.name = lbar[j];
            model.QQNumber = @"入库";
            //把模型对象放入数组中
            [arr addObject:model];
        }
        //把一维数组放入数据源
        [SecionArr addObject:arr];
    }
    
}

- (void)SetupView
{
    [super SetupView];
    self.view.backgroundColor = Gray_color;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.and.bottom.equalTo(self.view).offset(0);
    }];
    [self.tableView registerClass:[InOutTableViewCellx class] forCellReuseIdentifier:cellId];
    self.tableView.estimatedRowHeight = 55;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    
    
}

#pragma mark-------------tab

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return SecionArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_sectionStatus[section]) { //1表示展开 0表示收起
        //表示展开
        return [SecionArr[section] count];
    }else{
        return 0;//0行
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    InOutTableViewCellx *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    //获取 数据源中数据模型对象
    InoutModel *model = SecionArr[indexPath.section][indexPath.row];
    cell.lb.text = model.name;
    cell.datalb.text = model.QQNumber;
    return cell;
}


- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    static NSString *viewIdentfier = @"caiheard";
    InoutHeadView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    if(!sectionHeadView){
        
        sectionHeadView = [[InoutHeadView alloc] initWithReuseIdentifier:viewIdentfier];
        sectionHeadView.backgroundView.backgroundColor =[UIColor redColor];
    }
    sectionHeadView.btnMess.tag = section;
    
    [sectionHeadView.btnMess addTarget:self action:@selector(Mark_in:) forControlEvents:UIControlEventTouchUpInside];
    return sectionHeadView;
    

}

- (void)Mark_in:(UIButton *)sender {
    NSInteger section = sender.tag;
    //跟原来状态 取反
    _sectionStatus[section] = !_sectionStatus[section];
    //只刷新指定分区
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}



// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    DoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 55;
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section{
    if ([view isMemberOfClass:[InoutHeadView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor clearColor];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
