//
//  NewsModel.h
//  wangyi
//
//  Created by danny on 17/3/11.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

// 新闻标题
@property (nonatomic, copy) NSString *title;

// 新闻图标
@property (nonatomic, copy) NSString *imgsrc;

// 新闻来源
@property (nonatomic, copy) NSString *source;

// 新闻回复数
@property (nonatomic, assign) NSInteger *replyCount;

// 多张配图
@property (nonatomic, strong) NSArray *imgextra;

// 大图标记
@property (nonatomic, assign) BOOL imgType;

// 根据指定请求地址获取新闻数据
+(void)requestNewsModelArrayWithUrlStr:(NSString *)urlStr andCompletionBlock:(void(^)(NSArray *modelArray))completionBlock;

@end
