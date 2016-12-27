//
//  XYCATimeViewController.m
//  CAProject
//
//  Created by shubochao on 2016/12/21.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYCATimeViewController.h"

@interface XYCATimeViewController ()
@property (nonatomic, strong) CALayer *shipLayer;
@property (nonatomic, strong) UIBezierPath *bPath;
@property (nonatomic, strong) CALayer *doorLayer;
@end

@implementation XYCATimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createLayer];
   // [self createTimeAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createLayer {
    self.doorLayer = [CALayer layer];
    _doorLayer.frame = CGRectMake(0, 0, 128, 256);
    _doorLayer.position = CGPointMake(150-64, 150);
    _doorLayer.backgroundColor = [UIColor redColor].CGColor;
    _doorLayer.anchorPoint = CGPointMake(0,0.5);
    [self.containView.layer addSublayer:_doorLayer];
    
    CATransform3D pre = CATransform3DIdentity;
    pre.m34 = -1.0 / 500.0;
    self.containView.layer.sublayerTransform  = pre;
    
    // 手势控制
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    _doorLayer.speed =  0.0;
    
    
    CABasicAnimation *animtion = [CABasicAnimation animation];
    animtion.keyPath = @"transform.rotation.y";
    animtion.toValue = @(-M_PI);
    animtion.duration = 2.0;
    // 重复时间 重复回放
//    animtion.repeatDuration = INFINITY;
//    animtion.autoreverses = YES;
    // 重复次数
   // animtion.repeatCount = 3;
    [_doorLayer addAnimation:animtion forKey:nil];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    CGFloat x = [pan translationInView:self.view].x;
    x = x / 200.0;
    CFTimeInterval timeOffset = self.doorLayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    self.doorLayer.timeOffset = timeOffset;
    [pan setTranslation:CGPointZero inView:self.view];
}
- (void)createTimeAnimation {
    self.bPath = [[UIBezierPath alloc] init];
    [_bPath moveToPoint:CGPointMake(0, 150)];
    [_bPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    CAShapeLayer *bLayer = [CAShapeLayer layer];
    bLayer.path = _bPath.CGPath;
    bLayer.fillColor = [UIColor clearColor].CGColor;
    bLayer.strokeColor = [UIColor redColor].CGColor;
    bLayer.lineWidth = 3.0f;
    [self.containView.layer addSublayer:bLayer];
    
    self.shipLayer = [CALayer layer];
    _shipLayer.frame = CGRectMake(0, 0, 25, 25);
    _shipLayer.position = CGPointMake(0, 150);
    _shipLayer.contents = (__bridge id)[UIImage imageNamed:@"下"].CGImage;
    [self.containView.layer addSublayer:_shipLayer];
    [self updateSliders];

}

- (void)updateSliders {
    CFTimeInterval timeoffset = self.timeSlider.value;
    self.timeLabel.text = [NSString stringWithFormat:@"%0.2f",timeoffset];
    float speed = self.speedSlider.value;
    self.speedLabel.text = [NSString stringWithFormat:@"%0.2f",speed];
}

- (IBAction)play:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.timeOffset = self.timeSlider.value;
    animation.speed = self.speedSlider.value;
    animation.duration = 1.0;
    animation.path = self.bPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    animation.removedOnCompletion = NO;
    [self.shipLayer addAnimation:animation forKey:nil];
}
@end
