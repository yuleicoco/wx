//
//  LoginModel.h
//  wanxing
//
//  Created by osyu on 2018/3/16.
//  Copyright © 2018年 osyu. All rights reserved.
//


#import <MojoDatabase/MojoDatabase.h>

#import "JSONModel.h"

@interface LoginModel : JSONModel


@property (nonatomic, copy) NSString<Optional> * id;
@property (nonatomic, copy) NSString<Optional> * name;
@property (nonatomic, copy) NSString<Optional> * remark; // 备注
@property (nonatomic, copy) NSString<Optional> *is_used; // true

@end
