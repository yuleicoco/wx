//
//  DologInforModel.h
//  wanxing
//
//  Created by osyu on 2018/3/29.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "BaseModel.h"

@interface DologInforModel : JSONModel

@property (nonatomic, copy) NSString<Optional> * InsertTime;

@property (nonatomic, copy) NSString<Optional> *UserName;

@property (nonatomic, copy) NSString<Optional> *addr;

@property (nonatomic, copy) NSString<Optional> *adduser;

@property (nonatomic, copy) NSString<Optional> * breid;

@property (nonatomic, copy)  NSString<Optional> *department;

@property (nonatomic, copy) NSString<Optional> *item;

@property (nonatomic, copy) NSString<Optional> *proName;

@property (nonatomic, copy) NSString<Optional> *projectID;

@property (nonatomic, copy) NSString<Optional> *week;




@end
