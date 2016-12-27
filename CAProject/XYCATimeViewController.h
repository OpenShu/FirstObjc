//
//  XYCATimeViewController.h
//  CAProject
//
//  Created by shubochao on 2016/12/21.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYCATimeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
- (IBAction)play:(id)sender;
@end
