//
//  ViewController.m
//  test
//
//  Created by User on 15/1/12.
//  Copyright (c) 2015年 wzl. All rights reserved.
//

#import "ViewController.h"
#import "panelView.h"

#define kRetainCount(x)     NSLog(@"%@ retainCount:%d", x, [x retainCount])


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews
{
    panelView *panel = [[panelView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 60,
                                                             CGRectGetWidth(self.view.frame), 60)];
    panel.backgroundColor = [UIColor redColor];
    panel.userInteractionEnabled = YES;
    [self.view addSubview:panel];
    [panel release];
    panel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin| UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"...");
    
    return self.view;
}

@end
