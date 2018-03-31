//
//  AFHttpClient+DoLogClient.m
//  wanxing
//
//  Created by osyu on 2018/3/29.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "AFHttpClient+DoLogClient.h"
#import <MojoDatabase/MojoDatabase.h>
#import "DologInforModel.h"


@implementation AFHttpClient (DoLogClient)

//日志列表

-(void)queryDoLogList:(NSString *)heads
          sel_Keyword:(NSString *)sel_Keyword stime:(NSString *)stime etime:(NSString *)etime checktime:(NSString *)checktime page:(NSString *)page rows:(NSString *)rows
             complete:(void(^)( BaseModel *model))completeBlock
{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"method"] = @"JOURN_GetList";
    params[@"heads"] = heads;
    params[@"stime"] = stime;
    params[@"etime"] = etime;
    params[@"checktime"] = checktime;
    params[@"page"] = page;
    params[@"rows"] = rows;
    
    [self POST:@"" parameters:params result:^(BaseModel *model) {
        if (model){
           
        }
        if (completeBlock) {
            completeBlock(model);
        }
    }];
    
}
//项目列表
-(void)queryDoProList:(NSString *)heads
          sel_Keyword:(NSString *)sel_Keyword   bt:(NSString *)bt page:(NSString *)page rows:(NSString *)rows
             complete:(void(^)(BaseModel *model))completeBlock
{
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    params[@"method"] = @"PROJECT_GetProject";
    params[@"heads"] = heads;
    params[@"bt"] = bt;
    params[@"page"] = page;
    params[@"rows"] = rows;
    
    [self POST:@"" parameters:params result:^(BaseModel *model) {
        if (model){
            
        }
        if (completeBlock) {
            completeBlock(model);
        }
    }];
    
    
}




@end
