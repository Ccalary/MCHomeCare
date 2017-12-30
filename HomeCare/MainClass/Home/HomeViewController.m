//
//  HomeViewController.m
//  HomeCare
//
//  Created by caohouhong on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionHeaderView.h"
@interface HomeViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *mCollectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) HomeCollectionHeaderView *headerView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)initView{
    CGFloat ItemWidth = (ScreenWidth - 2)/3.0;
    CGFloat ItemHeight = 130*UIRate;
    UICollectionViewFlowLayout * aLayOut = [[UICollectionViewFlowLayout alloc]init];
    aLayOut.itemSize = CGSizeMake(ItemWidth, ItemHeight);
    aLayOut.minimumLineSpacing = 1;
    aLayOut.minimumInteritemSpacing = 0;
    aLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
    _mCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - TopFullHeight) collectionViewLayout:aLayOut];
    [_mCollectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:@"CellIdentifier"];
    [_mCollectionView registerClass:[HomeCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER"];
    _mCollectionView.delegate = self;
    _mCollectionView.dataSource = self;
    _mCollectionView.alwaysBounceVertical = YES;//内容不充满也能滑动
    _mCollectionView.backgroundColor = [UIColor bgColorMain];
    [self.view addSubview:_mCollectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

//cell的记载
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    return cell;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//header加载
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqual:UICollectionElementKindSectionHeader] ) {
        self.headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HEADER" forIndexPath:indexPath];
        return self.headerView;
    }
    
    return nil;
}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 400*UIRate);
}
@end
