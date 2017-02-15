//
//  panelView.m
//  test
//
//  Created by User on 15/1/23.
//  Copyright (c) 2015年 wzl. All rights reserved.
//

#import "panelView.h"

@implementation panelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews
{
    UIButton *roundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    roundBtn.frame = CGRectMake(self.frame.size.width / 2 - 30, -30, 60, 60);
    roundBtn.backgroundColor = [UIColor blueColor];
    roundBtn.layer.cornerRadius = 30;
    roundBtn.tag = 10086;
    [roundBtn addTarget:self action:@selector(onBtnPressed:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:roundBtn];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 15, 30, 30);
    leftBtn.backgroundColor = [UIColor blueColor];
    leftBtn.tag = 10087;
    [leftBtn addTarget:self action:@selector(onBtnPressed:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(self.frame.size.width - 30, 15, 30, 30);
    rightBtn.backgroundColor = [UIColor blueColor];
    rightBtn.tag = 10088;
    [rightBtn addTarget:self action:@selector(onBtnPressed:)
       forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = nil;
    //NSLog(@"point:%@", NSStringFromCGPoint(point));
    UIButton *roundBtn = (UIButton *)[self viewWithTag:10086];
    UIButton *leftBtn = (UIButton *)[self viewWithTag:10087];
    UIButton *rightBtn = (UIButton *)[self viewWithTag:10088];
    BOOL pointInRound = [self touchPointInsideCircle:roundBtn.center radius:30 targetPoint:point];
    if (pointInRound) {
        hitView = roundBtn;
    } else if(CGRectContainsPoint(leftBtn.frame, point)) {
        hitView  = leftBtn;
    } else if(CGRectContainsPoint(rightBtn.frame, point)) {
//        hitView = rightBtn;
        [self pan];
    } else {
        hitView = self;
    }
    return hitView;
}

- (BOOL)touchPointInsideCircle:(CGPoint)center radius:(CGFloat)radius targetPoint:(CGPoint)point
{
    CGFloat dist = sqrtf((point.x - center.x) * (point.x - center.x) +
                         (point.y - center.y) * (point.y - center.y));
    return (dist <= radius);
}


- (void)onBtnPressed:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"btn tag:%d", btn.tag);
}

- (void)pan{
    NSLog(@"1233456778");

}
@end
