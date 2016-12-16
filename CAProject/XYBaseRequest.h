//
//  XYBaseRequest.h
//  CAProject
//
//  Created by shubochao on 2016/12/6.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <Foundation/Foundation.h>
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


@interface XYBaseRequest : NSObject

@end
