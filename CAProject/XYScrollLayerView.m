//
//  XYScrollLayerView.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/24.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYScrollLayerView.h"

@interface XYScrollLayerView ()
@property (nonatomic,strong) CALayer *backLayer;
@end

@implementation XYScrollLayerView
//+ (Class)layerClass {
//    return [CAScrollLayer class];
//}

- (void)setUp {
//    UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
//    [self addSubview:backView];
    self.backLayer = [CALayer layer];
    _backLayer.frame = self.bounds;
    _backLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:_backLayer];
    
    
    [UIView beginAnimations:nil context:nil];
    [CATransaction begin];
    [CATransaction setAnimationDuration:5.0];
    _backLayer.backgroundColor = [UIColor yellowColor].CGColor;
    NSLog(@"%@...",[self actionForLayer:self.backLayer forKey:@"backgroundColor"]);
    [CATransaction commit];
    [UIView commitAnimations];
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
