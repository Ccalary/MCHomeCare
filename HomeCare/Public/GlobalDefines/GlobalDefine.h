//
//  GlobalDefine.h
//  HHFramework
//
//  Created by chh on 2017/7/29.
//  Copyright © 2017年 chh. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h

//大小尺寸（宽、高）
#define ScreenWidth                     [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                    [[UIScreen mainScreen] bounds].size.height
//statusBar高度
#define StatusBarHeight                 [UIApplication sharedApplication].statusBarFrame.size.height
//navBar高度
#define NavigationBarHeight             [[UINavigationController alloc] init].navigationBar.frame.size.height
//TabBar高度  iPhoneX 高度为83
#define TabBarHeight                    ((StatusBarHeight > 20.0f) ? 83.0f : 49.0f)
//nav顶部高度
#define TopFullHeight                   (StatusBarHeight + NavigationBarHeight)
//屏幕适配
#define UIRate                          (ScreenWidth/375.0)

//rgb颜色
#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:1.0]

//rgbA颜色（带透明度）
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

//font
#define FONT_SYSTEM(x)               [UIFont systemFontOfSize:x*UIRate] //已适配
#define FONT_SYSTEM_BOLD(x)          [UIFont boldSystemFontOfSize:x*UIRate]

//Debug信息,用printf解决真机调试打印不出来的问题
#ifdef DEBUG
# define DLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
# define DLog(...);
#endif

#endif /* GlobalDefine_h */
