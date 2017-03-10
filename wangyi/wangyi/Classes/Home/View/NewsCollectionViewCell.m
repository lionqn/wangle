//
//  NewsCollectionViewCell.m
//  wangyi
//
//  Created by danny on 17/3/11.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "NewsCollectionViewCell.h"
#import "NewsTableViewController.h"

@implementation NewsCollectionViewCell{
    NewsTableViewController *_tableViewVC;
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    // 创建新闻列表控制器
    _tableViewVC = [[NewsTableViewController alloc] init];
    [self.contentView addSubview:_tableViewVC.tableView];
    
    // tableview的大小就是collectionview的子控件的大小
    _tableViewVC.tableView.frame = self.contentView.bounds;
    
    _tableViewVC.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
}


-(void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    
    _tableViewVC.urlStr = urlStr;
}

@end
