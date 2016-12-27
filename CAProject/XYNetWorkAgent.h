//
//  XYNetWorkAgent.h
//  CAProject
//
//  Created by shubochao on 2016/12/2.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class XYBaseRequest;

@interface XYNetWorkAgent : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

+ (XYNetWorkAgent *)sharedAgent;

- (void)addRequest:(XYBaseRequest *)request;
- (void)cancelRequest:(XYBaseRequest *)request;

- (void)cancelAllRequests;

- (NSString *)buildRequestUrl:(XYBaseRequest *)request;

@end
NS_ASSUME_NONNULL_END
