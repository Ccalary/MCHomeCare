//
//  UIButton+Create.h
//  HomeCare
//
//  Created by caohouhong on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Create)
+ (UIButton *)createNormalButtonWithTitle:(NSString *)title;

/**
 创建按钮(上图下字)

 @param frame 布局
 @param title 标题
 @param font 字体大小
 @param textColor 颜色
 @param image 图片
 @param gap 间距
 @return button
 */
+ (UIButton *)createTopButtonWithFrame:(CGRect)frame
                                 title:(NSString *)title
                                  font:(UIFont *)font
                             textColor:(UIColor *)textColor
                                 image:(NSString *)image
                                   gap:(CGFloat)gap;
@end
