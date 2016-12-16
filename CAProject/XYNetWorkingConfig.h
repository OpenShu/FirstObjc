//
//  XYNetWorkingConfig.h
//  CAProject
//
//  Created by shubochao on 2016/12/6.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYNetWorkingConfig : NSObject
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
+ (XYNetWorkingConfig *)shareConfig;


@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSString *cdnUrl;

@end
