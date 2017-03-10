//
//  NewsTableViewController.m
//  wangyi
//
//  Created by danny on 17/3/11.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NetworkTools.h"
#import "NewsModel.h"


@interface NewsTableViewController ()

// 新闻列表数据源
@property (nonatomic, strong) NSArray *newsModelArray;;


@end

static NSString *cellID = @"cellID";

@implementation NewsTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    [self setupTableView];
}


// tableView 的相关设置
-(void)setupTableView{
    
    // 注册单元格
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}


-(void)setUrlStr:(NSString *)urlStr{
    
    _urlStr = urlStr;
    
//    NSLog(@"%@",urlStr);
//        [[NetworkTools sharedTools] requestWithType:GET andUrlStr:urlStr andParams:nil andSuccess:^(id responseObject) {
//    
//            NSLog(@"%@",responseObject);
//            
//            NSDictionary *dic = (NSDictionary *) responseObject;
//            NSString *key = dic.allKeys.firstObject;
//            // 通过key获取新闻的数组字典
//            NSArray *dicArray = [dic objectForKey:key];
//            
//            NSLog(@"%@",dicArray);
//            
//        } andFailture:^(NSError *error) {
//    
//            NSLog(@"%@",error);
//            
//        }];
    
    
    [NewsModel requestNewsModelArrayWithUrlStr:urlStr andCompletionBlock:^(NSArray *modelArray) {
        
        self.newsModelArray = modelArray;
        // 获取数据
        [self.tableView reloadData];
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    NewsModel *model = self.newsModelArray[indexPath.row];
    // Configure the cell...
    
    cell.textLabel.text = model.title;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
