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
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation XYHideAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backColorLayer = [CALayer layer];
    _backColorLayer.frame = self.containerView.bounds;
    _backColorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //动画行为，决定动画的行为
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    _backColorLayer.actions = @{@"backgroundColor":transition};;
    [self.containerView.layer addSublayer:_backColorLayer];
    [self testShowLayer];
}

- (void)testShowLayer {
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0,64, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

//手势
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    // self.colorLayer.presentationLayer 得到呈现图层
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    } else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

- (void)changeColor:(id)sender {
    // 动画的事务，决定这动画的开始，结束，和执行时间
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    // 做完颜色变化后旋转
//    __weak XYHideAnimationViewController *weakSelf = self;
//    [CATransaction setCompletionBlock:^{
//        CGAffineTransform transform = weakSelf.backColorLayer.affineTransform;
//        transform = CGAffineTransformRotate(transform, M_PI/2);
//        weakSelf.backColorLayer.affineTransform = transform;
//    }];
    // 隐藏动画
//    [CATransaction setDisableActions:YES];
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
