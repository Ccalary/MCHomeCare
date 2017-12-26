//
//  UILabel+Create.m
//  HomeCare
//
//  Created by caohouhong on 2017/12/26.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "UILabel+Create.h"

@implementation UILabel (Create)
+ (UILabel *)createNormalLabelWithText:(NSString *)text{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.font = FONT_SYSTEM(15);
    return label;
}
@end
