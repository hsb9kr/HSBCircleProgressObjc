//
//  RedCircleProgressView.m
//  imageNetwork
//
//  Created by hsb9kr on 2017. 8. 28..
//  Copyright © 2017년 hsb9kr. All rights reserved.
//

#import "HSBCircleProgressView.h"

static const CGFloat START_ANGLE = M_PI * 1.5;
static const CGFloat END_ANGLE = START_ANGLE + (M_PI * 2);

@implementation HSBCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self ) {
        [self initialize];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGFloat radius = _isAutoSize ? [self autoSize] : _radius;
    
    UIBezierPath *totalBezierPath = [UIBezierPath bezierPath];
    [totalBezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2) radius:radius startAngle:START_ANGLE endAngle:END_ANGLE clockwise:YES];
    totalBezierPath.lineWidth = _progressBarWidth;
    [_progressBarColor setStroke];
    [totalBezierPath stroke];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2) radius:radius startAngle:START_ANGLE endAngle:(END_ANGLE - START_ANGLE) * _rate + START_ANGLE clockwise:YES];
    bezierPath.lineWidth = _progressWidth;
    [_progressColor setStroke];
    [bezierPath stroke];
    
    if (_delegateFlags.rateFlag) [_delegate hsbCircleProgressView:self rate:_rate view:_view];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!_view && _delegateFlags.viewFlag) {
        [self initView];
    }
}

- (void)setRate:(CGFloat)rate {
    _rate = rate;
    [self setNeedsDisplay];
}

- (void)setDelegate:(id<HSBCircleProgressDelegate>)delegate {
    _delegate = delegate;
    _delegateFlags.viewFlag = [_delegate respondsToSelector:@selector(hsbCircleProgressView:)];
    _delegateFlags.rateFlag = [_delegate respondsToSelector:@selector(hsbCircleProgressView:rate:view:)];
}

#pragma mark <Private>

- (void)initialize {
    self.backgroundColor = UIColor.clearColor;
    _progressColor = UIColor.grayColor;
    _progressBarColor = UIColor.lightGrayColor;
}

- (void)initView {
    _view = [_delegate hsbCircleProgressView:self];
    _view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self addConstraints:@[centerXConstraint, centerYConstraint]];
}

- (CGFloat)autoSize {
    CGFloat radius = self.frame.size.width > self.frame.size.height ? self.frame.size.height / 2.5 : self.frame.size.width / 2.5;
    self.layer.cornerRadius = self.frame.size.width / 4.f;
    self.layer.masksToBounds = YES;
    _progressWidth = radius / 10.0;
    _progressBarWidth = _progressWidth;
    return radius;
}

@end
