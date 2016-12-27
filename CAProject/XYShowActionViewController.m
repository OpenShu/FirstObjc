//
//  XYShowActionViewController.m
//  CAProject
//
//  Created by shubochao on 2016/12/16.
//  Copyright © 2016年 shubochao. All rights reserved.
//
/**
 CABase,CAKeyFrame都是 CAPropertyAnimation的子类
 CAPropertyAnimation，CAGroupAnimation,CATransition都是CAAnimation子类
 */

#import "XYShowActionViewController.h"

@interface XYShowActionViewController ()<CAAnimationDelegate>
@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, copy) NSArray *images;
@end

@implementation XYShowActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
  //  [self.layerView.layer addSublayer:self.colorLayer];
   // [self createBePath];
   // [self createTransForm];
  //  [self createGroupAnimation];
   // [self createTransitionAnimation];
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

// 开始到结束动画 CABasicAnimation
- (void)createStratAndEnd {
    
        CGFloat red = arc4random() / (CGFloat)INT_MAX;
        CGFloat green = arc4random() / (CGFloat)INT_MAX;
        CGFloat blue = arc4random() / (CGFloat)INT_MAX;
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = @"backgroundColor";
        animation.toValue = (__bridge id)color.CGColor;
        animation.delegate = self;
        [self.colorLayer addAnimation:animation forKey:nil];
}


// 连续动画，不仅仅是开始到结果，是一系列的 (CAKeyframeAnimation)
- (IBAction)clickBTn:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[(__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor
                        ];
    // 是动画更加平滑 (缓冲)
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.timingFunctions  = @[fn,fn,fn];
    animation.repeatDuration = INFINITY;
    animation.autoreverses = YES;
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit];

}

// 结合bz曲线 （CAKeyframeAnimation的path属性）
- (void)createBePath {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(30, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.layerView.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 15, 15);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"下"].CGImage;
    [self.layerView.layer addSublayer:shipLayer];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.duration = 4.0;
    animation.path = path.CGPath;
    [shipLayer addAnimation:animation forKey:nil];
}

// 缩放，平移，旋转动画 CABasicAnimation 用transform.rotation等虚拟属性使得动画更简单流畅
- (void)createTransForm {
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 15, 15);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"下"].CGImage;
    [self.layerView.layer addSublayer:shipLayer];
    CABasicAnimation *animation = [CABasicAnimation animation];
    //animation.keyPath = @"transform";
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0f;
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    animation.byValue = @(M_PI * 2);
    [shipLayer addAnimation:animation forKey:nil];
}

// 动画组（关键帧动画和基础动画组合）
- (void)createGroupAnimation {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.layerView.layer addSublayer:pathLayer];
    
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 64, 64);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.layerView.layer addSublayer:colorLayer];
    
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = path.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor
    ;
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[animation1,animation2];
    groupAnimation.duration = 4.0;
    [colorLayer addAnimation:groupAnimation forKey:nil];
}

// transition 动画
- (void)createTransitionAnimation {
    self.images = @[[UIImage imageNamed:@"上"],[UIImage imageNamed:@"中"],[UIImage imageNamed:@"下"]];
    
}



- (IBAction)imageBtn:(id)sender {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    [self.AnimationImageView.layer addAnimation:transition forKey:nil];
    UIImage *cImage = self.AnimationImageView.image;
    NSUInteger index = [self.images indexOfObject:cImage];
    index = (index + 1) % [_images count];
    self.AnimationImageView.image = self.images[index];
    
}
@end
