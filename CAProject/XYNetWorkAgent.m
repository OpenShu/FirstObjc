//
//  XYNetWorkAgent.m
//  CAProject
//
//  Created by shubochao on 2016/12/2.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYNetWorkAgent.h"
#import "XYNetWorkingConfig.h"

#if __has_include(<AFNetworking/AFNetworking.h>)
#import <AFNetworking/AFNetworking.h>
#else
#import "AFNetworking.h"
#endif

@implementation XYNetWorkAgent {
    AFHTTPSessionManager *_manager;
    AFJSONRequestSerializer *_jsonResponseSerializer;
    AFXMLParserResponseSerializer *_xmlParserResponseSerialzier;;
    dispatch_queue_t _processingQueue;
    pthread_mutex_t _lock;
    XYNetWorkingConfig *_config;
    NSIndexSet *_allStatusCodes;
}

+ (XYNetWorkAgent *)shareAgent {
    static id shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        _manager = [AFHTTPSessionManager manager];
//        _processingQueue = dispatch_queue_create("com.xiaoyuan.networkagent.processing", DISPATCH_QUEUE_CONCURRENT);
//        _allStatusCodes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(100, 500)];
//       
//    
//    }
//}

@end
