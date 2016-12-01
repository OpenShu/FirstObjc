//
//  XYHideAnimationViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/12/1.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYHideAnimationViewController.h"

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
