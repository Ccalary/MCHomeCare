//
//  UIButton+Create.m
//  HomeCare
//
//  Created by caohouhong on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "UIButton+Create.h"

@implementation UIButton (Create)
+ (UIButton *)createNormalButtonWithTitle:(NSString *)title{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = FONT_SYSTEM(15);
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}
+ (UIButton *)createTopButtonWithFrame:(CGRect)frame
                                 title:(NSString *)title
                                  font:(UIFont *)font
                             textColor:(UIColor *)textColor
                                 image:(NSString *)image
                                   gap:(CGFloat)gap{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    CGSize imageSize = button.imageView.frame.size;
    CGSize titleSizse = button.titleLabel.frame.size;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -imageSize.height - gap, 0);
    button.imageEdgeInsets = UIEdgeInsetsMake(-titleSizse.height - gap, 0, 0, -titleSizse.width);
    return button;
}
@end
