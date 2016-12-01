//
//  XYScrollLayerView.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/24.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYScrollLayerView.h"

@implementation XYScrollLayerView
+ (Class)layerClass {
    return [CAScrollLayer class];
}

- (void)setUp {
    self.layer.masksToBounds = YES;
    UIPanGestureRecognizer *re = nil;
    re = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:re];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
    
    
}

- (void)pan:(UIPanGestureRecognizer *)re {
    CGPoint offset = self.bounds.origin;
    offset.x = offset.x - [re translationInView:self].x;
    offset.y = offset.y - [re translationInView:self].y;
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    
    [re setTranslation:CGPointZero inView:self];
}


@end
