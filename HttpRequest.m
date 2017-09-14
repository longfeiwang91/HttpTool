
//
//  HttpRequest.m
//  SDMarketingManagement
//
//  Created by Longfei on 16/6/20.
//  Copyright © 2016年 slovelys. All rights reserved.
//

#import "HttpRequest.h"
#import "AFNetworking.h"

@implementation LFUploadFileModel

@end

@implementation HttpRequest

/*!
 @method
 @brief 多部分上传
 @pram dataAry SDUploadFileModel的集合
 */
+ (void)multipartPostFileDataWithPath:(NSString*)path params:(NSDictionary*)params dataAry:(NSMutableArray*)dataAry success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    NSLog(@"url%@",path);
    NSLog(@"参数%@",params);
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    [manager setResponseSerializer:responseSerializer];
    
    [manager POST:path
       parameters:params
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    for (SDUploadFileModel* uploadModel in dataAry) {
        [formData appendPartWithFileData:uploadModel.fileData name:@"fileShow" fileName:uploadModel.fileName mimeType:uploadModel.mimeType];
    }
}
          success:^(AFHTTPRequestOperation* operation, id responseObject) {
              
              NSData* JSONData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
              NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
              if ([[dic valueForKey:@"status"] intValue] == 401) {
                 
              }
              else {
                  success(dic);
              }
              
              NSLog(@"当前请求的结果是:%@\r\n", operation.responseString);
          }
          failure:^(AFHTTPRequestOperation* operation, NSError* error) {
              failure(error);
          }];
}

+ (void)multipartPostWithPath:(NSString*)path params:(NSDictionary*)params files:(NSDictionary<NSString*, NSArray<SDUploadFileModel*>*>*)files success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    
    NSLog(@"url=>：%@",path);
    NSLog(@"参数=>：%@",params);
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    [manager setResponseSerializer:responseSerializer];
    
    [manager POST:path
       parameters:params
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [files enumerateKeysAndObjectsUsingBlock:^(NSString* _Nonnull name, NSArray<SDUploadFileModel*>* _Nonnull fileModels, BOOL* _Nonnull stop) {
        [fileModels enumerateObjectsUsingBlock:^(SDUploadFileModel* _Nonnull file, NSUInteger idx2, BOOL* _Nonnull stop) {
            [formData appendPartWithFileData:file.fileData name:name fileName:file.fileName mimeType:file.mimeType];
        }];
    }];
}
          success:^(AFHTTPRequestOperation* operation, id responseObject) {
              
              NSData* JSONData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
              NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
              if ([[dic valueForKey:@"status"] intValue] == 401) {
                 
              }
              else {
                  success(dic);
              }
              
              NSLog(@"当前请求的结果是:%@\r\n", operation.responseString);
          }
          failure:^(AFHTTPRequestOperation* operation, NSError* error) {
              failure(error);
          }];
}

+ (void)httpPostPath:(NSString*)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    NSLog(@"url=>：%@",path);
    NSLog(@"参数=>：%@",params);
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@", VAL_token] forHTTPHeaderField:@"token"];
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    [manager setResponseSerializer:responseSerializer];
    
    [manager POST:path
       parameters:params
          success:^(AFHTTPRequestOperation* operation, id responseObject) {
              NSLog(@"当前请求的结果是:%@\r\n", operation.responseString);
              success(operation.responseString);
          }
          failure:^(AFHTTPRequestOperation* operation, NSError* error) {
              failure(error);
          }];
}

+ (void)postWithPath:(NSString*)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    
    NSLog(@"url=>：%@",path);
    NSLog(@"参数=>：%@",params);
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@", VAL_token] forHTTPHeaderField:@"token"];
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    [manager setResponseSerializer:responseSerializer];
    
    [manager POST:path
       parameters:params
          success:^(AFHTTPRequestOperation* operation, id responseObject)
     {
         NSLog(@"当前请求的结果是:%@\r\n", operation.responseString);
         NSData* JSONData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
         NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
         if ([[dic valueForKey:@"status"] intValue] == 401) {
           
         }
         else {
             success(dic);
         }
     }
          failure:^(AFHTTPRequestOperation* operation, NSError* error) {
              failure(error);
          }];
}

+ (void)getWithPath:(NSString*)path params:(NSDictionary*)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    
    NSLog(@"url=>：%@",path);
    NSLog(@"参数=>：%@",params);
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:@"ZTA0MDQ1MDI5MGM2NGFiNzk2YzBlZGNjNDA0ZDU0MGM=" forHTTPHeaderField:@"token"];
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    [manager setResponseSerializer:responseSerializer];
    
    [manager GET:path
      parameters:params
         success:^(AFHTTPRequestOperation* operation, id responseObject)
     {
         NSLog(@"当前请求的结果是:%@\r\n", operation.responseString);
         NSData* JSONData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
         NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
         if ([[dic valueForKey:@"status"] intValue] == 401) {
            
         }
         else {
             success(dic);
         }
         
     }
         failure:^(AFHTTPRequestOperation* operation, NSError* error) {
             failure(error);
         }];
}

+ (void)putWithPath:(NSString*)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    
    NSLog(@"url=>：%@",path);
    NSLog(@"参数=>：%@",params);
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@", VAL_token] forHTTPHeaderField:@"token"];
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    [manager setResponseSerializer:responseSerializer];
    
    [manager PUT:path parameters:params success:^(AFHTTPRequestOperation* operation, id responseObject)
     {
         NSLog(@"当前请求的结果是:%@\r\n", operation.responseString);
         NSData* JSONData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
         NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
         if ([[dic valueForKey:@"status"] intValue] == 401) {
         }
         else {
             success(dic);
         }
         
     }
         failure:^(AFHTTPRequestOperation* operation, NSError* error) {
             failure(error);
         }];
}

+ (void)deleteWithPath:(NSString*)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    
    NSLog(@"url=>：%@",path);
    NSLog(@"参数=>：%@",params);
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@", VAL_token] forHTTPHeaderField:@"token"];
    AFJSONResponseSerializer* responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.removesKeysWithNullValues = YES;
    [manager setResponseSerializer:responseSerializer];
    
    [manager DELETE:path parameters:params success:^(AFHTTPRequestOperation* operation, id responseObject)
     {
         NSLog(@"当前请求的结果是:%@\r\n", operation.responseString);
         NSData* JSONData = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
         NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
         if ([[dic valueForKey:@"status"] intValue] == 401) {
           
         }
         else {
             success(dic);
         }
         
     }
            failure:^(AFHTTPRequestOperation* operation, NSError* error) {
                failure(error);
            }];
}

@end
