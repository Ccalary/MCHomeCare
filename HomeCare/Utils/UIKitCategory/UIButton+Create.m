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
@end
