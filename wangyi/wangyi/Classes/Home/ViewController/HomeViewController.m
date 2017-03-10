//
//  HomeViewController.m
//  wangyi
//
//  Created by danny on 17/3/10.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelModel.h"
#import "ChannelLabel.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

// 频道视图
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

// 新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

// 布局对象
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

// 数据源
@property (nonatomic, strong) NSArray *channelModelArray;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self requestChannelData];
}


-(void)requestChannelData{
    
    self.channelModelArray = [ChannelModel getChannelModelArray];
    

//    for (ChannelModel *model in channelModelArray) {
//        
//        NSLog(@"%@",model);
//    }
    
    // 遍历频道模型数组,创建对应频道的label
    // 频道的大小
    CGFloat labelW = 80;
    CGFloat labelH = 44;
    for (int i = 0; i < self.channelModelArray.count; i++) {
        
        // 获取对应的模型数据
        ChannelModel *model = self.channelModelArray[i];
        
        // 创建label
        ChannelLabel *channelLabel = [[ChannelLabel alloc] initWithFrame:CGRectMake(i * labelW, 0, labelW, labelH)];
        channelLabel.text = model.tname;
        
        channelLabel.font = [UIFont systemFontOfSize:15];
        channelLabel.textAlignment = NSTextAlignmentCenter;
        channelLabel.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
        [self.channelScrollView addSubview:channelLabel];
    }
    
    
    // 设置scrollView的滑动大小
    self.channelScrollView.contentSize = CGSizeMake(labelW * self.channelModelArray.count, 44);
    
    self.channelScrollView.showsVerticalScrollIndicator = NO;
    self.channelScrollView.showsHorizontalScrollIndicator = NO;
    
    
}


// 创建新闻视图
-(void)setupNewCollectionView{
    
    // 设置数据源代理
    
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



































