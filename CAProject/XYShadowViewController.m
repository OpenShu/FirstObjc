//
//  XYShadowViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/15.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYShadowViewController.h"

@interface XYShadowViewController ()

@end

@implementation XYShadowViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // 阴影
//    self.layerView1.layer.shadowOpacity = 0.5;
//    self.layerView2.layer.shadowOpacity = 0.5;
//    CGMutablePathRef squarePath = CGPathCreateMutable();
//    CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
//    self.layerView1.layer.shadowPath = squarePath;
//    CGPathRelease(squarePath);
//    
//    CGMutablePathRef circlePath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
//    self.layerView2.layer.shadowPath = circlePath;
//    CGPathRelease(circlePath);
    CATransform3D transform = CATransform3DMakeTranslation(100, 0, 0);
//    transform = CGAffineTransformScale(transform, 0.5, 0.5);
//    transform = CGAffineTransformRotate(transform, M_PI / 180 * 30);
//    transform = CGAffineTransformTranslate(transform, 200, 0);
    
//    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
 
    transform = CATransform3DMakeTranslation(0, -100, 0);
   // transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    self.layerView1.layer.transform = transform;
    
//    CALayer *layer = [CALayer layer];
//    layer.frame = CGRectMake(0, 0, self.layerView2.bounds.size.width - 20, self.layerView2.bounds.size.height - 20);
//    layer.backgroundColor = [UIColor greenColor].CGColor;
//    [self.layerView2.layer addSublayer:layer];
//    layer.doubleSided = NO;
//    CATransform3D transform3D = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
//    self.layerView2.layer.transform = transform3D;
    
    
    CATransform3D transform3D = CATransform3DIdentity;
   // transform3D.m34 = - 1.0 / 500;
    transform3D = CATransform3DRotate(transform3D, M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform3D;
    
   // CATransform3D inner = CATransform3DIdentity;
   // inner.m34 = -1.0 / 500;
  //  self.inLayView2.layer.transform = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    
    
}

- (void)viewWillAppear:(BOOL)animated {


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
