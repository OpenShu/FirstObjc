//
//  XYBaseRequest.h
//  CAProject
//
//  Created by shubochao on 2016/12/6.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


FOUNDATION_EXPORT NSString *const YTKRequestValidationErrorDomain;

NS_ENUM(NSInteger) {
    YTKRequestValidationErrorInvalidStatusCode = -8,
    YTKRequestValidationErrorInvalidJSONFormat = -9,
};
    
    ///  HTTP Request method.
typedef NS_ENUM(NSInteger, YTKRequestMethod) {
        YTKRequestMethodGET = 0,
        YTKRequestMethodPOST,
        YTKRequestMethodHEAD,
        YTKRequestMethodPUT,
        YTKRequestMethodDELETE,
        YTKRequestMethodPATCH,
};
    
    ///  Request serializer type.
typedef NS_ENUM(NSInteger, YTKRequestSerializerType) {
        YTKRequestSerializerTypeHTTP = 0,
        YTKRequestSerializerTypeJSON,
};

typedef NS_ENUM(NSInteger, YTKResponseSerializerType) {
        /// NSData type
        YTKResponseSerializerTypeHTTP,
        /// JSON object type
        YTKResponseSerializerTypeJSON,
        /// NSXMLParser type
        YTKResponseSerializerTypeXMLParser,
};
    
    ///  Request priority
typedef NS_ENUM(NSInteger, YTKRequestPriority) {
        YTKRequestPriorityLow = -4L,
        YTKRequestPriorityDefault = 0,
        YTKRequestPriorityHigh = 4,
};


@protocol AFMultipartFormData;

typedef void (^AFConstructingBlock)(id <AFMultipartFormData> formData);
typedef void (^AFURLSessionTaskProgressBlock)(NSProgress *);
    
@class YTKBaseRequest;
    typedef void (^YTKRequestCompletionBlock)(__kindof YTKBaseRequest *request);


    @protocol YTKRequestDelegate <NSObject>
    - (void)requestFinished:(__kindof YTKBaseRequest *)request;
    
    ///  Tell the delegate that the request has failed.
    ///
    ///  @param request The corresponding request.
    - (void)requestFailed:(__kindof YTKBaseRequest *)request;
    @end
    
    @protocol YTKRequestAccessory <NSObject>
    @optional
    - (void)requestWillStart:(id)request;
    
    ///  Inform the accessory that the request is about to stop. This method is called
    ///  before executing `requestFinished` and `successCompletionBlock`.
    ///
    ///  @param request The corresponding request.
    - (void)requestWillStop:(id)request;
    
    ///  Inform the accessory that the request has already stoped. This method is called
    ///  after executing `requestFinished` and `successCompletionBlock`.
    ///
    ///  @param request The corresponding request.
    - (void)requestDidStop:(id)request;
@end
    
    
@interface XYBaseRequest : NSObject
//
@property (nonatomic, strong,readonly) NSURLSessionTask *requestTask;
//
@property (nonatomic, strong,readonly) NSURLRequest *currentRequest;
//
@property (nonatomic, strong,readonly) NSURLRequest *originalRequest;
//
@property (nonatomic, strong,readonly) NSHTTPURLResponse *response;
//
@property (nonatomic,readonly) NSInteger resposeStatusCode;
//
@property (nonatomic, strong,readonly,nullable) NSDictionary *responseHeaders;
//
@property (nonatomic, strong,readonly,nullable) NSData *responseData;
//
@property (nonatomic, strong,readonly,nullable) NSString *reponseString;
//
@property (nonatomic, strong,nullable) id responseObject;
//
@property (nonatomic, strong,readonly,nullable) id responseJSONObject;
//
@property (nonatomic, strong,readonly,nullable) NSError *error;
//
@property (nonatomic,readonly,getter=isCancelled) BOOL cancelled;
//
@property (nonatomic,readonly,getter=isExecuting) BOOL executing;

#pragma mark - request configuration
@property (nonatomic) NSInteger tag;
//
@property (nonatomic, strong,nullable) NSDictionary *userInfo;
//
@property (nonatomic, weak,nullable) id<YTKRequestDelegate> delegate;
//
@property (nonatomic, copy, nullable) YTKRequestCompletionBlock
successCompletionBlock;
//
@property (nonatomic, copy, nullable) YTKRequestCompletionBlock failureCompletionBlock;
//
@property (nonatomic, strong, nullable) NSMutableArray<id<YTKRequestAccessory>> *requestAccessories;
//
@property (nonatomic, copy, nullable) AFConstructingBlock constructingBodyBlock;
//
@property (nonatomic, strong, nullable) NSString *resumableDownloadPath;
//
@property (nonatomic, copy, nullable)AFURLSessionTaskProgressBlock resumableDownloadProgressBlock;
//
@property (nonatomic) YTKRequestPriority requestPriority;


//
- (void)setCompletionBlockWithSuccess:(nullable YTKRequestCompletionBlock)success
                              failure:(nullable YTKRequestCompletionBlock)failure;
//
- (void)clearCompletionBlock;

//
- (void)addAccessory:(id<YTKRequestAccessory>)accessory;


#pragma mark - request action
- (void)start;
//
- (void)stop;
//
- (void)startWithCompletionBlockWithSuccess:(nullable YTKRequestCompletionBlock)success
                                    failure:(nullable YTKRequestCompletionBlock)failure;

#pragma mark - Subclass Override
- (void)requestCompletePreprocessor;
//
- (void)requestCompleteFilter;
//
- (void)requestFailedPreprocessor;
//
- (NSString *)baseUrl;
//
- (NSString *)requestUrl;
//
- (NSString *)cdnUrl;
//
- (NSTimeInterval)requestTimeoutInterval;
///  Additional request argument.
- (nullable id)requestArgument;
//
- (id)cacheFileNameFilterForRequestArgument:(id)argument;
//
- (YTKRequestMethod)requestMethod;
///  Request serializer type.
- (YTKRequestSerializerType)requestSerializerType;
//
- (YTKResponseSerializerType)responseSerializerType;
//
- (nullable NSArray<NSString *> *)requestAuthorizationHeaderFieldArray;
//
- (nullable NSDictionary<NSString *, NSString *> *)requestHeaderFieldValueDictionary;

//
- (nullable NSURLRequest *)buildCustomUrlRequest;
//
- (BOOL)useCDN;
//
- (BOOL)allowsCellularAccess;
//
- (nullable id)jsonValidator;
//
- (BOOL)statusCodeValidator;

NS_ASSUME_NONNULL_END
@end
