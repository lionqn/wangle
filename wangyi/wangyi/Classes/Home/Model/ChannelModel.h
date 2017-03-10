//
//  ChannelModel.h
//  wangyi
//
//  Created by danny on 17/3/10.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import <Foundation/Foundation.h>

// 频道模型
@interface ChannelModel : NSObject

// 频道id
@property(nonatomic, copy) NSString *tid;

// 频道的名字
@property(nonatomic, copy) NSString *tname;

// 获取频道模型数据
+(NSArray *)getChannelModelArray;

//tid = T1348649145984;
//tname = NBA;

@end
