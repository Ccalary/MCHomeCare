//
//  UIView+Create.h
//  HomeCare
//
//  Created by chh on 2017/12/30.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Create)
/**
 创建View

 @param color 背景色
 @return view
 */
+ (UIView *)createViewWithBgColor:(UIColor *)color;
@end
