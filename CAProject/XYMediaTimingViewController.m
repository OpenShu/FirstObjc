//
//  XYMediaTimingViewController.m
//  CAProject
//
//  Created by shubochao on 2016/12/23.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYMediaTimingViewController.h"
#import "Masonry.h"

@interface XYMediaTimingViewController ()
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation XYMediaTimingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 约束
    self.layerView.backgroundColor = [UIColor blueColor];
    __weak XYMediaTimingViewController * weakSelf =  self;
    [_layerView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong XYMediaTimingViewController *strongSelf = weakSelf;
        make.center.equalTo(strongSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
//    UIView *inView = [[UIView alloc] init];
//    inView.backgroundColor = [UIColor greenColor];
//    [self.layerView addSubview:inView];
//    [inView mas_makeConstraints:^(MASConstraintMaker *make) {
//      __strong XYMediaTimingViewController *strongSelf = weakSelf;
//        make.edges.equalTo(strongSelf.layerView).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
//    _layerView1.backgroundColor = [UIColor yellowColor];
//    [_layerView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        __strong XYMediaTimingViewController *strongSelf = weakSelf;
//        make.left.equalTo(strongSelf.view.mas_left).with.offset(10);
//        make.bottom.equalTo(strongSelf.layerView.mas_top).with.offset(-20);
//        make.height.mas_equalTo(60);
//        make.width.mas_equalTo(100);
//    }];
//    
//    
//    [self createPath];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.layerView addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong XYMediaTimingViewController *strongSelf = weakSelf;
        make.edges.equalTo(strongSelf.layerView).width.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    UIView *containView = [UIView new];
    [scrollView addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    int count = 10;
    UIView *lastView = nil;
    for (int i = 1; i <= count ; i++) {
        UIView *subv = [UIView new];
        [containView addSubview:subv];
        CGFloat red = (rand() / (double)INT_MAX);
        CGFloat green = (rand() / (double)INT_MAX);
        CGFloat blue = (rand() / (double)INT_MAX);
        subv.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(containView);
            make.height.mas_equalTo(@(20*i));
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            } else {
                make.top.mas_equalTo(containView.mas_top);
            }
            
        }];
        lastView = subv;
    }
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTest {
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(100, 100, 100, 100);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    self.colorLayer.position = [[touches anyObject] locationInView:self.view];
    [CATransaction commit];

}

- (void)createPath {
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    CGPoint point1,point2;
    [fn getControlPointAtIndex:1 values:(float *)&point1];
    [fn getControlPointAtIndex:2 values:(float *)&point2];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:CGPointMake(1, 1) controlPoint1:point1 controlPoint2:point2];
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 4.0f;
    shapeLayer.path = path.CGPath;
    [self.layerView.layer addSublayer:shapeLayer];
    self.layerView.layer.geometryFlipped = YES;
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
