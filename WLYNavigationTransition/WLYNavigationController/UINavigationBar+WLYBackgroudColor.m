//
//  UINavigationBar+WLYBackgroudColor.m
//  elemeNavigationBar
//
//  Created by Lane on 2016/11/16.
//  Copyright © 2016年 me.lane128. All rights reserved.
//

#import "UINavigationBar+WLYBackgroudColor.h"
#import <objc/runtime.h>

@implementation UINavigationBar (WLYBackgroudColor)

static char overlayKey;

- (UIView *)overlay {
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setCustomBackgroundColor:(UIColor *)backgroundColor{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        // insert an overlay into the view hierarchy
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height + 20)];
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.overlay.userInteractionEnabled = NO;
        
        [self insertSubview:self.overlay atIndex:1];
    }
    self.overlay.backgroundColor = backgroundColor;
}

- (void)resetToTranslucent {
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}

- (UIColor *)currentColor {
    return self.overlay.backgroundColor;
}

@end
