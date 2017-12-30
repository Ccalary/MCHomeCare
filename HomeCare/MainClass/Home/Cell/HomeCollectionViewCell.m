//
//  HomeCollectionViewCell.m
//  HomeCare
//
//  Created by chh on 2017/12/30.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "HomeCollectionViewCell.h"
@interface HomeCollectionViewCell()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel, *subTitleLabel;
@end
@implementation HomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = [UIColor whiteColor];
    
    _iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(25*UIRate);
        make.centerX.equalTo(self.contentView);
        make.top.offset(10*UIRate);
    }];
    
    _subTitleLabel = [UILabel createCenterLabelWithText:@"最新资讯推送" color:[UIColor fontColorLightGray]];
    [self.contentView addSubview:_subTitleLabel];
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.bottom.offset(-8*UIRate);
    }];
    
    _titleLabel = [UILabel createCenterLabelWithText:@"健康生活" color:[UIColor fontColorBlack]];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_subTitleLabel.mas_top).offset(-3*UIRate);
        make.centerX.equalTo(self.contentView);
    }];
}
@end
