//
//  LayerLabel.m
//  XYGouWu
//
//  Created by shubochao on 2016/11/21.
//  Copyright © 2016年 shubochao. All rights reserved.
//

#import "LayerLabel.h"

@implementation LayerLabel
+ (Class)layerClass {
    return [CATextLayer class];
}

-(CATextLayer *)textLayer {
    return (CATextLayer *)self.layer;
}

- (void)setUp {
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    [self textLayer].alignmentMode = kCAAlignmentJustified;
    [self textLayer].wrapped = YES;
    [self.layer display];

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setText:(NSString *)text {
    super.text = text;
    [self textLayer].string = text;

}

- (void)setTextColor:(UIColor *)textColor {
    super.textColor = textColor;
    [self textLayer].foregroundColor = textColor.CGColor;
}

- (void)setFont:(UIFont *)font {
    super.font = font;
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontReft = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontReft;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontReft);
}

@end
