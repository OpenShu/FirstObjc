//
//  XYNetWorkingConfig.h
//  CAProject
//
//  Created by shubochao on 2016/12/6.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@class XYBaseRequest;
@class AFSecurityPolicy;

@protocol YTKUrlFilterProtocol <NSObject>

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(XYBaseRequest *)request;
@end

@protocol YTKCacheDirPathFilterProtocol <NSObject>
- (NSString *)filterCacheDirPath:(NSString *)originPath withRequest:(XYBaseRequest *)request;
@end

@interface XYNetWorkingConfig : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
+ (XYNetWorkingConfig *)shareConfig;


@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSString *cdnUrl;

@property (nonatomic, strong, readonly) NSArray<id<YTKUrlFilterProtocol>> *urlFilters;
@property (nonatomic, strong, readonly) NSArray<id<YTKCacheDirPathFilterProtocol>> *cacheDirPathFilters;
@property (nonatomic, strong) AFSecurityPolicy *securityPolicy;
@property (nonatomic) BOOL debugLogEnabled;

- (void)addUrlFilter:(id<YTKUrlFilterProtocol>)filter;
- (void)clearUrlFilter;
- (void)addCacheDirPathFilter:(id<YTKCacheDirPathFilterProtocol>)filter;
- (void)clearCacheDirPathFilter;
@end

NS_ASSUME_NONNULL_END
