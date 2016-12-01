//
//  XYCAScrollLayerController.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/24.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYCAScrollLayerController.h"


@interface XYCAScrollLayerController ()

@end

@implementation XYCAScrollLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollLayerView.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:self.scrollLayerView];
    
}

- (XYScrollLayerView *)scrollLayerView {
    if (!_scrollLayerView) {
        [[NSBundle mainBundle] loadNibNamed:@"scroller" owner:self options:nil];
    }
    return _scrollLayerView;
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
