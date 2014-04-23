//
//  KaleidoView.h
//  KaleidoView
//
//  Created by Azim Shaik on 3/6/14.
//  Copyright (c) 2014 Azim Shaik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KaleidoView : UIView
{
    CGLayerRef drawLayer;
}

@property (nonatomic) CGFloat    rect_x;
@property (nonatomic) CGFloat    rect_y;
@property (nonatomic) CGFloat   rect_x2;
@property (nonatomic) CGFloat   rect_y2;
@property (nonatomic) CGFloat   rect_x3;
@property (nonatomic) CGFloat   rect_y3;
@property (nonatomic) CGFloat   rect_x4;
@property (nonatomic) CGFloat   rect_y4;
@property (nonatomic) CGFloat    rect_width;
@property (nonatomic) CGFloat    rect_height;
@property (nonatomic) CGFloat    view_width;
@property (nonatomic) CGFloat    view_height;
@property (nonatomic) CGFloat    line_width;
@property (nonatomic) NSInteger  rect_width_min;
@property (nonatomic) NSInteger  rect_width_max;
@property (nonatomic) NSInteger  rect_height_min;
@property (nonatomic) NSInteger  rect_height_max;
@property (nonatomic) BOOL       debug;

-(void) drawToLayer;
-(void) drawRectUsing:(CGRect)cgrect withColor:(UIColor *)color;

@end
