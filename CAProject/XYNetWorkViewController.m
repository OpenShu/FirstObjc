//
//  XYNetWorkViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/14.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYNetWorkViewController.h"


@interface XYNetWorkViewController ()
@property (nonatomic, copy) NSString *appendStr;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end

@implementation XYNetWorkViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.image = [UIImage imageNamed:@"预约选座"];
        self.tabBarItem.title = @"网络";
       
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor  = [UIColor blueColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
