//
//  ChannelModel.m
//  wangyi
//
//  Created by danny on 17/3/10.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "ChannelModel.h"
#import <YYModel.h>

@implementation ChannelModel

+(NSArray *)getChannelModelArray{
    

    // 文件路径
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    // 获取文件对应的json的二进制数据
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    // 反序列化json的数据
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    // 获取list对应的频道数组字典数据
    NSArray *channelDicArray = [dic objectForKey:@"tList"];
    
    // 使用YYModel完成字典转模型的操作
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[ChannelModel class] json:channelDicArray];
    
    // 根据模型里面的tid进行从小到大的排序
    modelArray = [modelArray sortedArrayUsingComparator:^NSComparisonResult(ChannelModel *obj1, ChannelModel * obj2) {
        
        // 默认使用升序
//        [obj2.tid compare:obj1.tid]; 这是降序
        return [obj1.tid compare:obj2.tid];
    }];
    
    return modelArray;
}

// 重写description 其实在nslog的时候 走的就是这个方法相当于[channelmodel description]
-(NSString *)description{
    
    NSString *desc = [NSString stringWithFormat:@"%@  --  %@",self.tid, self.tname];
    return desc;
}

@end
