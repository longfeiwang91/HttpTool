//
//  HttpRequest.h
//  SDMarketingManagement
//
//  Created by Longfei on 16/6/20.
//  Copyright © 2016年 slovelys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFUploadFileModel : NSObject

/// 文件流
@property (nonatomic, strong) NSData* fileData;
/// 文件名.要求唯一的
@property (nonatomic, copy) NSString* fileName;
/// 文件mimeType
@property (nonatomic,copy) NSString *mimeType;

/// 长度
@property (nonatomic,copy) NSString *duration;

@end

@interface HttpRequest : NSObject

typedef void (^HttpSuccessBlock)(id JSON);
typedef void (^HttpFailureBlock)(NSError* error);

/**
 *  多部分多文件上传
 *
 *  @param path    路径
 *  @param params  参数
 *  @param files   文件数组（以表单name为key, SDUploadFileModel数组为value）
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)multipartPostWithPath:(NSString*)path params:(NSDictionary*)params files:(NSDictionary<NSString*, NSArray<SDUploadFileModel*>*>*)files success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

/*!
 @method
 @brief 多部分上传
 @pram dataAry [SDUploadFileModel的集合]
 */
+ (void)multipartPostFileDataWithPath:(NSString*)path params:(NSDictionary*)params dataAry:(NSArray*)dataAry success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

+ (void)postWithPath:(NSString*)path params:(NSDictionary*)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

+ (void)getWithPath:(NSString*)path params:(NSDictionary*)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

+ (void)httpPostPath:(NSString*)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

+ (void)putWithPath:(NSString*)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

+ (void)deleteWithPath:(NSString*)path params:(id)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;


@end
