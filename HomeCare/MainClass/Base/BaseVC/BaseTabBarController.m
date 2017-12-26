//
//  BaseTabBarController.m
//  HomeCare
//
//  Created by caohouhong on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBar *tabbar = [UITabBar appearance];
    tabbar.tintColor = [UIColor grayColor];
    
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//添加子控制器
- (void)addChildViewControllers{
    [self addChildrenViewController:[[HomeViewController alloc] init] andTitle:@"查询" andImageName:@"tab_search" andSelectImage:@"tab_search_pre"];
    [self addChildrenViewController:[[HomeViewController alloc] init] andTitle:@"起名" andImageName:@"tab_home" andSelectImage:@"tab_home_pre"];
    [self addChildrenViewController:[[HomeViewController alloc] init] andTitle:@"商标" andImageName:@"tab_brand" andSelectImage:@"tab_brand_pre"];
    [self addChildrenViewController:[[HomeViewController alloc] init] andTitle:@"我" andImageName:@"tab_me" andSelectImage:@"tab_me_pre"];
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage =  [UIImage imageNamed:selectedImage];
    childVC.title = title;
    
    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:baseNav];
}

@end
