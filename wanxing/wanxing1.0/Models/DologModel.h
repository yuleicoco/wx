//
//  DologModel.h
//  wanxing
//
//  Created by osyu on 2018/3/29.
//  Copyright © 2018年 osyu. All rights reserved.
//

#import "JSONModel.h"


// 施工日志model
@interface DologModel : BaseModel
@property (nonatomic,copy)NSString <Optional> * total; //all条数
@property (nonatomic,copy)NSArray <Optional> * rows;



@end
