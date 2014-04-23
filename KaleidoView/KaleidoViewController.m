//
//  KaleidoViewController.m
//  KaleidoView
//
//  Created by Azim Shaik on 3/6/14.
//  Copyright (c) 2014 Azim Shaik. All rights reserved.
//

#import "KaleidoViewController.h"

@interface KaleidoViewController ()

@end

@implementation KaleidoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.delay = 0.1;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    //printf(">>> %s\n", [[NSStringFromSelector(_cmd) description] UTF8String]);
    
    // Get timer, Target/Action pattern used here
    NSTimer *timer = [NSTimer timerWithTimeInterval: self.delay
                                             target: self.view
                                           selector: @selector(setNeedsDisplay)
                                           userInfo: nil
                                            repeats: YES];
    
    // Get runloop, add timer to runloop
    self.runloop = [NSRunLoop currentRunLoop];
    [self.runloop addTimer:timer forMode: NSDefaultRunLoopMode];
}

//==============================================================================
-(void) viewWillDisappear:(BOOL)animated
{
    // Clear
    self.runloop = nil;
}

//==============================================================================
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
