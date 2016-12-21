//
//  XYShowActionViewController.h
//  CAProject
//
//  Created by shubochao on 2016/12/16.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYShowActionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *layerView;
- (IBAction)clickBTn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *AnimationImageView;
- (IBAction)imageBtn:(id)sender;

@end
