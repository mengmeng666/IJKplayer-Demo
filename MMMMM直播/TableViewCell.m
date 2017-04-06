//
//  TableViewCell.m
//  直播测试
//
//  Created by 董晓萌 on 17/3/23.
//  Copyright © 2017年 wyzc. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+WebCache.h"
#define Color(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *daImageView;
@property (weak, nonatomic) IBOutlet UIImageView *xiaoImageView;
@property (weak, nonatomic) IBOutlet UILabel *ren;
@property (weak, nonatomic) IBOutlet UILabel *DiZhi;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *Livel;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(Model *)model{

    _model = model;
    [self.xiaoImageView sd_setImageWithURL:[NSURL URLWithString:model.creator.portrait]];
    if (model.city.length == 0) {
        self.DiZhi.text = @"在厕所";
    }else{
        self.DiZhi.text = model.city;
    }
    [self.daImageView sd_setImageWithURL:[NSURL URLWithString:model.creator.portrait]];
    self.ren.text = [NSString stringWithFormat:@"%@人再看",model.online_users];
    self.ren.font = [UIFont systemFontOfSize:15];
    //名字
    self.nameLabel.text = model.creator.nick;
    self.nameLabel.font = [UIFont systemFontOfSize:17];

    _daImageView.layer.cornerRadius = 0;
    _daImageView.layer.masksToBounds = YES;

    _xiaoImageView.layer.cornerRadius = 25;
    _xiaoImageView.layer.masksToBounds = YES;

    _Livel.layer.cornerRadius = 5;
    _Livel.layer.masksToBounds = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
