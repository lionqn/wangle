//
//  NetworkTools.h
//  wangyi
//
//  Created by danny on 17/3/11.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


// 请求方式
typedef enum : NSUInteger {
    
    GET,
    POST,
    
} RequestType;

@interface NetworkTools : AFHTTPSessionManager

+(instancetype)sharedTools;

//requestType 请求类型
// urlStr 请求地址
// parmeters 情趣参数
// successBlock 成功的回调
// failureBlock 失败的回调
-(void)requestWithType:(RequestType)requestType andUrlStr:(NSString *)urlStr andParams:(id)parmeters andSuccess:(void(^)(id responseObject))successBlock andFailture:(void(^)(NSError *error))failureBlock;

@end
