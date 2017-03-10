//
//  HomeViewController.m
//  wangyi
//
//  Created by danny on 17/3/10.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelModel.h"

@interface HomeViewController ()

// 频道视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

// 新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

// 布局对象
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self requestChannelData];
}


-(void)requestChannelData{
    
    NSArray *channelModelArray = [ChannelModel getChannelModelArray];
    
//    NSLog(@"tList对应的数组%@",channelModelArray);
    for (ChannelModel *model in channelModelArray) {
        
        NSLog(@"%@",model);
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end



































