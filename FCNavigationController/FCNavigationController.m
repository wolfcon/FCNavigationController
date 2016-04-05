//
//  FCNavigationController.m
//  
//
//  Created by Frank on 11/14/15.
//  Copyright © 2015 Frank. All rights reserved.
//

#import "FCNavigationController.h"

@interface FCNavigationController () {
    BOOL _changing;
    UIView *alphaView;
}

@end

static CGFloat const defaultDuration = 0.5;

@implementation FCNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        CGRect frame = self.navigationBar.frame;
        alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height + 20)];
        alphaView.backgroundColor = [UIColor topViewColor];
        [self.view insertSubview:alphaView belowSubview:self.navigationBar];
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"backgroundImageAlpha0.png"] forBarMetrics:UIBarMetricsCompact];
        self.navigationBar.layer.masksToBounds = YES;
    }
    
    return self;
}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    [super setNavigationBarHidden:hidden animated:animated];
    
    alphaView.hidden = hidden;
}

- (void)switchTransparentWithMinAlpha:(CGFloat)minAlpha maxAlpha:(CGFloat)maxAlpha {
    [self switchTransparentWithMinAlpha:minAlpha maxAlpha:maxAlpha duration:defaultDuration];
}

- (void)switchTransparentWithMinAlpha:(CGFloat)minAlpha maxAlpha:(CGFloat)maxAlpha duration:(CGFloat)duration {
    if (_changing == NO) {
        CGFloat alpha = (alphaView.alpha == minAlpha) ? maxAlpha : minAlpha;
        
        [self setBackgroundAlpha:alpha animated:YES];
    }
}

- (void)setBackgroundAlpha:(CGFloat)alpha animated:(BOOL)animated {
    [self setBackgroundAlpha:alpha animationDuration:defaultDuration];
}

- (void)setBackgroundAlpha:(CGFloat)alpha {
    [self setBackgroundAlpha:alpha animated:NO];
}

- (void)setBackgroundAlpha:(CGFloat)alpha animationDuration:(CGFloat)duration {
    if (duration != 0) {
        _changing = YES;
        
        [UIView animateWithDuration:duration animations:^{
            alphaView.alpha = alpha;
        } completion:^(BOOL finished) {
            _changing = NO;
        }];
    } else {
        alphaView.alpha = alpha;
    }
}

@end
