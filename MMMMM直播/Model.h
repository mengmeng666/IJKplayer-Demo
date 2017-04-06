//
//  Model.h
//  直播测试
//
//  Created by 董晓萌 on 17/3/23.
//  Copyright © 2017年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZhuBo.h"
@interface Model : NSObject

//直播地址
@property (nonatomic,strong)NSString * stream_addr;
//关注人
@property (nonatomic,assign)NSString * online_users;
//城市
@property (nonatomic,strong)NSString * city;

//主播
@property (nonatomic,strong)ZhuBo * creator;
@end
