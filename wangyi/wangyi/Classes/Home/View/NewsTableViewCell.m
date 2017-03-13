//
//  NewsTableViewCell.m
//  wangyi
//
//  Created by danny on 17/3/11.
//  Copyright © 2017年 qinningning. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "PictureInfo.h"

@interface NewsTableViewCell ()

// 新闻图片
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;


// 多图新闻图片
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *iconImagesImageView;

// 新闻标题
@property (weak, nonatomic) IBOutlet UILabel *lalTitle;

// 新闻来源
@property (weak, nonatomic) IBOutlet UILabel *lalSource;

// 点赞数
@property (weak, nonatomic) IBOutlet UILabel *lalReplyCount;


@end

@implementation NewsTableViewCell

-(void)setNewsModel:(NewsModel *)newsModel{
    
    _newsModel = newsModel;
    
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.lalTitle.text = newsModel.title;
    self.lalSource.text = newsModel.source;
//    self.lalReplyCount.text = [NSString stringWithFormat:@"%zd",newsModel.replyCount];
    self.lalReplyCount.text = newsModel.replyCount;
    
    
    for (int i = 0; i < self.iconImagesImageView.count; i++) {
        
        
        // 获取对应的图片字典
//        NSDictionary *imageDic = newsModel.imgextra[i];
//        
//        // 通过key获取图片的地址
//        NSString *imagePath = [imageDic objectForKey:@"imgsrc"];
//        
//        UIImageView *imageView = self.iconImagesImageView[i];
//        [imageView sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        
        
        
//         获取下标对应的模型
        PictureInfo *pic = newsModel.imgextra[i];
        
        // 获取对应的imageView
        UIImageView *imageView = self.iconImagesImageView[i];
//        
        [imageView sd_setImageWithURL:[NSURL URLWithString:pic.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        
    }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.imgsrcImageView.contentMode = UIViewContentModeScaleAspectFill;
    // 允许裁剪
    self.imgsrcImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
