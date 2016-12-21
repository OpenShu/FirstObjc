//
//  YTKBatchRequest.h
//  CAProject
//
//  Created by shubochao on 2016/12/20.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class YTKRequest;
@class YTKBatchRequest;
@protocol YTKRequestAccessory;

@protocol YTKBatchRequestDelegate <NSObject>

@optional
///  Tell the delegate that the batch request has finished successfully/
///
///  @param batchRequest The corresponding batch request.
- (void)batchRequestFinished:(YTKBatchRequest *)batchRequest;

///  Tell the delegate that the batch request has failed.
///
///  @param batchRequest The corresponding batch request.
- (void)batchRequestFailed:(YTKBatchRequest *)batchRequest;

@end

@interface YTKBatchRequest : NSObject
@property (nonatomic, strong, readonly) NSArray<YTKRequest *> *requestArray;
//
@property (nonatomic, weak, nullable) id<YTKBatchRequestDelegate> delegate;
//
@property (nonatomic, copy, nullable) void (^successCompletionBlock)(YTKBatchRequest *);
@property (nonatomic, copy, nullable) void (^failureCompletionBlock)(YTKBatchRequest *);
//
@property (nonatomic) NSInteger tag;
//
@property (nonatomic, strong, nullable) NSMutableArray<id<YTKRequestAccessory>> *requestAccessories;
//
@property (nonatomic, strong, readonly, nullable) YTKRequest *failedRequest;

@end


NS_ASSUME_NONNULL_END
