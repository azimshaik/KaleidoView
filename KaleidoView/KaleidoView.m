//
//  KaleidoView.m
//  KaleidoView
//
//  Created by Azim Shaik on 3/6/14.
//  Copyright (c) 2014 Azim Shaik. All rights reserved.
//

#import "KaleidoView.h"

@implementation KaleidoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // Debug output off/on
        //self.debug = NO;
        
        // Area to draw in
        CGRect bounds = [self bounds];
        
        
        
        // Initialize properties
        //self.rect_x          =  160;
        //self.rect_y          =  240;
        //self.rect_x = (CGFloat) (random() % 320);
        //self.rect_y = (CGFloat) (random() % 568);
        //self.rect_x=5.0;
        //self.rect_y=10.0;
        //self.rect_x2         = 320-self.rect_x;
        //self.rect_y2         = self.rect_y;
        //self.rect_x3         = 320-self.rect_x;
        //self.rect_y3         = 480-self.rect_y;
        //self.rect_x4         = self.rect_x;
        //self.rect_y4         = 480-self.rect_y;
        
        
        self.rect_width      = 10.0;
        self.rect_height     = 30.0;
        self.line_width      =  2.0;
        self.view_width      = bounds.size.width;
        self.view_height     = bounds.size.height;
        self.rect_width_min  =  5;
        self.rect_width_max  = 40;
        self.rect_height_min =  5;
        self.rect_height_max = 40;
        
        // Create ivar layer
        CGContextRef context = UIGraphicsGetCurrentContext();
        drawLayer = CGLayerCreateWithContext(context,
                                             CGSizeMake(bounds.size.width, bounds.size.height), NULL);
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Draw to the layer
    [self drawToLayer];
    
    // Get the context being draw upon
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    CGPoint center;
    center.x=bounds.origin.x+bounds.size.width/2.0;
    center.y=bounds.origin.y+bounds.size.height/2.0;
    //printf("%f",center.x);
    //printf("%f",center.y);
    // Copy layer to context
    CGContextDrawLayerInRect (context, [self bounds], drawLayer);
}

-(void) drawToLayer
{
    //NSLog(@">>> %@", NSStringFromSelector(_cmd) );
    
    // Random values for color RGB, alpha
    CGFloat red   = 1.0 - (CGFloat)((random() % 100) / 100.0);
    CGFloat green = 1.0 - (CGFloat)((random() % 100) / 100.0);
    CGFloat blue  = 1.0 - (CGFloat)((random() % 100) / 100.0);
    CGFloat alpha = 1.0 - (CGFloat)((random() % 100) / 100.0);
    
    // Create the color
    UIColor *color = [UIColor colorWithRed:red
                                     green:green
                                      blue:blue
                                     alpha:alpha];
    
    // Random location
    /*self.rect_x = (CGFloat) (random() % (int) self.view_width);
     self.rect_y = (CGFloat) (random() % (int) self.view_height);
     self.rect_x2 = (CGFloat) (random() % (int) self.view_width);
     self.rect_y2 = (CGFloat) (random() % (int) self.view_height);
     self.rect_x3 = (CGFloat) (random() % (int) self.view_width);
     self.rect_y3 = (CGFloat) (random() % (int) self.view_height);
     self.rect_x4 = (CGFloat) (random() % (int) self.view_width);
     self.rect_y4 = (CGFloat) (random() % (int) self.view_height);*/
    
    //self.rect_x = (CGFloat) ((int)self.view_width/2);
    //self.rect_y = (CGFloat) ((int)self.view_height/2);
    
    self.rect_x          =  random()%160;
    printf("rect_x=%f",_rect_x);
    printf("\n");
    self.rect_y          =  random()%480;
    printf("rect_y=%f",_rect_y);
    // self.rect_x = (CGFloat) (random() % 160);
    printf("%f",self.view_height);printf("\n");
    printf("%f",self.view_width);printf("\n");
    
    
    
    
    //self.rect_y = (CGFloat) (random() % 280);
    self.rect_x2 = (CGFloat) self.view_width-self.rect_x;
    printf("rect_x2=%f",_rect_x2);printf("\n");
    self.rect_y2 = (CGFloat) self.rect_y;
    printf("rect_y2=%f",_rect_y2);printf("\n");
    self.rect_x3 = (CGFloat) self.view_width-self.rect_x;
    printf("rect_x3=%f",_rect_x3);printf("\n");
    self.rect_y3 = (CGFloat) self.view_height-self.rect_y;
    printf("rect_y3=%f",_rect_y3);printf("\n");
    self.rect_x4 = (CGFloat) self.rect_x;
    printf("rect_x4=%f",_rect_x4);printf("\n");
    self.rect_y4 = (CGFloat) self.rect_x3;
    printf("rect_y4=%f",_rect_y4);printf("\n");
    
    /*rect_x2=320-rect_x;
     rect_y2=rect_y;
     
     rect_x3=320-rect_x;
     rect_y3=480-rect_y;
     rect_x4=rect_x;
     rect_y4=480-rect_y;*/
    
    
    
    // Random size
    self.rect_width  = (CGFloat) (self.rect_width_min  + random() % self.rect_width_max);
    self.rect_height = (CGFloat) (self.rect_height_min + random() % self.rect_height_max);
    
    // Create the rectangle
    CGRect rect_1 = {self.rect_x, self.rect_y, self.rect_width, self.rect_height};
    CGRect rect_2 = {self.rect_x2, self.rect_y2,self.rect_width,self.rect_height};
    CGRect rect_3 = {self.rect_x3, self.rect_x3,self.rect_width,self.rect_height};
    CGRect rect_4 = {self.rect_x4, self.rect_y4,self.rect_width,self.rect_height};
    // CGContextDrawPath(context, kCGPathFill);
    // Debug
    if(self.debug)
        printf(">>> %s (%f, %f) %f %f\n", [[NSStringFromSelector(_cmd) description] UTF8String],
               self.rect_x, self.rect_y, self.rect_width, self.rect_height);
    
    // Call the drawing function
    
    [self drawRectUsing:rect_1 withColor:color];
    [self drawRectUsing:rect_2 withColor:color];
    [self drawRectUsing:rect_3 withColor:color];
    [self drawRectUsing:rect_4 withColor:color];
}

//==============================================================================
-(void) drawRectUsing:(CGRect) cgrect withColor:(UIColor *)color
{
    if (self.debug)
        
        //NSLog(@">>> %@, %@", NSStringFromSelector(_cmd), color );
        printf("### %s, %s\n", [[NSStringFromSelector(_cmd) description] UTF8String], [[color description]UTF8String]);
    
    // Get layer context
    CGContextRef layer_context = CGLayerGetContext (drawLayer);
    
    // Set line width, not meaningful if fill
    CGFloat line_width = 5.0;
    CGContextSetLineWidth(layer_context, line_width);
    
    // Get color components, note the address-of operator &
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    // Color
    CGContextSetRGBFillColor (layer_context, red, green, blue, alpha);
    CGContextSetRGBStrokeColor (layer_context, red, green, blue, alpha);
    
    // Draw rectangle
    CGContextAddRect(layer_context, cgrect);
    //CGContextSetFillColorWithColor(context, fillcolor);
    
    
    CGContextDrawPath(layer_context, kCGPathFill);
}

@end
