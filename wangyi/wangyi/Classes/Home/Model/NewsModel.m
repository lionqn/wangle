//
//  NewsModel.m
//  wangyi
//
//  Created by danny on 17/3/11.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "NewsModel.h"
#import "NetworkTools.h"
#import <YYModel.h>
#import "PictureInfo.h"

@implementation NewsModel

// 模型容器属性(nsarray,nsset)指定对应的class
+(NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"imgextra" : [PictureInfo class]};
}

+(void)requestNewsModelArrayWithUrlStr:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *modelArray))completionBlock{
    
    [[NetworkTools sharedTools] requestWithType:GET andUrlStr:urlStr andParams:nil andSuccess:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        NSDictionary *dic = (NSDictionary *) responseObject;
        NSString *key = dic.allKeys.firstObject;
        // 通过key获取新闻的数组字典
        NSArray *dicArray = [dic objectForKey:key];
        
        // tongguo yymodel 完成字典转模型
        NSArray *modelArray = [NSArray yy_modelArrayWithClass:[NewsModel class] json:dicArray];
        // 回调模型数据,AFN回调主线程给你进行回调
        completionBlock(modelArray);
        
        NSLog(@"当前线程: %@",[NSThread currentThread]);
        
    } andFailture:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    }];}

@end
