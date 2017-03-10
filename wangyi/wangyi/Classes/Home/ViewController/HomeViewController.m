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
#import "NewsCollectionViewCell.h"
#import "NetworkTools.h"


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

static NSString *cellid = @"cellid";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 标签栏
    [self requestChannelData];
    
    // 新闻栏
    [self setupNewCollectionView];
    
    
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
    self.newsCollectionView.dataSource = self;
    self.newsCollectionView.delegate = self;
    
    self.flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - 64 - 44);
    
    // 间距
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    // 滑动方向
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 弹簧效果
    self.newsCollectionView.bounces = NO;
    // 分页效果
    self.newsCollectionView.pagingEnabled = YES;
    self.newsCollectionView.showsHorizontalScrollIndicator = NO;
    self.newsCollectionView.showsVerticalScrollIndicator = NO;
    

    
   
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channelModelArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    
    // 获取指定的频道模型
    ChannelModel *model = self.channelModelArray[indexPath.item];
    
    // 获取频道id
    NSString *tid = model.tid;
    
    // 计算请求的urlStr
    NSString *urlStr = [NSString stringWithFormat:@"%@/0-20.html",tid];
    cell.urlStr = urlStr;
    
//    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    return cell;
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



































