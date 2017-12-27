//
//  Connect.m
//  LiveHome
//
//  Created by chh on 2017/11/17.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "Connect.h"
#import "BaseModel.h"
#import "AFNetworking.h"

@implementation Connect
+ (Connect *)sharedInstance {
    static Connect * _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[Connect alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - POST/GET请求
//get
- (void)getWithUrl:(NSString*)url
        parameters:(id)parameters
       loadingText:(NSString *)text
           success:(void (^)(id response))success
   successBackFail:(void (^)(id response))successBackFail
           failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure{
    if (text.length > 0){
        [LCProgressHUD showLoading:text];
    }
    [self doRequestWithType:ConnectRequestTypeGet url:url parameters:parameters success:^(id responseObject) {
        success(responseObject);
    } successBackfailError:^(id responseObject) {
        successBackFail(responseObject);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        failure(operation,error);
    }];
}
//post
- (void)postWithUrl:(NSString*)url
        parameters:(id)parameters
       loadingText:(NSString *)text
           success:(void (^)(id response))success
   successBackFail:(void (^)(id response))successBackFail
           failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure{
    if (text.length > 0){
        [LCProgressHUD showLoading:text];
    }
    [self doRequestWithType:ConnectRequestTypePost url:url parameters:parameters success:^(id responseObject) {
        success(responseObject);
    } successBackfailError:^(id responseObject) {
        successBackFail(responseObject);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        failure(operation,error);
    }];
}

//图片资源上传
- (void)postImageWithUrl:(NSString*)url
              parameters:(id)parameters
             loadingText:(NSString *)text
              imageArray:(NSArray <UIImage *>*)array
                 success:(void (^)(id response))success
         successBackFail:(void (^)(id response))successBackFail
                 failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure
{
    if (text.length > 0){
        [LCProgressHUD showLoading:text];
    }
    [self doPostImageWithUrl:url parameters:parameters imageArray:array success:^(id responseObject) {
        success(responseObject);
    } successBackfailError:^(id responseObject) {
         successBackFail(responseObject);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
         failure(operation,error);
    }];
}

/**
 get/post请求

 @param type get/post
 @param url 接口地址
 @param parameters 参数
 @param success 成功
 @param successBackfailError 返回失败
 @param failure 请求失败
 */
- (void)doRequestWithType:(ConnectRequestType)type url:(NSString*)url parameters:(id)parameters success:(void (^)(id responseObject))success
successBackfailError:(void (^)(id responseObject))successBackfailError failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure
{
    DLog(@"url:%@\nparams:%@",url,parameters);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if (type == ConnectRequestTypeGet){
        [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success){
                DLog(@"response:%@",responseObject);
                [self parsingRequestBack:responseObject sucess:success successBackfailError:successBackfailError];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure){
                failure(task,error);
                [LCProgressHUD showKeyWindowFailure:@"网络异常，请稍后再试"];
                DLog(@"POST返回结果:%@", error);
            }
        }];
    }else {
        [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success){
                DLog(@"response:%@",responseObject);
                [self parsingRequestBack:responseObject sucess:success successBackfailError:successBackfailError];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure){
                failure(task,error);
                [LCProgressHUD showKeyWindowFailure:@"网络异常，请稍后再试"];
                DLog(@"POST返回结果:%@", error);
            }
        }];
    }
}

/**
 图片上传（文件流上传）
 
 @param url 接口地址
 @param parameters 参数
 @param array UIImage 的数组
 @param success 成功
 @param successBackfailError 返回失败
 @param failure 请求失败
 */
- (void)doPostImageWithUrl:(NSString*)url
                parameters:(id)parameters
                imageArray:(NSArray <UIImage *>*)array
                   success:(void (^)(id responseObject))success
      successBackfailError:(void (^)(id responseObject))successBackfailError
                   failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure
{
    DLog(@"/n url:%@/n params:%@",url,parameters);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       
        for (UIImage *image in array){
            NSData *imageData = UIImageJPEGRepresentation(image, 0.2);
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat =@"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            //上传的参数(上传图片，以文件流的格式)
            [formData appendPartWithFileData:imageData
                                        name:@"file"
                                    fileName:fileName
                                    mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success){
            DLog(@"图片上传返回结果:%@", responseObject);
            [self parsingRequestBack:responseObject sucess:success successBackfailError:successBackfailError];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure){
            failure(task,error);
            [LCProgressHUD showKeyWindowFailure:@"网络异常，请稍后再试"];
        }
    }];
}

/**
 * 请求成功后的数据解析
 */
- (void)parsingRequestBack:(id)responseObject
                    sucess:(void (^)(id responseObject))success
      successBackfailError:(void (^)(id responseObject))successBackfailError
{
    BaseModel *baseModel = [BaseModel mj_objectWithKeyValues:responseObject];
    if(baseModel.state == 0) //0是成功
    {
        [LCProgressHUD hide];
        success(baseModel.data);
        return;
    }
    if (baseModel.state == 300)//请求失败
    {
        [LCProgressHUD showKeyWindowFailure:@"错误"];
        successBackfailError(baseModel.data);
    }else {
        successBackfailError(baseModel.data);
        [LCProgressHUD hide];
    }
}
@end
