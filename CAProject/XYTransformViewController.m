//
//  XYTransformViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/16.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYTransformViewController.h"

@interface XYTransformViewController ()
@property(nonatomic, strong) NSMutableArray<UIView*> *faces;
@end

@implementation XYTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.faces = [NSMutableArray array];
//    // Do any additional setup after loading the view from its nib.
//    [self.faces addObject:self.view1];
//    [self.faces addObject:self.view2];
//    [self.faces addObject:self.view3];
//    [self.faces addObject:self.view4];
//    [self.faces addObject:self.view5];
//    [self.faces addObject:self.view6];
//   
//    
//    CATransform3D pers = CATransform3DIdentity;
//    pers.m34 = -1.0 / 500.0;
//    pers = CATransform3DRotate(pers, -M_PI_4, 1, 0, 0);
//    pers = CATransform3DRotate(pers, -M_PI_4, 0, 1, 0);
//    self.containView.layer.sublayerTransform = pers;
//    
//    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
//    [self addFace:0 withTransform:transform];
//    
//    transform = CATransform3DMakeTranslation(100, 0, 0);
//    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
//    [self addFace:1 withTransform:transform];
//    
//    transform = CATransform3DMakeTranslation(0, -100, 0);
//    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
//    [self addFace:2 withTransform:transform];
//    
//    transform = CATransform3DMakeTranslation(0, 100, 0);
//    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
//    [self addFace:3 withTransform:transform];
//    
//    transform = CATransform3DMakeTranslation(-100, 0, 0);
//    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
//    [self addFace:4 withTransform:transform];
//    
//    transform = CATransform3DMakeTranslation(0, 0, -100);
//    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
//    [self addFace:5 withTransform:transform];
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = - 1.0 / 500.0;
    self.containView.layer.sublayerTransform = pt;
    
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t,-100, 0, 0);
    CALayer *cube1 = [self cubeWithTransform:c1t];
    [self.containView.layer addSublayer:cube1];
    
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.containView.layer addSublayer:cube2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform {
    UIView *face = self.faces[index];
    [self.containView addSubview:face];
    CGSize containerSize = self.containView.bounds.size;
    face.center = CGPointMake(containerSize.width/2, containerSize.height / 2);
    face.layer.transform = transform;

}

- (CALayer *)faceWithTransform:(CATransform3D)transform {
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    CGFloat red = (rand() / (double)INT_MAX);
    CGFloat green = (rand() / (double)INT_MAX);
    CGFloat blue = (rand() / (double)INT_MAX);
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    return face;
}


- (CALayer *)cubeWithTransform:(CATransform3D)transform {
    CATransformLayer *cube = [CATransformLayer layer];
    CATransform3D ct = CATransform3DMakeTranslation(0,0,50);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct,M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(-50, 0, 0);
    ct = CATransform3DRotate(ct,-M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    CGSize containerSize = self.containView.bounds.size;
    cube.position = CGPointMake(containerSize.width / 2, containerSize.height / 2);
    cube.transform = transform;
    return cube;
}
@end
