//
//  BaseModel.h
//  sego2.0
//
//  Created by yulei on 16/11/10.
//  Copyright © 2016年 yulei. All rights reserved.
//

//#import <MojoDatabase/MojoDatabase.h>
#import "JSONModel.h"


@interface BaseModel : JSONModel

@property (nonatomic, copy) NSDictionary<Optional> *ResultData;
@property (nonatomic, copy) NSString<Optional> *Status; //状态 0 错误信息  -1重新登录
@property (nonatomic, copy) NSString<Optional> *retCode; // 错误信息  重新登录


@end
