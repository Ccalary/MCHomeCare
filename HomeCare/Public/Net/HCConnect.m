//
//  HCConnect.m
//  HomeCare
//
//  Created by chh on 2017/12/27.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "HCConnect.h"
#import "NetUrlMacro.h"
#import "Connect.h"

@implementation HCConnect
+ (NSMutableDictionary *)getBaseRequestParams
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    return params;
}

#pragma mark - ===============首页(Home)==================
/**
 * 历史视频接口
 */
+ (void)postVideoList:(NSMutableDictionary *_Nullable) params loading:(NSString *_Nullable)text success:(void (^_Nullable)(id _Nonnull response))success successBackFail:(void (^_Nonnull)(id _Nonnull response))successBackFail failure:(void (^_Nullable)(NSURLSessionDataTask * _Nullable operation, NSError * _Nullable error))failure
{
    [[Connect sharedInstance] postWithUrl:HOME_GET_LIST_HOME_ALL parameters:params loadingText:text success:^(id response) {
        success(response);
    } successBackFail:^(id response) {
        successBackFail(response);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        failure(operation,error);
    }];
}

/**
 * 更新历史视频接口
 */
+ (void)postVideoUpdateInfo:(NSMutableDictionary *_Nullable) params loading:(NSString *_Nullable)text success:(void (^_Nullable)(id _Nonnull response))success successBackFail:(void (^_Nonnull)(id _Nonnull response))successBackFail
{
    [[Connect sharedInstance] postWithUrl:HOME_GET_LIST_HOME_ALL parameters:params loadingText:text success:^(id response) {
        success(response);
    } successBackFail:^(id response) {
        successBackFail(response);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
    }];
}

@end
