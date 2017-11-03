//
//  RedCircleProgressView.h
//  imageNetwork
//
//  Created by hsb9kr on 2017. 8. 28..
//  Copyright © 2017년 hsb9kr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HSBCircleProgressDelegate;

IB_DESIGNABLE
@interface HSBCircleProgressView : UIView {
@private
    UIView *_view;
    struct {
        unsigned int viewFlag   :1;
        unsigned int rateFlag   :1;
    }_delegateFlags;
}
@property (weak, nonatomic) IBOutlet id<HSBCircleProgressDelegate> delegate;
@property (nonatomic) IBInspectable CGFloat rate;
@property (nonatomic) IBInspectable CGFloat radius;
@property (nonatomic) IBInspectable CGFloat progressWidth;
@property (nonatomic) IBInspectable CGFloat progressBarWidth;
@property (nonatomic) IBInspectable BOOL isAutoSize;
@property (strong, nonatomic) IBInspectable UIColor *progressColor;
@property (strong, nonatomic) IBInspectable UIColor *progressBarColor;
@end

@protocol HSBCircleProgressDelegate <NSObject>

- (UIView *)hsbCircleProgressView:(HSBCircleProgressView *)progressView;
- (void)hsbCircleProgressView:(HSBCircleProgressView *)progressView rate:(CGFloat)rate view:(UIView *)view;

@end
