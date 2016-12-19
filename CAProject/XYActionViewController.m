//
//  XYActionViewController.m
//  CAProject
//
//  Created by shubochao on 2016/12/16.
//  Copyright © 2016年 shubochao. All rights reserved.
//

/// 隐式动画

#import "XYActionViewController.h"

@interface XYActionViewController ()
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation XYActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 50, 50);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.ContainView.layer addSublayer:self.colorLayer];
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:5.0];
//    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
//    [CATransaction commit];
    // 动画行为
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions = @{@"backgroundColor":transition};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickBtn:(id)sender {
    // 动画事务（时间）
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    self.colorLayer.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1].CGColor;
    NSLog(@"%@",self.colorLayer.backgroundColor);
    [CATransaction commit];
    
}

@end
