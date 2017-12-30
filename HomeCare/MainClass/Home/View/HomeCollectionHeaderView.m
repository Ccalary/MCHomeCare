//
//  HomeCollectionHeaderView.m
//  HomeCare
//
//  Created by chh on 2017/12/30.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "HomeCollectionHeaderView.h"
#import "SDCycleScrollView.h"
@interface HomeCollectionHeaderView()<SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *advScrollView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@end

@implementation HomeCollectionHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        _imageArray = [NSMutableArray array];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self initBannerView];
    
    UIView *holdView = [UIView createViewWithBgColor:[UIColor whiteColor]];
    [self addSubview:holdView];
    [holdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.advScrollView.mas_bottom).offset(15*UIRate);
        make.left.offset(10*UIRate);
        make.right.offset(-10*UIRate);
        make.height.mas_equalTo(80*UIRate);
    }];
    
    CGRect btnFrame = CGRectMake(0, 0, 80*UIRate, 80*UIRate);
    UIButton *btn1 = [UIButton createTopButtonWithFrame:btnFrame title:@"养老门户" font:FONT_SYSTEM(12) textColor:[UIColor fontColorDarkGray] image:@"g_apple_50" gap:2];
    [holdView addSubview:btn1];
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80*UIRate, 80*UIRate)];
//    [button setTitle:@"养老门户" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor fontColorBlack] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"g_apple_50"] forState:UIControlStateNormal];
//    [holdView addSubview:button];
//    CGSize imageSize = button.imageView.frame.size;
//    CGSize titleSizse = button.titleLabel.frame.size;
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -imageSize.height - 5, 0);
//    button.imageEdgeInsets = UIEdgeInsetsMake(-titleSizse.height - 5, 0, 0, -titleSizse.width/2.0);
    
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(80*UIRate);
//        make.left.centerY.equalTo(holdView);
//    }];
}

- (void)initBannerView{
    _advScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, 210*UIRate)  delegate:self placeholderImage:[UIImage imageNamed:@"h_banner_375x210"]];
    _advScrollView.backgroundColor = [UIColor whiteColor];
    
//    __weak typeof (self) weakSelf = self;
    _advScrollView.clickItemOperationBlock  = ^(NSInteger i){
        
    };
    _advScrollView.autoScrollTimeInterval = 3.0f;
    _advScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    
    [self addSubview:_advScrollView];
    [_imageArray addObject:@"h_banner_375x210"];
    [_imageArray addObject:@"h_banner_375x210"];
    [_imageArray addObject:@"h_banner_375x210"];
    _advScrollView.imageURLStringsGroup = self.imageArray;
}
@end
