//
//  XYHideAnimationViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/12/1.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYHideAnimationViewController.h"

/**
 属性变化，产生的动画的时间由事务控制，事务的进栈和出栈，决定动画的开始和结束，事务可以设置时间，每个不同动画都对应不同的事务，一个runloop默认事务的进出站时间是0.25
 */
@interface XYHideAnimationViewController ()
@property (nonatomic, strong) CALayer *backColorLayer;
@end

@implementation XYHideAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backColorLayer = [CALayer layer];
    _backColorLayer.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:_backColorLayer];
}

- (void)changeColor:(id)sender {
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    __weak XYHideAnimationViewController *weakSelf = self;
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = weakSelf.backColorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI/2);
        weakSelf.backColorLayer.affineTransform = transform;
    }];
    [CATransaction setDisableActions:YES];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.backColorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
