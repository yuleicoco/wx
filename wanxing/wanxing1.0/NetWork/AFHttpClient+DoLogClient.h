//
//  AFHttpClient+DoLogClient.h
//  wanxing
//
//  Created by osyu on 2018/3/29.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "AFHttpClient.h"
#import "DologModel.h"

@interface AFHttpClient (DoLogClient)

/**
 * heads 账户密码加密所得
 * sel_Keyword 关键字 可为nil
 * stime 开始时间
 * etime 结束时间 可为nil
 * checktime 固定查询时间 可nil
 * page：当前页码，可空。默认为1；
 * rows：一页多少条数据，可空。默认为20。
 */
-(void)queryDoLogList:(NSString *)heads
          sel_Keyword:(NSString *)sel_Keyword stime:(NSString *)stime etime:(NSString *)etime checktime:(NSString *)checktime page:(NSString *)page rows:(NSString *)rows
                      complete:(void(^)(BaseModel *model))completeBlock;


/**
 * heads 账户密码加密所得
 * sel_Keyword 关键字 可为nil
 * bt 所有项目 （0）
 * page：当前页码，可空。默认为1；
 * rows：一页多少条数据，可空。默认为20。
 */
-(void)queryDoProList:(NSString *)heads
          sel_Keyword:(NSString *)sel_Keyword   bt:(NSString *)bt page:(NSString *)page rows:(NSString *)rows
             complete:(void(^)(BaseModel *model))completeBlock;




@end
