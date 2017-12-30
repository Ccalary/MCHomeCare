//
//  UILabel+Create.m
//  HomeCare
//
//  Created by caohouhong on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "UILabel+Create.h"

@implementation UILabel (Create)
/**
 创建常规label，默认字体15,居左
 
 @param text text
 @param color 颜色
 @return label
 */
+ (UILabel *)createNormalLabelWithText:(NSString *)text color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    label.font = FONT_SYSTEM(15);
    label.textColor = color;
    label.text = text;
    return label;
}
/**
 创建局中label，默认字体15,居中
 
 @param text text
 @param color 颜色
 @return label
 */
+ (UILabel *)createCenterLabelWithText:(NSString *)text color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    label.font = FONT_SYSTEM(15);
    label.textColor = color;
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
