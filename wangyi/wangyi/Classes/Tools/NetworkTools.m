//
//  NetworkTools.m
//  wangyi
//
//  Created by danny on 17/3/11.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools


+(instancetype)sharedTools{
    
    static NetworkTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tools = [[NetworkTools alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
    });
    
    return tools;
}


//requestType 请求类型
// urlStr 请求地址
// parmeters 情趣参数  有可能是数组也有可能是字典
// successBlock 成功的回调
// failureBlock 失败的回调
-(void)requestWithType:(RequestType)requestType andUrlStr:(NSString *)urlStr andParams:(id)parmeters andSuccess:(void(^)(id responseObject))successBlock andFailture:(void(^)(NSError *error))failureBlock{
    
    if (requestType == GET) {
        [self GET:urlStr parameters:parmeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            successBlock(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failureBlock(error);
        }];
    }else{
        [self POST:urlStr parameters:parmeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            successBlock(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failureBlock(error);
            
        }];
    }
}


@end
