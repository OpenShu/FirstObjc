//
//  XYLayerViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/14.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYLayerViewController.h"
#import "XYShadowViewController.h"
#import "XYTransformViewController.h"
#import "XYShapeLayerViewController.h"
#import "XYTextLayerViewController.h"
#import "XYCAGradientLayerViewController.h"
#import "XYCAReplicatorLayerViewController.h"
#import "XYCAScrollLayerController.h"
#import "XYHideAnimationViewController.h"

@interface XYLayerViewController ()

@end

@implementation XYLayerViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    self.tabBarItem.title = @"图层";
    self.tabBarItem.image = [UIImage imageNamed:@"网上值机"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.view.backgroundColor = [UIColor whiteColor];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)click {
     XYCAScrollLayerController *shadow = [[XYCAScrollLayerController alloc] init];
    [self.navigationController pushViewController:shadow animated:YES];

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
