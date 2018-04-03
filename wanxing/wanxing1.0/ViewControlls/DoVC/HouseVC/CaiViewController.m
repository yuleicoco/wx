//
//  CaiViewController.m
//  wanxing
//
//  Created by osyu on 2018/3/30.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "CaiViewController.h"
#import "InOutViewController.h"
#import "CaiTableViewCell.h"
#import "CaiHeaderView.h"

static NSString * cellId = @"housecellTabid";
@interface CaiViewController ()

{
    NSMutableArray * arrlb;
}

@end

@implementation CaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"镀锌钢绞线"];
    [self showBarButton:NAV_RIGHT imageName:@"house_in"];
    
    
}
- (void)SetupData
{
    [super SetupData];
    arrlb =[NSMutableArray arrayWithObjects:@"材料类型",@"材料编号",@"数   量",@"规     格",@"参     数",@"价     格",@"品     牌",@"产     地",@"计价方式", nil];
    
}


- (void)SetupView
{
    [super SetupView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.equalTo(self.view).offset(0);
    }];
    
    [self.tableView registerClass:[CaiTableViewCell class]  forCellReuseIdentifier:cellId];
    
    self.tableView.estimatedRowHeight = 55;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
}

-(void)doRightButtonTouch
{
    
    // 出入库
    InOutViewController * vc =[[InOutViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

#pragma MARK---------------------TAB协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.dataSource.count;
    return 9;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CaiTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.lb.text = arrlb[indexPath.row];
    if (indexPath.row ==4) {
//         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭头
        NSString * ShowTx =@"RH_98Y768  ";
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:ShowTx attributes:nil];
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
        textAttachment.image = [UIImage imageNamed:@"house_more"];
        textAttachment.bounds =CGRectMake(2,-2, 14,13);
        NSAttributedString * textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
        string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",ShowTx]attributes:nil];
        [string insertAttributedString:textAttachmentString atIndex:ShowTx.length];
        cell.dalb.attributedText = string;
        
    
    }else
    {
        
        cell.dalb.text =@"明知山有虎";
    }
    UIView *view_bg = [[UIView alloc]initWithFrame:cell.frame];
    view_bg.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = view_bg;
    
    return cell;
    
}


// 点击cell--本次选择的cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    //    DoTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
   
    if (indexPath.row ==4) {
        NSLog(@"参数");
    }
    
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    static NSString *viewIdentfier = @"caiheard";
    CaiHeaderView *sectionHeadView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewIdentfier];
    if(!sectionHeadView){
        
        sectionHeadView = [[CaiHeaderView alloc] initWithReuseIdentifier:viewIdentfier];
        sectionHeadView.backgroundView.backgroundColor =[UIColor redColor];
    }
    return sectionHeadView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section

{
    
    return 110;
    
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(nonnull UIView *)view forSection:(NSInteger)section {
    if ([view isMemberOfClass:[CaiHeaderView class]]) {
        ((UITableViewHeaderFooterView *)view).backgroundView.backgroundColor = [UIColor clearColor];
    }
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
