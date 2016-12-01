//
//  XYThirdViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/14.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYThirdViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface XYThirdViewController ()

@end

@implementation XYThirdViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.tabBarItem.title = @"三方";
        self.tabBarItem.image = [UIImage imageNamed:@"网上值机"];
        NSLog(@"test commit");
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {

    self.view.backgroundColor  = [UIColor yellowColor];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    CLLocation *location=[[CLLocation alloc]initWithLatitude:40.13
                                                   longitude:117.10];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
  
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error){
        if (error) {
            NSLog(@"%@",error.description);
           
        } else {
            NSLog(@"%@",placemarks[0].locality);
        }
    }];

    // Do any additional setup after loading the view.
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
