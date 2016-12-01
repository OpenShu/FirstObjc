//
//  XYTextLayerViewController.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/18.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "XYTextLayerViewController.h"
#import <CoreText/CoreText.h>
@interface XYTextLayerViewController ()

@end

@implementation XYTextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    CATextLayer *textLayer = [CATextLayer layer];
//    textLayer.frame = self.labelView.bounds;
//    [self.labelView.layer addSublayer:textLayer];
//    textLayer.foregroundColor = [UIColor redColor].CGColor;
//    textLayer.alignmentMode = kCAAlignmentJustified;
//    textLayer.wrapped = YES;
//    UIFont *font = [UIFont systemFontOfSize:15];
////    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
////    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
////    textLayer.contentsScale = [UIScreen mainScreen].scale;
////    textLayer.font = fontRef;
//    NSMutableAttributedString *string = nil;
//    NSString *text = @"aasddbcbzcjnjnjhabhvcvchavcavchjvcvhvcjvchjdscjhsvcsvchjvsj";
//    string = [[NSMutableAttributedString alloc] initWithString:text];
//    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
//    CGFloat fontSize = font.pointSize;
//    CTFontRef fontReft = CTFontCreateWithName(fontName,fontSize,NULL);
//    NSDictionary *atrribs = @{(__bridge id)kCTForegroundColorAttributeName:(__bridge id)[UIColor blackColor].CGColor,(__bridge id)kCTFontAttributeName: (__bridge id)fontReft};
////    [string setAttributedString:atrribs range:NSMakeRange(0, [text length])];
    
    
    
  
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
