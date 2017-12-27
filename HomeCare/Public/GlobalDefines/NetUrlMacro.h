//
//  NetUrlMacro.h
//  LiveHome
//
//  Created by chh on 2017/10/27.
//  Copyright © 2017年 chh. All rights reserved.
//

#ifndef NetUrlMacro_h
#define NetUrlMacro_h
//0,1 来控制走生产还是测试
#if 1

//测试（服务器与图片地址）
#define BASE_URL_REl            @"http://www.58caibiao.com:8790/testapiprj"
#define IMAGES_OSS_PIC          @"http://imgcdn.58caibiao.com/filetest"
#else

//生产（服务器与图片地址）
#define BASE_URL_REl          @"http://www.58caibiao.com:8788/cbapiprj"
#define IMAGES_OSS_PIC        @"http://imgcdn.58caibiao.com/file"

#endif

//图片地址
#define IMAGE_URL(urlStr)       [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGES_OSS_PIC,urlStr]]


#pragma mark -  ============1.首页(HOME)============
/*******************首页(HOME)*********************/
//1.0 首页信息
#define HOME_GET_LIST_HOME_ALL   BASE_URL_REl@"/webService/task/listHomeAll"



#endif /* NetUrlMacro_h */
