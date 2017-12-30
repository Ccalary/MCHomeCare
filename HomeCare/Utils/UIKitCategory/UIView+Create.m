//
//  UIView+Create.m
//  HomeCare
//
//  Created by chh on 2017/12/30.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "UIView+Create.h"

@implementation UIView (Create)
/**
 创建View
 
 @param color 背景色
 @return view
 */
+ (UIView *)createViewWithBgColor:(UIColor *)color{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    return view;
}
@end
